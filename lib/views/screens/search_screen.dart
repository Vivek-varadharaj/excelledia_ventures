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

  final TextEditingController _controller = TextEditingController();

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
        backgroundColor: kLightBackgroundColor,
        body: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            horizontalPadding(
                child: Row(
              children: [
                Expanded(
                  child:
                      SearchField(controller: _controller, onSubmitted: onTap),
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomButton(title: "Search", onTap: onTap)
              ],
            )),
            GetBuilder<ImageController>(
                init: _imageController,
                builder: (_imageController) {
                  return Expanded(
                      child: GridView.count(
                    physics: BouncingScrollPhysics(),
                    controller: _scrollController,
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    children: [
                      ..._imageController.image!
                          .map((e) => ImageCard(url: e.url)),
                    ],
                  ));
                })
          ],
        ),
      ),
    );
  }

  // functions
  void onTap() {
    index = 1;
    _imageController.image = [];
    _imageController.fetchImages(_controller.text, index);
  }
}
