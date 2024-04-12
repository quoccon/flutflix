import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutflix/api_service/api.dart';
import 'package:flutflix/screen/profile/profile_screen.dart';
import 'package:flutflix/widgets/movies_slider.dart';
import 'package:flutflix/widgets/top_movies.dart';
import 'package:flutflix/widgets/trending_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutflix/model/movies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late Future<List<Movie>> trendingMovies;
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   trendingMovies = Api().getTrendingMovie();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          "assets/images/flutflix.png",
          fit: BoxFit.cover,
          height: 30,
          filterQuality: FilterQuality.high,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push((context), MaterialPageRoute(builder: (builder) => const Infomation()));
              },
                child: Image.asset("assets/images/avt_user.png")),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Trending Movies",
                style: GoogleFonts.aBeeZee(fontSize: 25),
              ),
              const SizedBox(
                height: 30,
              ),
              const TrendingSlider(),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Top movies",
                style: GoogleFonts.aBeeZee(fontSize: 25),
              ),
              const TopMovies(),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Top movies",
                style: GoogleFonts.aBeeZee(fontSize: 25),
              ),
              const MoviesSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
