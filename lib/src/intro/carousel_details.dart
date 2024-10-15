import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vpn_app/src/intro/slide_dots.dart';

class Carousel extends StatefulWidget {
  final List items;

  const Carousel({
    Key? key, // Use Key? (nullable) to allow null keys.
    required this.items, // Mark `items` as required to ensure it is provided.
  }) : super(key: key);

  @override
  CarouselState createState() => CarouselState();
}

class CarouselState extends State<Carousel> {
  int _currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);
  Timer? _timer; // Mark `_timer` as nullable since it starts asynchronously.

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      _currentPage = (_currentPage < 2) ? _currentPage + 1 : 0;
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel(); // Ensure `_timer` is non-null before canceling.
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 80.0, bottom: 30.0),
            margin: const EdgeInsets.symmetric(horizontal: 50.0),
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: widget.items.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Image.asset(
                      widget.items[index]['img'],
                      width: width,
                      height: height * 0.5,
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      widget.items[index]['title'],
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Wrap(
                      children: [
                        Text(
                          widget.items[index]['description'],
                          overflow: TextOverflow.clip,
                          softWrap: true,
                          style: TextStyle(fontSize: 16.0),
                          textAlign:
                              TextAlign.center, // textAlign should be here
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              widget.items.length, (int i) => SlideDots(i == _currentPage)),
        ),
      ],
    );
  }
}
