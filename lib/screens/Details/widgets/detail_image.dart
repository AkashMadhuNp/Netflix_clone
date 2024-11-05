import 'package:apifinal/constant/utils.dart';
import 'package:flutter/material.dart';

class DetailImage extends StatelessWidget {
  final String posterPath;
  const DetailImage({
    super.key,
    required this.height,
    required this.posterPath,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height * 0.45,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('$imageurl$posterPath'))),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
