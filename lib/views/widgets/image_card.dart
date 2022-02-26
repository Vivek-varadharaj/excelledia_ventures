import 'package:cached_network_image/cached_network_image.dart';
import 'package:excelledia_ventures/models/image_model.dart';
import 'package:excelledia_ventures/views/screens/full_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageCard extends StatelessWidget {
  final ImageModel imageModel;
  const ImageCard({Key? key, required this.imageModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          placeholder: (context, url) => Shimmer.fromColors(
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
            ),
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.grey.shade400,
          ),
          errorWidget: (context, url, child) => Container(),
        ),
      ),
    );
  }
}
