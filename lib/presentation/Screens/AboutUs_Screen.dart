import 'package:flutter/material.dart';
import 'package:tadrib_hub/presentation/widgets/RotatingTeam.dart';
import 'package:tadrib_hub/presentation/widgets/SectionContent.dart';
import 'package:tadrib_hub/presentation/widgets/SectionHeader.dart';
import 'package:tadrib_hub/resources/assets_manager.dart';
import 'package:tadrib_hub/resources/color_manager.dart';
import 'package:tadrib_hub/resources/values_manager.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "We’re here to",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: AppValues.fontSizeLarge,
                    ),
                  ),
                  Text(
                    "guarantee your success",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: AppValues.fontSizeLarge,
                    ),
                  ),
                  SizedBox(height: 4),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 4,
                    color: AppColors.Divider,
                  ),
                ],
              ),
              SizedBox(height: 42),
              Image(image: AssetImage(ImageAssets.AboutUs)),
              SizedBox(height: 16),
              Text(
                "We’re here for you",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: AppValues.fontSizeLarge,
                ),
              ),
              Text(
                "no matter where you are",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: AppValues.fontSizeLarge,
                ),
              ),
              SizedBox(height: 4),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 5,
                color: AppColors.Divider,
              ),
              SizedBox(height: 16),
              Image(image: AssetImage(ImageAssets.Map)),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: SectionHeader(title: "Our Mission"),
              ),
              SizedBox(height: 7),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 5,
                color: AppColors.Divider,
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: SectionContent(
                  title: "Unmatched service",
                  description:
                      "Support corporate clients and financial investors\n with their growth strategy and international\n development.",
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: SectionHeader(title: "Our Commitment"),
              ),
              SizedBox(height: 7),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 5,
                color: AppColors.Divider,
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: SectionContent(),
              ),
              SizedBox(height: 24),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Our Success Team",
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    RotatingTeam(),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
