import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tadrib_hub/presentation/widgets/auto_scrolling_carousel.dart';
import 'package:tadrib_hub/presentation/widgets/changing_text.dart';
import '../../../../resources/color_manager.dart';
import '../layout_manager/layout_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SingleChildScrollView(
        child: Column(children: [
          ChangingTextSection(),
          SizedBox(height: 10),
          InkWell(
            onTap: (){},
            child: Image.asset(
              "assets/images/home_2.PNG",
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Image.asset("assets/images/instructor.jpg"),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Row(
          //
          //         children: [
          //           Text(
          //             "Know about learning platform",
          //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 20,),
                Text(
                  "Know about learning learning platform",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 20,),

                ElevatedButton(
                  onPressed: () {
                    Provider.of<LayoutProvider>(context, listen: false).changeBtnNav(1);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.lightBlue,

                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.06),
                    ),
                  ),
                  child: Text(
                    "Start learning now",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
          SizedBox(height: 20),
          Container(

          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade100, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Recommended for you",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Center(
                child: InkWell(
                  onTap: (){
                    Provider.of<LayoutProvider>(context, listen: false).changeBtnNav(1);
                  },
                  child: Container(
                    height: 318,
                    width: 200,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: Offset(0, 5), // تأثير الظل
                        ),
                      ],
                    ),
                    child: AutoScrollingCarousel(), // هنا الـ Widget اللي انت عاملها
                  ),
                ),
              ),
            ],

          ),
        ),
          SizedBox(height: 20),


          // AutoScrollingCarousel(),





        ],),
      ),
    );
  }}