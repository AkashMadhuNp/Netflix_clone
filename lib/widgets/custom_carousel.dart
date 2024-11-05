import 'package:apifinal/constant/utils.dart';
import 'package:apifinal/models/movie_model.dart';
import 'package:apifinal/screens/Details/movie_detail.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarousel extends StatelessWidget {
  final List<Movie> data;
  const CustomCarousel({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: height * 0.35,
      child: CarouselSlider.builder(
        itemCount: data.length, 
        itemBuilder: (context, index, realIndex) {
          var url=data[index].backdropPath;
          return GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieDetail(id: data[index].id,),)),
            child: Column(
              children: [
                Image.network(
                  "$imageurl$url",
                  fit: BoxFit.cover,
                  ),

                  const SizedBox(height: 20,),

                  Text(data[index].title,
                  style:const TextStyle(fontSize: 20),
                  )
              ],
            ),

          );
        }, 
        options: CarouselOptions(
          height: height*0.35,
          aspectRatio: 16 / 9,
          reverse: false,
          initialPage: 0,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          enlargeCenterPage: true

        )),
    );
  }
}