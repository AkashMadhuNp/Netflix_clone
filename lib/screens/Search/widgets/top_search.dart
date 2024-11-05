import 'package:apifinal/constant/utils.dart';
import 'package:apifinal/models/movie_model.dart';
import 'package:apifinal/screens/Details/movie_detail.dart';
import 'package:apifinal/screens/Home/home_screen.dart';
import 'package:flutter/material.dart';

class TopSearch extends StatelessWidget {
  final List<Movie>? movies;
  const TopSearch({super.key,required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),

       const Text(
        "Top Searches",
        style: TextStyle(fontWeight: FontWeight.bold),),
        const SizedBox(height: 20,),

        ListView.builder(
          itemCount: movies?.length,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final movie = movies![index];

           return InkWell(
              onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => MovieDetail(id: movie.id,),)),
              child: Container(
                height: 150,
                padding:  const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Row(
                  children: [
                    Image.network("$imageurl${movie.posterPath}"),
                    const SizedBox(
                      width: 20,
                    ),

                    SizedBox(
                      width: 260,
                      child: Text(
                        movie.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
              ),

            );
          },)
      ],
    );
  }
}