import 'package:flutter/material.dart';
import 'package:flutter_app2/movie_details.dart';
import 'package:flutter_app2/movies.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MoviesList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MoviesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<Movies>(
            future: getAllMovies(),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.done){
                return ListView.builder(
                    padding: EdgeInsetsDirectional.only(top: 10, start: 10, bottom: 10,end: 10 ),
                    itemCount: snapshot.data.results.length,
                    itemBuilder: (innerContext, position){
                      return drawMovie((snapshot.data.results)[position], context);
                    }
                );
              }else {
                return Center(child: CircularProgressIndicator());
              }
            }
        )
      ),
    );
  }



}

  Future<Movies> getAllMovies() async{
    final url = "https://api.themoviedb.org/3/discover/movie?api_key=96eee189d8f440bae690d17f36e9f700&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1";
    final response = await http.get(url);
    print(response.body);
    return moviesFromJson(response.body);
  }

  Widget drawMovie(Result movie, BuildContext context){
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (contetx){
              return MovieDetails(movie: movie,);
            })
        );
      },
      child: Card(
        margin: EdgeInsets.only(bottom: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Hero(
                tag: movie.id,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage("http://image.tmdb.org/t/p/w185" + movie.posterPath,),
//              image: NetworkImage("http://image.tmdb.org/t/p/w185" + movie.posterPath,),
                      )
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Flexible(
                child: Text(movie.title, style: TextStyle(
                    fontSize: 16
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }



