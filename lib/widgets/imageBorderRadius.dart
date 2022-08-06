import 'package:flutter/material.dart';

class ImageBorderRadius extends StatelessWidget {
  final String src;
  const ImageBorderRadius({Key? key, required this.src}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          src,
        ),
      ),
    );
  }
}
