// project packages
import 'package:excelledia_ventures/models/image_model.dart';
import 'package:excelledia_ventures/utils/styles.dart';

// flutter packages
import 'package:flutter/material.dart';

// outside libraries
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FullScreenView extends StatelessWidget {
  final ImageModel imageModel;
  const FullScreenView({Key? key, required this.imageModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: kPrimaryColor,
          title: const Text("Full Screen")),
      backgroundColor: kPrimaryColor,
      body: Center(
        child: CachedNetworkImage(
          imageUrl: imageModel.largeImageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => Shimmer.fromColors(
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: 300,
            ),
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.grey.shade400,
          ),
        ),
      ),
    );
  }
}
