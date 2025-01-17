import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: 10,
        options: CarouselOptions(
            height: 300,
            autoPlay: true,
            viewportFraction: 0.55,
            enlargeCenterPage: true,
            pageSnapping: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(seconds: 2)
        ),
        itemBuilder: (context,itemIndex,pageViewIndex){
          return ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Container(
              height: 300,
              width: 200,
              color: Colors.amber,
            ),
          );
        },
      ),
    );
  }
}
