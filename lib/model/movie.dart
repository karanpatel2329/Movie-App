import 'package:flutter/cupertino.dart';


class Movie extends ChangeNotifier{
  String title;
  String year;
  String runtime;
  String genre;
  String director;
  String writer;
  String actor;
  String plot;
  String language;
  String country;
  String poster;
  String imbRating;
  List<Rating> rating;

  Movie({required this.rating,required this.year,required this.runtime,required this.genre, required this.director,required this.writer,required this.actor, required this.language,required this.country,required this.plot,required this.poster,required this.title, required this.imbRating});
  List<Movie> movieList =[];
  void addMovie(Movie movie){
    movieList.add(movie);
    notifyListeners();
  }
  void clearMovie(){
    movieList.clear();
    notifyListeners();
  }
  List<Movie> getMovie(){
    movieList=movieList;
    notifyListeners();
    return movieList;

  }
}

class Rating{
  String source;
  String rating;
  Rating({required this.source,required this.rating});
}