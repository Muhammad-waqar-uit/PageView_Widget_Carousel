import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int number = 1;
  PageController pageController = PageController(initialPage: 0);
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  var text = [
    ['alt50', '50 tracks - 17 342 fans'],
    ['TikTok Hits', '80 tracks - 130 305 fans']
  ];
  int lst = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Carousel'),
          centerTitle: true,
        ),
        body: Center(
          child: Stack(
            children: [
              SizedBox(
                width: 300,
                height: 300,
                child: PageView(
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.asset('assets/2.jpg'),
                    Image.asset('assets/logo.png'),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 300,
                  height: 70,
                  color: Colors.white.withOpacity(.2),
                  child: ListTile(
                    title: Text(text[lst][0]),
                    subtitle: Text(text[lst][1]),
                  ),
                ),
              ),
               Positioned(
                right: 30,
                bottom: 120,
                child: IconButton(
                  icon: const Icon(Icons.arrow_circle_right_rounded),
                  onPressed:(){
                    pageController.nextPage(duration: const Duration(seconds: 1), curve: Curves.easeInOut);
                    setState(() {
                      number = min(number + 1, 2);
                      lst = 1;
                    });
                  },
                ),
              ),
               Positioned(
                left: 30,
                bottom: 120,
                child: IconButton(
                  onPressed: (){
                    pageController.previousPage(duration: const Duration(seconds: 1), curve: Curves.easeInOut);
                    setState(() {
                      number = max(number - 1, 1);
                      lst = 0;
                    });
                  },
                  icon:const Icon(Icons.arrow_circle_left_rounded),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
