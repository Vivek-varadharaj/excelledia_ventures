import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String url;
  const ImageCard({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.3,
      height: size.width * 0.3,
      child: Image.network(
        url,
        errorBuilder: ((context, error, stackTrace) => Container()),
      ),
    );
  }
}
