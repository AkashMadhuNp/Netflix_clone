import 'package:apifinal/constant/utils.dart';
import 'package:apifinal/models/movie_model.dart';
import 'package:apifinal/screens/Details/movie_detail.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final Future<List<Movie>> movie;
  final String headline;
  const MovieCard({super.key, required this.movie, required this.headline});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: movie,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData ||
              snapshot.data == null ||
              snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No movies'),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headline,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final data = snapshot.data![index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetail(id: data.id)));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.network('$imageurl${data.posterPath}'),
                      ),
                    );
                  },
                ))
              ],
            ),
          );
        });
  }
}
