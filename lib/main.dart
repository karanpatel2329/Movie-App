import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tradexa/Constant.dart';
import 'package:tradexa/screens/movie.dart';
import 'package:tradexa/widgets/searchBar.dart';

import 'controller/searchAPI.dart';
import 'model/movie.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(Provider(
    create: (_) => Movie(
        rating: [],
        year: "",
        runtime: "",
        genre: "",
        language: "",
        actor: "",
        country: "",
        director: "",
        writer: "",
        plot: "",
        title: "",
        poster: "",
        imbRating: ""),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tradexa',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = "";
  bool isSearch = false;
  var _controller = TextEditingController();
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var movie = Provider.of<Movie>(context).getMovie();
    return Scaffold(
        body: SafeArea(
            child: Container(
      color: Constain.darkPurple,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/bg.png"),
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width * 0.90,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(69, 57, 85, 1),
                    borderRadius: BorderRadius.all(Radius.circular(25.0))),
                child: TextField(
                  textInputAction: TextInputAction.go,
                  onSubmitted: (value) async {
                    print(searchQuery);
                    var res = await getMovie(searchQuery);
                    movie.add(res);
                    setState(() {
                      isSearch = true;
                    });
                    print(res);
                  },
                  controller: _controller,
                  style: TextStyle(
                    color: Constain.white,
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                    // x = x.where((i) => x.contains(value))
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    suffixIcon: searchQuery.length != 0
                        ? IconButton(
                            //   onPressed: (){},
                            onPressed: _controller.clear,
                            icon: Icon(
                              Icons.clear,
                              color: Constain.white,
                            ),
                          )
                        : IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.clear,
                              color: Color.fromRGBO(69, 57, 85, 1),
                            )),
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              Container(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: ListView(
                  children: [
                    isSearch
                        ? Consumer<Movie>(builder: (_,movies,__)=>MovieItem(
                      title: movies.movieList[0].title,
                      runtime: movies.movieList[0].runtime,
                      rating: movies.movieList[0].imbRating,
                      poster: movies.movieList[0].poster,
                    ),)
                        : Container(),
                  ],
                ),
              ),
            ],
          )),
    )));
  }
}

class MovieItem extends StatelessWidget {
  String title, rating, runtime, poster;
  MovieItem(
      {required this.title,
      required this.runtime,
      required this.rating,
      required this.poster});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MovieScreen()));
      },
      child: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitWidth, image: NetworkImage(poster)),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    constraints: BoxConstraints.tightFor(width: 70, height: 25),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.90),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 15,
                        ),
                        Text(
                          rating + "/10",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Text(
                title,
                style: TextStyle(
                  color: Constain.white,
                  fontSize: 25.0,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                width: MediaQuery.of(context).size.width * 0.6,
                child: Row(
                  children: [
                    Image(
                      height: 15,
                      width: 15,
                      image: AssetImage("assets/time.png"),
                    ),
                    Text(
                      " " + runtime,
                      style:
                          TextStyle(fontSize: 15, color: Constain.lightYellow),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
