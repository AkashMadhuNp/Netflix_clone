import 'package:apifinal/Services/api_service.dart';
import 'package:apifinal/models/movie_model.dart';
import 'package:apifinal/screens/Search/search_screen.dart';
import 'package:apifinal/widgets/custom_carousel.dart';
import 'package:apifinal/widgets/movie_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> upcoming;
  late Future<List<Movie>> nowplaying;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    upcoming=Api().getUpcomingMovies();
    nowplaying=Api().getNowPlaying();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          "assets/logo.png",
          height: 80,
          width: 120,
          ),
          actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              child: const Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                color: Colors.blue,
                height: 27,
                width: 27,
              ),
            ),
          ),
        ]
      ),


      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: upcoming, 
              builder: (context, snapshot) {
                if(snapshot.hasError){
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }else if(snapshot.hasData){
                  return CustomCarousel(data: snapshot.data!);
                }else{
                  return const SizedBox.shrink();
                }
              },),

              SizedBox(
                height: 220,
                child: MovieCard(movie: upcoming, headline: "Up Coming"),
              ),

               SizedBox(
                height: 220,
                child: MovieCard(movie: nowplaying, headline: "Now Playing"),
              )
          ],
        ),
      ),
    );
  }
}