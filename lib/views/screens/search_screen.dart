import 'package:excelledia_ventures/controllers/image_controller.dart';

import 'package:excelledia_ventures/utils/styles.dart';
import 'package:excelledia_ventures/views/widgets/custom_button.dart';
import 'package:excelledia_ventures/views/widgets/image_card.dart';
import 'package:excelledia_ventures/views/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _imageController = Get.put(ImageController());

  final TextEditingController _searchController = TextEditingController();

  int index = 1;

  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        index = index + 1;

        _imageController.fetchImages(_searchController.text, index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                horizontalPadding(
                    child: Text(
                  "Excelledia Ventures!",
                  style: appBarHeading,
                )),
                const SizedBox(
                  height: 20,
                ),
                horizontalPadding(
                    child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: SearchField(
                            controller: _searchController, onSubmitted: onTap),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomButton(title: "Search", onTap: onTap)
                  ],
                )),
                const SizedBox(
                  height: 15,
                ),
                GetBuilder<ImageController>(builder: (_imageController) {
                  if (_imageController.image.isEmpty) {
                    return Center(
                      child: Text(
                        "Please search",
                        style: TextStyle(color: kSecondaryColor),
                      ),
                    );
                  }
                  return Expanded(
                      child: horizontalPadding(
                    child: GridView.count(
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      physics: const BouncingScrollPhysics(),
                      controller: _scrollController,
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      children: [
                        ..._imageController.image.map(
                            (imageModel) => ImageCard(imageModel: imageModel)),
                      ],
                    ),
                  ));
                }),
              ],
            ),
            GetBuilder<ImageController>(builder: (_imageController) {
              return _imageController.isLoading
                  ? Positioned.fill(
                      child: Container(
                          color: Colors.grey.withOpacity(0.3),
                          alignment: AlignmentDirectional.center,
                          child: const CircularProgressIndicator()))
                  : Container();
            })
          ],
        ),
      ),
    );
  }

  // functions
  void onTap() async {
    index = 1;
    _imageController.image = [];

    await _imageController.fetchImages(_searchController.text, index);
  }

  @override
  void dispose() {
    super.dispose();
    _imageController.dispose();
    _searchController.dispose();
    _scrollController.dispose();
  }
}
