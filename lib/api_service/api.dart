// import 'dart:convert';
//
// import 'package:flutflix/contants.dart';
// import 'package:flutflix/model/movies.dart';
// import 'package:http/http.dart' as http;
//
// class Api {
//   static const trendingUrl = 'https://api.thmoviedb.org/3/trending/movie/day?api_key=${Contants.apiKey}';
//
//   Future<List<Movie>> getTrendingMovie() async{
//     final response = await http.get(Uri.parse(trendingUrl));
//     if(response.statusCode == 200){
//       final decodedData = json.decode(response.body)['results'] as List;
//       print('data === $decodedData');
//       return decodedData.map((movie) => Movie.fromJson(movie)).toList();
//     }else{
//       throw Exception('Something happen');
//     }
//   }
// }