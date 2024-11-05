import 'package:apifinal/constant/utils.dart';
import 'package:apifinal/models/movie_model.dart';
import 'package:apifinal/screens/Details/movie_detail.dart';
import 'package:flutter/material.dart';

class Recommended extends StatelessWidget {
  const Recommended({
    super.key,
    required this.recomendation,
  });

  final Future<List<Movie>> recomendation;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: recomendation,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          } else if (!snapshot.hasData ||
              snapshot.data == null ||
              snapshot.data!.isEmpty) {
            return const Text('No Details');
          }
          return snapshot.data!.isEmpty
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'More like this',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: GridView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: snapshot.data!.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8,
                                    childAspectRatio: 0.6),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MovieDetail(
                                              id: snapshot.data![index].id)));
                                },
                                child: AspectRatio(
                                  aspectRatio: 0.7,
                                  child: Column(
                                    children: [
                                      Image.network(
                                          '$imageurl${snapshot.data![index].posterPath}'),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                );
        });
  }
}
