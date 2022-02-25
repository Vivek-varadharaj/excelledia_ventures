import 'package:excelledia_ventures/controllers/image_controller.dart';
import 'package:excelledia_ventures/models/image_model.dart';
import 'package:excelledia_ventures/utils/styles.dart';
import 'package:excelledia_ventures/views/widgets/custom_button.dart';
import 'package:excelledia_ventures/views/widgets/image_card.dart';
import 'package:excelledia_ventures/views/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final _imageController = Get.put(ImageController());
  final TextEditingController _controller = TextEditingController();

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
                  child: SearchField(controller: _controller),
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
    _imageController.fetchImages(_controller.text);
  }
}
