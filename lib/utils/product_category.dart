import 'package:flutter/material.dart';


class ProductCategory extends StatelessWidget {
  final title;
  final image;

  const ProductCategory({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(color: Colors.red),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(100)),
          child: Image.asset('$image'),
        ),
        Text('$title')
      ]),
    );
  }
}