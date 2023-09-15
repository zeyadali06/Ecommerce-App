// ignore_for_file: file_names, must_be_immutable
import 'package:flutter/material.dart';

class Ratingbar extends StatelessWidget {
  late int FullStars;
  late int HalfStars;
  final double rating;
  Ratingbar({super.key, required this.rating}) {
    FullStars = rating.toInt();
    HalfStars = ((rating - FullStars) * 2).toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        if (index < FullStars) {
          return const Icon(
            Icons.star,
            size: 40,
            color: Color.fromRGBO(255, 193, 7, 1),
          );
        } else if (index < FullStars + HalfStars) {
          return const Icon(
            Icons.star_half,
            size: 40,
            color: Color.fromRGBO(255, 193, 7, 1),
          );
        } else {
          return const Icon(Icons.star_border, size: 40, color: Colors.grey);
        }
      }),
    );
  }
}
