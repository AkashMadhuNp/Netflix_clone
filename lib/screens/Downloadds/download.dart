import 'dart:math';

import 'package:apifinal/models/movie_model.dart';
import 'package:apifinal/screens/Downloadds/widgets/download_images.dart';
import 'package:apifinal/services/api_service.dart';
import 'package:flutter/material.dart';

class DosnloadScreen extends StatefulWidget {
  const DosnloadScreen({super.key});

  @override
  State<DosnloadScreen> createState() => _DosnloadScreenState();
}

class _DosnloadScreenState extends State<DosnloadScreen> {

  late Future<List<Movie>> trending;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trending =Api().getTrendingMovies();
  }
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar:AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title:const Text(
          "Downloads",
          style: TextStyle(
            color: Colors.white
          ),
        ),


        actions: [
          const Icon(Icons.cast,color: Colors.white,),
          const SizedBox(width: 20,),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              color: Colors.blue,
              height: 27,
              width: 27,
            ),
          ),

          const SizedBox(width: 20,),
        ],
      ),


      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [

          const  Row(
      children: [
        Icon(
          Icons.settings,
          color: Colors.white,
        ),
        Text('Smart Downloads')
      ],
    ),
           
        const SizedBox(height: 15,),
         const Text(
              'Introducing Downloads for you',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),


           const SizedBox(height: 15,),

           const Center(
              child: Text(
                "We will download a personalised of\nmovies and shows for you, so there's\nalways something to watch on your device.",
                style: TextStyle(color: Colors.grey,fontSize: 16),
              ),
            ),

            SizedBox(
              width:  width*0.85,
              height: width * 0.85,
              child: FutureBuilder(
                future: trending, 
                builder: ((context, snapshot){
                  if(snapshot.hasError){
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }else if(snapshot.hasData){
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: width*0.4,
                          backgroundColor: const Color.fromARGB(255, 99, 99, 99)
                                      .withOpacity(0.5),
                        ),
                        DownloadsImages(
                          margin:const EdgeInsets.only(left: 130),
                           data: snapshot.data![0].posterPath, 
                           angle: 20*pi/180,
                           ),

                           DownloadsImages(
                              data: snapshot.data![1].posterPath,
                              angle: -20 * pi / 180,
                              margin: const EdgeInsets.only(right: 130),
                            ),
                            DownloadsImages(
                              angle: 0,
                              data: snapshot.data![2].posterPath,
                              margin: const EdgeInsets.all(0),
                            )
                           
                      ],
                    );
                  }else{
                    return const CircularProgressIndicator(

                    );
                  }
                } ),
            )

            ),


            Padding(padding: const EdgeInsets.all(10),
            child: MaterialButton(onPressed: () {
              
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
            ),
            color: Colors.blue,
            child: const Padding(padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Set Up",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              ),
            ),
            ),
            ),



            Padding(padding: EdgeInsets.all(10),
            child: MaterialButton(onPressed:  () {
              
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
            ),
            color: Colors.white,
            child: const Padding(padding: EdgeInsets.all(10),
            child: Text("See what you can download",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            ),
            ),
            ),
            )
          ],

        ),
        ),
    );
  }
}