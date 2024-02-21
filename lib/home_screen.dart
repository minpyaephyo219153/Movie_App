
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/api/api.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/widgets/movie_slider.dart';
import 'package:movie_app/widgets/trending_slider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen ({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {

  late Future<List<Movie>> getTrendingMovies;

  @override
  void initState() {
    super.initState();
    getTrendingMovies = Api().getTrendingMovies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/flutflix.png',
          fit: BoxFit.cover,
          height: 40,
          filterQuality: FilterQuality.high,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trending Movies',
                style: GoogleFonts.ubuntu(fontSize: 25),
              ),
              const SizedBox(height: 32,),
              const TrendingSlider(),
              const SizedBox(height: 32,),
              Text(
                'Top rated Movies',
                style: GoogleFonts.ubuntu(fontSize: 25),
              ),
              const SizedBox(height: 32,),
              const MovieSlider(),
              const SizedBox(height: 32,),
              Text(
                'Upcoming movies',
                style: GoogleFonts.ubuntu(fontSize: 25),
              ),
              const SizedBox(height: 32,),
              const MovieSlider(),

            ],
          ),
          ),
      ),
    );
  }
}