import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeSlider extends StatefulWidget {
  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {

  final List<String> imgList = [
    'assets/banner/coupang3.jpg',
    'assets/banner/coupang4.jpg',
    'assets/banner/market1.jpg',
    'assets/banner/market2.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: <Widget>[
          Center(
            child: CarouselSlider(
              options: CarouselOptions(
                  autoPlay: true,
                  height: 350,
                  pauseAutoPlayOnTouch: true,
                  viewportFraction: 1.0
              ),
              items: imgList.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          i,
                          fit: BoxFit.contain,
                        )
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
