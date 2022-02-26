
import 'package:excelledia_ventures/models/image_model.dart';
import 'package:excelledia_ventures/views/screens/full_screen_view.dart';

// flutter package
import 'package:flutter/material.dart';

// outside libraries
import 'package:shimmer/shimmer.dart';// for shimmer
import 'package:cached_network_image/cached_network_image.dart';// image displaying

class ImageCard extends StatelessWidget {
  final ImageModel imageModel;
  const ImageCard({Key? key, required this.imageModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showBottomSheet(
            backgroundColor: Colors.grey.withOpacity(0.8),
            context: context,
            builder: (context) =>
                Center(child: FullScreenView(imageModel: imageModel)));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        clipBehavior: Clip.hardEdge,
        elevation: 3,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: imageModel.previewUrl,
          // added shimmer to hold the place till image gets loaded from
          // the url
          placeholder: (context, string) => Shimmer.fromColors(
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
            ),
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.grey.shade400,
          ),

          // error widget for showing the user error occured
          errorWidget: (context, url, child) => const Center(child: Text("An error occured")),
        ),
      ),
    );
  }
}
