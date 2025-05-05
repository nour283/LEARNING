import 'package:flutter/material.dart';

class CoursesSection extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String instructor;
  final String price;

  const CoursesSection({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.instructor,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.212;
    double height = MediaQuery.of(context).size.height * 0.19;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CourseDetails(title: title)),
        );
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 7,
              spreadRadius: 2,
              offset: Offset(0, 5),
            ),
          ],
        ),
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                imagePath,
                height: height * 0.4,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: width * 0.07,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Container(
              height: height * 0.2,
              child: SingleChildScrollView(
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: width * 0.06,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ),
            Spacer(),
            Row(
              children: [
                CircleAvatar(
                  radius: width * 0.08,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                SizedBox(width: 6),
                Expanded(
                  child: Text(
                    instructor,
                    style: TextStyle(
                      fontSize: width * 0.07,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: width * 0.07,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CourseDetails extends StatelessWidget {
  final String title;

  const CourseDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('تفاصيل الكورس: $title')),
    );
  }
}
