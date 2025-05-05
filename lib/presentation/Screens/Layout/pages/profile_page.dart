import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tadrib_hub/presentation/Screens/Layout/pages/account_popup.dart';
import 'package:tadrib_hub/presentation/Screens/Layout/pages/contact_screen.dart';
import 'package:tadrib_hub/resources/color_manager.dart';
import 'package:shared_preferences/shared_preferences.dart'; // استيراد shared_preferences

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  bool _isPickingImage = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  String _displayedName = "Your name";
  String _displayedEmail = "yourname@gmail.com";

  @override
  void initState() {
    super.initState();
    _loadData(); // تحميل البيانات المخزنة عند بدء الصفحة
  }

  // تحميل البيانات المخزنة من SharedPreferences
  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _displayedName = prefs.getString('name') ?? "Your name";
      _displayedEmail = prefs.getString('email') ?? "yourname@gmail.com";
      // يمكن تحميل الصورة هنا إذا تم تخزينها مسبقًا
    });

    _nameController.text = _displayedName;
    _emailController.text = _displayedEmail;
    _mobileController.text = "+201";
    _addressController.text = "address";
  }

  // حفظ البيانات في SharedPreferences
  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    
    prefs.setString('name', _nameController.text);
    prefs.setString('email', _emailController.text);
    // تخزين الصورة إذا لزم الأمر
  }

  Future<void> _getImage() async {
    if (_isPickingImage) return;

    setState(() {
      _isPickingImage = true;
    });

    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      debugPrint('Image picker error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image: ${e.toString()}')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isPickingImage = false;
        });
      }
    }
  }

  void _saveChanges() {
    setState(() {
      _displayedName = _nameController.text;
      _displayedEmail = _emailController.text;
    });

    // حفظ البيانات في SharedPreferences
    _saveData();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Changes saved')),
    );

    // فتح نافذة AccountPopup بعد حفظ التغييرات
    showDialog(
      context: context,
      builder: (context) => AccountPopup(
        userName: _displayedName,
        userEmail: _displayedEmail,
        userImage: _image,  // تمرير الصورة إلى AccountPopup
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    onTap: _isPickingImage ? null : _getImage,
                    child: CircleAvatar(
                      radius: isSmallScreen ? 40 : 50,
                      backgroundColor: Colors.grey[300],
                      backgroundImage: _image != null ? FileImage(_image!) : null,
                      child: _image == null
                          ? Icon(Icons.camera_alt, size: isSmallScreen ? 30 : 40, color: Colors.grey)
                          : null,
                    ),
                  ),
                  if (_isPickingImage)
                    const Positioned(
                      child: CircularProgressIndicator(),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _displayedName,
                        style: TextStyle(
                          fontSize: isSmallScreen ? 16 : 18,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _displayedEmail,
                        style: TextStyle(
                          fontSize: isSmallScreen ? 12 : 14,
                          color: Colors.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.black, size: 20),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomTextField(hint: "Name", controller: _nameController),
            CustomTextField(hint: "@Email account", controller: _emailController),
            CustomTextField(hint: "Mobile +201", controller: _mobileController),
            CustomTextField(hint: "address", controller: _addressController),
            const SizedBox(height: 30),
            Center(
              child: SizedBox(
                width: isSmallScreen ? screenWidth * 0.7 : screenWidth * 0.4,
                height: 42,
                child: ElevatedButton(
                  onPressed: _saveChanges,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    'Save Changes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isSmallScreen ? 14 : 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
