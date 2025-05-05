import 'package:flutter/material.dart';

class InstructorsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          "Know about learning platform",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 10),
            ],
          ),
          child: Column(
            children: [
              Image.asset("assets/images/home_2.PNG", width: double.infinity),
              SizedBox(height: 10),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  InstructorCard("assets/images/howard.png", "Fenny Howard", "Instructor"),
                  InstructorCard("assets/images/tamara.png", "Tamara", "Mentor"),
                  InstructorCard("assets/images/adam.png", "Adam Levin", "Student"),
                  InstructorCard("assets/images/patricia.png", "Patricia Mendoza", "Student"),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text("Pres")),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                    child: Text("Cal"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class InstructorCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String role;

  InstructorCard(this.imagePath, this.name, this.role);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(imagePath, width: 80, height: 80, fit: BoxFit.cover),
        ),
        SizedBox(height: 5),
        Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(role, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}