import 'package:flutter/material.dart';

class DetailInfo extends StatelessWidget {
  final String genre;
  final String title;
  final String date;
  final String overview;

  const DetailInfo({
    super.key,
    required this.genre,
    required this.title,
    required this.date,
    required this.overview,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: const TextStyle(color: Colors.grey, fontSize: 18),
                ),
                SizedBox(
                  width: 256,
                  child: Text(
                    genre,
                    maxLines: 2,
                    style: const TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            overview,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          )
        ],
      ),
    );
  }
}
