import 'package:flutter/material.dart';
import 'package:tadrib_hub/presentation/Buttoms/coursesSection.dart';


class CoursesScreen extends StatefulWidget {
  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _programmingKey = GlobalKey();
  final GlobalKey _designKey = GlobalKey();
  final GlobalKey _developmentKey = GlobalKey();
  final GlobalKey _businessKey = GlobalKey();
  final GlobalKey _marketingKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  void _scrollToSection(String section) {
    GlobalKey? targetKey;

    switch (section) {
      case 'programming':
        targetKey = _programmingKey;
        break;
      case 'design':
        targetKey = _designKey;
        break;
      case 'development':
        targetKey = _developmentKey;
        break;
      case 'business':
        targetKey = _businessKey;
        break;
      case 'marketing':
        targetKey = _marketingKey;
        break;
    }

    if (targetKey != null && targetKey.currentContext != null) {
      final RenderBox renderBox =
          targetKey.currentContext!.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);

      final offset = position.dy;

      final adjustedOffset = offset - 80;

      // Animate to the section
      _scrollController.animateTo(
        adjustedOffset > 0 ? adjustedOffset : 0,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        controller: _scrollController,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(50),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/background3.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        ShaderMask(
                          shaderCallback: (bounds) {
                            return const LinearGradient(
                              colors: [Color(0xFF3700FF), Color(0xFF210099)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ).createShader(
                              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                            );
                          },
                          child: Column(
                            children: [
                              Text(
                                "Choice",
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.0,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      color: Color(0x40000000),
                                      offset: Offset(3, 3),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "favorite course",
                                style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 5,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      color: Color(0x40000000),
                                      offset: Offset(3, 3),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -80,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => _scrollToSection('design'),
                        child: Image.asset(
                          'assets/images/Design-Button.png',
                          height: 90,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _scrollToSection('development'),
                        child: Image.asset(
                          'assets/images/Devolepment_Button.png',
                          height: 90,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _scrollToSection('business'),
                        child: Image.asset(
                          'assets/images/Business_Button.png',
                          height: 90,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _scrollToSection('programming'),
                        child: Image.asset(
                          'assets/images/Programming_Button.png',
                          height: 90,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          GestureDetector(
            onTap: () => _scrollToSection('marketing'),
            child: Image.asset(
              'assets/images/Markiting_Button.png',
              height: 80,
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background1.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Recommended for you",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/background2.png"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CoursesSection(
                        imagePath: 'assets/images/UI.png',
                        title: 'UI UX DESIGN',
                        description:
                            'Learn website design with great\n professionalism that will make you\n qualified for the labor market .',
                        instructor: 'Lina',
                        price: 'FREE',
                      ),
                      CoursesSection(
                        imagePath: 'assets/images/PYTHION.png',
                        title: 'Python',
                        description:
                            'learn how to code in Python, design and access databases, create interactive web applications, and share your apps with the world',
                        instructor: 'Lina',
                        price: 'FREE',
                      ),
                      CoursesSection(
                        imagePath: 'assets/images/E_commerce2.png',
                        title: 'E_commerce',
                        description:
                            'teach business management and marketing strategy skills, which are key to successfully operating an online business with an e-commerce storefront',
                        instructor: 'Lina',
                        price: 'FREE',
                      ),
                      CoursesSection(
                        imagePath: 'assets/images/JAVE2.png',
                        title: 'Jave',
                        description:
                            'courses that cover skills in object-oriented programming, software development, and app creation. Prepare for careers in software engineering',
                        instructor: 'Lina',
                        price: 'FREE',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            key: _programmingKey, // Programming section key
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Programming",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    CoursesSection(
                      imagePath: 'assets/images/c++.png',
                      title: 'C++',
                      description: 'Learn business management & marketing.',
                      instructor: 'Lina',
                      price: 'FREE',
                    ),
                    SizedBox(width: 12),
                    CoursesSection(
                      imagePath: 'assets/images/PYTHION.png',
                      title: 'Python',
                      description:
                          'learn how to code in Python, design and access databases, create interactive web applications, and share your apps with the world',
                      instructor: 'Lina',
                      price: 'FREE',
                    ),
                    SizedBox(width: 12),
                    CoursesSection(
                      imagePath: 'assets/images/JAVE2.png',
                      title: 'Jave',
                      description:
                          'courses that cover skills in object-oriented programming, software development, and app creation. Prepare for careers in software engineering',
                      instructor: 'Lina',
                      price: 'FREE',
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            key: _designKey, 
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background1.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Design",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    CoursesSection(
                      imagePath: 'assets/images/UI.png',
                      title: 'UI UX DESIDN',
                      description:
                          'Simply put, user experience design is the process of planning the experience a person has when they interact with a product',
                      instructor: 'Lina',
                      price: 'FREE',
                    ),
                    SizedBox(width: 12),
                    CoursesSection(
                      imagePath: 'assets/images/adobe.png',
                      title: 'Adobe Photoshop ',
                      description:
                          'Be innovative and creative by creating your own identity . ',
                      instructor: 'Lina',
                      price: 'FREE',
                    ),
                    SizedBox(width: 12),
                    CoursesSection(
                      imagePath: 'assets/images/adobe2.png',
                      title: 'Adobe  illustrator',
                      description:
                          'Learn to design fonts and create your own logo professionally. In this course you will learn all the possibilities',
                      instructor: 'Lina',
                      price: 'FREE',
                    ),
                  ],
                ),
                SizedBox(height: 8),
                CoursesSection(
                  imagePath: 'assets/images/adxd.png',
                  title: 'Adobe Xd',
                  description:
                      'is a vector design tool for web and mobile applications, developed and published by Adobe Inc.',
                  instructor: 'Lina',
                  price: 'FREE',
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            key: _developmentKey, // Development section key
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Development",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    CoursesSection(
                      imagePath: 'assets/images/devolp.png',
                      title: 'Software development',
                      description:
                          'Software development courses to learn how to create their own software programs .',
                      instructor: 'Lina',
                      price: 'FREE',
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            key: _businessKey, // Business section key
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background1.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Business",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    CoursesSection(
                      imagePath: 'assets/images/E_BUSINESS.png',
                      title: 'E_BUSINESS',
                      description:
                          'is the administration of conducting any business using the internet, extranet, web, and intranet',
                      instructor: 'Lina',
                      price: 'FREE',
                    ),
                    SizedBox(width: 12),
                    CoursesSection(
                      imagePath: 'assets/images/E_commerce.png',
                      title: 'E_commerce',
                      description:
                          'teach business management and marketing strategy skills, which are key to successfully operating an online business with an e-commerce storefront',
                      instructor: 'Lina',
                      price: 'FREE',
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            key: _marketingKey, // Marketing section key
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Marketing",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    CoursesSection(
                      imagePath: 'assets/images/Marketing2.png',
                      title: 'Marketing',
                      description:
                          'understanding the needs of customers, and communicating how a business meets those needs',
                      instructor: 'Lina',
                      price: 'FREE',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
