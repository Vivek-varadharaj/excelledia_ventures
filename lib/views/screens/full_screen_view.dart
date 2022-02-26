import 'package:cached_network_image/cached_network_image.dart';
import 'package:excelledia_ventures/models/image_model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FullScreenView extends StatelessWidget {
  final ImageModel imageModel;
  const FullScreenView({Key? key, required this.imageModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
