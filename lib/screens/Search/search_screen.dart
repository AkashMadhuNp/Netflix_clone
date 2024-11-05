import 'dart:developer';

import 'package:apifinal/Services/api_service.dart';
import 'package:apifinal/constant/utils.dart';
import 'package:apifinal/models/movie_model.dart';
import 'package:apifinal/screens/Details/movie_detail.dart';
import 'package:apifinal/screens/Search/widgets/top_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();
  late Future<List<Movie>> search;
  late Future<List<Movie>> topSearch;
  List<Movie>? movie;


  

  void searching(String query){
    Api().getSearch(query).then((value){
      setState(() {
        log(value.toString());
        movie=value;
      });
    });


  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    topSearch=Api().getTopRated();
    
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                CupertinoSearchTextField(
                  padding: const EdgeInsets.all(10),
                  controller: controller,
                  prefixIcon: const Icon(Icons.search,color: Colors.grey,),
                  style:const TextStyle(color: Colors.white),
                  backgroundColor: Colors.grey.withOpacity(0.3),
                  onChanged: (value) {
                   if(value.isEmpty){}
                   else{
                    searching(controller.text);
                   } 
                  }
            
                ),
            
                controller.text.isEmpty
                ? FutureBuilder(
                  future:topSearch , 
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    }else if(
                      !snapshot.hasData||
                      snapshot.data==null || 
                      snapshot.data!.isEmpty
                      ){
                        return Text("No Movies");
                      }
                      return TopSearch(movies: snapshot.data);
                  },)
                  : movie == null
                  ? const SizedBox.shrink()
                  : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: movie?.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 5,
                      childAspectRatio: 1.2 / 2
                      
                      ), itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Navigator.push(
                            context,MaterialPageRoute(builder: (context) => 
                            MovieDetail(id: movie![index].id)
                            ,),
                          ),
                          child: SizedBox(
                            height: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 70,
                                  child: movie![index].backdropPath.isEmpty
                                  ? Image.asset(
                                    "assets/netflixlo.png",
                                    height: 50,
                                    ):Image.network(
                                      "$imageurl${movie?[index].backdropPath}",
                                      height: 170,
                                    )
                                ),
            
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    movie![index].title,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14
                                    ),
                                  ),
            
                                )
            
                              ],
                            ),
                          ),
                        );
                      },)
              ],
            ),
          ),
        ),
      ));
  }
}