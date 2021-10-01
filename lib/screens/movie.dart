import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:tradexa/Constant.dart';
import 'package:tradexa/model/movie.dart';

class MovieScreen extends StatefulWidget {

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
    List<Movie> movie=[];
  List<Rating> rating=[];
  @override
  void initState() {
    getMovie();
    // TODO: implement initState
    super.initState();

  }
  void getMovie()async{
    movie = Provider.of<Movie>(context,listen: false).getMovie();
    print(movie);
  }
  List<RatingRow> getRating(){
    return movie[0].rating.map((e) => RatingRow(rating: e.rating, source: e.source)).toList();
  }
  List<Widget> getValue(String a){
    List<String> value =a.split(",");

    return value.map((e) => authorBtn(author: e,)).toList();
  }
  @override
  Widget build(BuildContext context) {
    //movie = Provider.of<Movie>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Constain.darkPurple,
          width: double.maxFinite,
          child: Column(
            children: [
              Stack(
                children: [
                  ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black, Colors.transparent],
                      ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                    },
                    blendMode: BlendMode.dstIn,
                    child: Consumer<Movie>(builder: (_,movies,__)=> Image.network(
                      movies.movieList[0].poster,
                      height: 400,
                      width: double.maxFinite,
                      fit: BoxFit.fitWidth,
                    ),),
                  ),
                  Container(
                    height: 400,
                    padding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                            child: Column(
                              children: [
                                ClipRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      // set the bure amount you want for x and y
                                      sigmaX: 5,
                                      sigmaY: 5,
                                    ),),),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                                  // set the correct width and height for the container
                                  decoration: BoxDecoration(
                                    // set the color and the opacity
                                    color: Colors.white.withOpacity(0.3),
                                    // add a rounded border
                                    borderRadius: BorderRadius.circular(20),
                                    // add an edge to the border

                                  ),
                                  // call the child for the container
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    child: Icon(Icons.arrow_back,color: Colors.white,size: 30.0),
                                  ),),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Consumer<Movie>(builder: (_,movies,__)=>Text(movies.movieList[0].title,style: TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.w400),),),
                            Consumer<Movie>(builder: (_,movies,__)=>Text(movies.movieList[0].genre,style: TextStyle(color: Colors.grey, fontSize: 18,),))


                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Button(icon: Icons.arrow_downward,),
                  Button(icon: Icons.favorite_border_outlined,),
                  Button(icon: Icons.share_outlined,),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                decoration: BoxDecoration(
                    color: Constain.lightPurple,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Rating",style: TextStyle(color: Constain.lightYellow,fontSize: 20),),
                        Consumer<Movie>(builder: (_,movies,__)=>Text(movies.movieList[0].imbRating,style: TextStyle(color: Constain.lightYellow,fontSize: 20),),)
                      ],
                    ),
                    Column(
                      children:getRating(),
                    ),
                    ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                decoration: BoxDecoration(
                    color: Constain.lightPurple,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage("assets/calender.png"),
                            height: 20,
                            width: 20,
                          ),
                           SizedBox(
                             width: 20,
                           ),
                          Consumer<Movie>(builder: (_,movies,__)=>Text(movies.movieList[0].year,style: TextStyle(color: Constain.white.withOpacity(0.6),fontSize: 20),),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage("assets/Vector.png"),
                            height: 20,
                            width: 20,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Consumer<Movie>(builder: (_,movies,__)=>Text(movies.movieList[0].country,style: TextStyle(color: Constain.white.withOpacity(0.6),fontSize: 20),))

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage("assets/time.png"),
                            height: 20,
                            width: 20,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Consumer<Movie>(builder: (_,movies,__)=>Text(movies.movieList[0].runtime,style: TextStyle(color: Constain.white.withOpacity(0.6),fontSize: 20),),)

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage("assets/language.png"),
                            height: 20,
                            width: 20,
                          ),
                          SizedBox(
                            width: 20,
                          ),


                          Container(width: MediaQuery.of(context).size.width*0.7, child: Consumer<Movie>(builder: (_,movies,__)=>Text(movies.movieList[0].language,style: TextStyle(color: Constain.white.withOpacity(0.6),fontSize: 20),),))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                decoration: BoxDecoration(
                    color: Constain.lightPurple,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Plot",style: TextStyle(
                     color: Colors.white,
                     fontSize: 18
                   ),),
                   SizedBox(
                     height: 10,
                   ),
                   Consumer<Movie>(builder: (_,movies,__)=>Text("\""+movies.movieList[0].plot+"\"",style: TextStyle(
                       color: Colors.white.withOpacity(0.6),
                       fontSize: 17
                   ),),),
                   SizedBox(
                     height: 10,
                   ),
                   Text("Director",style: TextStyle(
                       color: Colors.white,
                       fontSize: 18
                   ),),
                   SizedBox(
                     height: 10,
                   ),
                   Wrap(
                     children:
                     getValue(movie[0].director),
                   ),
                   SizedBox(
                     height: 10,
                   ),
                   Text("Actor",style: TextStyle(
                       color: Colors.white,
                       fontSize: 18
                   ),),
                   SizedBox(
                     height: 10,
                   ),
                   Wrap(
                     children:
                     getValue(movie[0].actor),
                   ),
                   SizedBox(
                     height: 10,
                   ),
                   Text("Writer",style: TextStyle(
                       color: Colors.white,
                       fontSize: 18
                   ),),
                   SizedBox(
                     height: 10,
                   ),
                   Wrap(
                     children:
                       getValue(movie[0].writer),
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

class authorBtn extends StatelessWidget {
String author;
authorBtn({required this.author});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: Constain.white.withOpacity(0.25),
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Text(author, style: TextStyle(color: Colors.white.withOpacity(0.55)),),
    );
  }
}

class RatingRow extends StatelessWidget {
  RatingRow({required this.rating,required this.source});
  String source,rating;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(source,style: TextStyle(color: Constain.white.withOpacity(0.6),fontSize: 20),),
          Text(rating,style: TextStyle(color: Constain.white.withOpacity(0.6),fontSize: 20),)
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  Button({required this.icon});
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              // set the bure amount you want for x and y
              sigmaX: 1,
              sigmaY: 1,
            ),),),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          // set the correct width and height for the container
          decoration: BoxDecoration(
            // set the color and the opacity
            color: Constain.lightPurple.withOpacity(0.9),
            // add a rounded border
            borderRadius: BorderRadius.circular(20),
            // add an edge to the border

          ),
          // call the child for the container
          child: Container(
            height: 30,
            width: 30,
            child: Icon(icon,color: Colors.white,size: 30.0),
          ),),
      ],
    );
  }
}
