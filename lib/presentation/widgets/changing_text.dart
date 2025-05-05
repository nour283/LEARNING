import 'dart:async';
import 'package:flutter/material.dart';

class ChangingTextSection extends StatefulWidget {
  @override
  _ChangingTextSectionState createState() => _ChangingTextSectionState();
}

class _ChangingTextSectionState extends State<ChangingTextSection> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  final List<Map<String, String>> _texts = [
    {
      "title": "Explore your Passion",
      "description":
      "Explore and better understand the various job\n profiles and career roadmaps by watching career\n Tech-talks delivered by field experts.",
      "icon": "assets/images/iconhome_1.jpg",
    },
    {
      "title": "Earn a certificate/badge",
      "description":
      " Finish your course and receive an\n e-certificate or badge",
      "icon": "assets/images/iconhome_2.jpg",
    },
    {
      "title": "Get ready for freelancing Market",
      "description":
      "Discover the freelancing world, career talks\n  ,and mentorship support with\n a rich Arabic content.",
      "icon": "assets/images/iconhome_3.jpg",
    },
    {
      "title": "Learn Job-Related Skills",
      "description":
      "Decide on your career-oriented learning path\n and start learning\n at the comfort of your pace.",
      "icon": "assets/images/iconhome_4.jpg",
    },
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (!mounted) return;
      setState(() {
        _currentIndex = (_currentIndex + 1) % _texts.length;
      });
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 250,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _texts.length,
            itemBuilder: (context, index) {
              final textData = _texts[index];

              return Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/images/home_1.PNG",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (textData["icon"] != null)
                        Image.asset(textData["icon"]!, width: 50, height: 50),
                      SizedBox(height: 6),
                      Text(
                        textData["title"] ?? "No Title",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        textData["description"] ?? "No Description",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
