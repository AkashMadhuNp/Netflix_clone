import 'package:apifinal/models/movie_details.dart';
import 'package:apifinal/models/movie_model.dart';
import 'package:apifinal/screens/Details/widgets/detail_image.dart';
import 'package:apifinal/screens/Details/widgets/detail_info.dart';
import 'package:apifinal/screens/Details/widgets/recommended.dart';
import 'package:apifinal/services/api_service.dart';
import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  final int id;
  const MovieDetail({super.key, required this.id});

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  late Future<MovieDetailModel> details;
  late Future<List<Movie>> recomendation;

  @override
  void initState() {
    super.initState();
    details = Api().getDetails(widget.id);
    recomendation = Api().getRecommendation(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: details,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              } else if (!snapshot.hasData ||
                  snapshot.data == null ) {
                // log(snapshot.data.toString());

                return const Text('No Details');
              }
              String genre = snapshot.data!.genres
                  .map((genre) => genre.name)
                  .join(',');
              return Column(
                children: [
                  DetailImage(
                    height: height,
                    posterPath: snapshot.data!.posterPath,
                  ),
                  DetailInfo(
                      genre: genre,
                      title: snapshot.data!.title,
                      date: snapshot.data!.releaseDate.year.toString(),
                      overview: snapshot.data!.overview),
                  const SizedBox(
                    height: 30,
                  ),

                  Recommended(recomendation: recomendation)
                  
                ],
              );
            }),
      ),
    );
  }
}
