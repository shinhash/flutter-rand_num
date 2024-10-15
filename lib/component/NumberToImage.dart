import 'package:flutter/material.dart';

class NumberToImage extends StatefulWidget {
  final int number;
  const NumberToImage({super.key, required this.number});

  @override
  State<NumberToImage> createState() => _NumberToImageState();
}

class _NumberToImageState extends State<NumberToImage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.number.toString().split('')
          .map((number) => Image.asset(
        'asset/img/${number}.png',
        width: 50,
        height: 50,
      )).toList(),
    );
  }
}
