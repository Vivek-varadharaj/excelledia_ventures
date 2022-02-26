import 'package:excelledia_ventures/models/image_model.dart';
import 'package:flutter/material.dart';

class FullScreenView extends StatelessWidget {
  final ImageModel imageModel;
  const FullScreenView({Key? key, required this.imageModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Image.network(
          imageModel.largeImageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
