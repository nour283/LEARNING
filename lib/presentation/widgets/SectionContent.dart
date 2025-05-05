import 'package:flutter/material.dart';

class SectionContent extends StatelessWidget {
  final String? title;
  final String? description;

  SectionContent({this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(title!, style: TextStyle(fontWeight: FontWeight.bold)),
        if (description != null) Text(description!),
        SizedBox(height: 8),
        Text("Specific", style: TextStyle(fontWeight: FontWeight.bold)),
        Text(
          "ConsultUs’ core expertise lies in the ability to \n support our clients in understanding, analysing \n and executing commercial and investment \n strategies in specific markets. ",
        ),
        SizedBox(height: 8),
        Text("Experience", style: TextStyle(fontWeight: FontWeight.bold)),
        Text(
          "Experience in working with and assisting a wide \n range of clients from international corporations to \n small/medium-sized businesses, from large \n corporate debt providers to mid-market private \n equity investors. ",
        ),
        SizedBox(height: 8),
        Text("Technology", style: TextStyle(fontWeight: FontWeight.bold)),
        Text("The best combination of technology and people."),
      ],
    );
  }
}
