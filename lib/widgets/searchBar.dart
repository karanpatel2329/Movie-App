// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:tradexa/Constant.dart';
// import 'package:tradexa/controller/searchAPI.dart';
// import 'package:tradexa/model/movie.dart';
// class searchBar extends StatefulWidget {
//   const searchBar({Key? key}) : super(key: key);
//
//   @override
//   _searchBarState createState() => _searchBarState();
// }
//
// class _searchBarState extends State<searchBar> {
//   String searchQuery = "";
//   var _controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(5),
//       width: MediaQuery.of(context).size.width * 0.90,
//       decoration: BoxDecoration(
//           color: Color.fromRGBO(69, 57, 85, 1),
//           borderRadius: BorderRadius.all(Radius.circular(25.0))),
//       child: TextField(
//         textInputAction: TextInputAction.go,
//         onSubmitted: (value)async{
//           print(searchQuery);
//           var res =await getMovie("Avengers endgame");
//           Provider.of<Movie>(context, listen: false).addMovie(res);
//           print(res);
//         },
//         controller: _controller,
//         style: TextStyle(
//           color: Constain.white,
//         ),
//         onChanged: (value) {
//           setState(() {
//             searchQuery = value;
//           });
//           // x = x.where((i) => x.contains(value))
//         },
//         decoration: InputDecoration(
//           prefixIcon: Icon(
//             Icons.search,
//             color: Colors.grey,
//           ),
//           suffixIcon: searchQuery.length != 0
//               ? IconButton(
//             //   onPressed: (){},
//             onPressed: _controller.clear,
//             icon: Icon(
//               Icons.clear,
//               color: Constain.white,
//             ),
//           )
//               : IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.clear,
//                 color: Color.fromRGBO(69, 57, 85, 1),
//               )),
//           hintText: "Search",
//           hintStyle: TextStyle(
//             color: Colors.grey,
//           ),
//           enabledBorder: InputBorder.none,
//           focusedBorder: InputBorder.none,
//         ),
//       ),
//     );
//   }
// }
//

