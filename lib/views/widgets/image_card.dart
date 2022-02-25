import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width *0.3 ,
      height: size.width *0.3,
      
    );
  }
}