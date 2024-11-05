
import 'package:apifinal/constant/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DownloadsImages extends StatelessWidget {
  DownloadsImages(
      {super.key,
      required this.angle, 
      required this.margin, 
      required this.data});

  final double angle;
  final EdgeInsets margin;
  String data;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Transform.rotate(
      angle: angle,
      child: Container(
        margin: margin,
        width: width * 0.4,
        height: height * 0.3,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            '$imageurl$data',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
