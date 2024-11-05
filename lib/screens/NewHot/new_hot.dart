import 'package:apifinal/models/movie_model.dart';
import 'package:apifinal/screens/NewHot/widgets/hot_comming_soon.dart';
import 'package:apifinal/services/api_service.dart';
import 'package:flutter/material.dart';

class NewHotScreen extends StatefulWidget {
  const NewHotScreen({super.key});

  @override
  State<NewHotScreen> createState() => _NewHotScreenState();
}

class _NewHotScreenState extends State<NewHotScreen> {
  late Future<List<Movie>> upcomimg;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    upcomimg=Api().getUpcomingMovies();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: const Text("New & Hot",
          style: TextStyle(
            color: Colors.white,

          ),
          ),


          actions: [
            Icon(Icons.cast,color: Colors.white,),
            SizedBox(
              width: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                color: Colors.blue,
                height: 27,
                width: 27,
              ),
            ),

            const SizedBox(
              width: 20,
            )
          ],


          bottom: TabBar(
            dividerColor: Colors.black,
            isScrollable: false,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white
            ),
            labelColor: Colors.black,
            labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),
            tabs:const [
              Tab(
                 text: '     🍿 Coming Soon     ',
              ),
              Tab(
                    text: "     🎥 Everyone's watching     ",
                  )

            ]),
        ),


        body: FutureBuilder(
          future: upcomimg, 
          builder:((context, snapshot) {
            if(snapshot.hasError){
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }else if(snapshot.hasData){
              return Padding(
                padding:const EdgeInsets.only(top: 15,right: 10),
                child: TabBarView(children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        CommingSoon(
                          posterPath: snapshot.data![0].posterPath, 
                          overView: snapshot.data![0].overview, 
                          title: snapshot.data![0].title, 
                          date: snapshot.data![0].releaseDate
                          ),

                          const SizedBox(height: 20,),

                          CommingSoon(
                          posterPath: snapshot.data![1].posterPath, 
                          overView: snapshot.data![1].overview, 
                          title: snapshot.data![1].title, 
                          date: snapshot.data![1].releaseDate
                          )


                      ],
                    ),
                  ),


                  SingleChildScrollView(
                    child: CommingSoon(
                            posterPath: snapshot.data![2].posterPath, 
                            overView: snapshot.data![2].overview, 
                            title: snapshot.data![2].title, 
                            date: snapshot.data![2].releaseDate
                            ),
                  )



                ]),
                );
            }else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            
          }),),

      
        ),
      ));
  }
}