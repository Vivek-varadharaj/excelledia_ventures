import 'package:excelledia_ventures/controllers/image_controller.dart';
<<<<<<< HEAD
import 'package:excelledia_ventures/models/image_model.dart';
=======
>>>>>>> 3c9bceb9da51ef02e2a62060c61fee372f256075

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

<<<<<<< HEAD
  final TextEditingController _searchController = TextEditingController();

  int index = 1;

  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        index = index + 1;

        print(_imageController.isLoading);
        await _imageController.fetchImages(_searchController.text, index);
      }
    });
  }
=======
  final TextEditingController _controller = TextEditingController();
>>>>>>> 3c9bceb9da51ef02e2a62060c61fee372f256075

  int index = 1;

  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        index = index + 1;
        _imageController.fetchImages(_controller.text, index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Excelledia Ventures!"),
        ),
        backgroundColor: kLightBackgroundColor,
        body: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 16,
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
                  return Expanded(
<<<<<<< HEAD
                      child: horizontalPadding(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      physics: const BouncingScrollPhysics(),
                      controller: _scrollController,
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      children: [
                        ..._imageController.image.map(
                            (imageModel) => ImageCard(imageModel: imageModel)),
                      ],
                    ),
=======
                      child: GridView.count(
                    physics: BouncingScrollPhysics(),
                    controller: _scrollController,
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    children: [
                      ..._imageController.image!
                          .map((e) => ImageCard(url: e.url)),
                    ],
>>>>>>> 3c9bceb9da51ef02e2a62060c61fee372f256075
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
<<<<<<< HEAD
  void onTap() async {
    index = 1;
    _imageController.image = [];

    await _imageController.fetchImages(_searchController.text, index);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _imageController.dispose();
    _searchController.dispose();
    _scrollController.dispose();
=======
  void onTap() {
    index = 1;
    _imageController.image = [];
    _imageController.fetchImages(_controller.text, index);
>>>>>>> 3c9bceb9da51ef02e2a62060c61fee372f256075
  }
}
