import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:tradexa/model/movie.dart';

Future<Movie> getMovie(String title) async {
  var jsonData;
  print(title);
  print("+++++++++");
  try {
    var response = await http.post(Uri.parse("http://www.omdbapi.com/?t="+title+"&apikey=3a1d36f"));
    //var data = convert.jsonDecode(response.body);
    jsonData = convert.jsonDecode(response.body);
  } catch (E) {
    print(E);
  }
  print(jsonData);
  List<Movie> movieList = [];
  var t=jsonData;
    Movie movie = Movie(rating:  List.from(t['Ratings']).map((item)=>Rating(source: item['Source'], rating: item['Value'])).toList(), year: t['Year'], runtime: t['Runtime'], genre: t['Genre'], director: t['Director'], writer: t['Writer'], actor:t['Actors'], language: t['Language'], country: t['Country'], plot: t['Plot'], poster: t['Poster'], title:t['Title'],imbRating: t['imdbRating']);
    movieList.add(movie);
    print(movie);

  return movie;
}