import 'package:flutter/material.dart';
import 'package:tadrib_hub/presentation/widgets/CardItem.dart';
import 'package:tadrib_hub/presentation/widgets/GradientHeaderText.dart';
import 'package:tadrib_hub/presentation/widgets/SubtitleText.dart';
import 'package:tadrib_hub/presentation/widgets/showLanguageSelector.dart';
import 'package:tadrib_hub/resources/strings_manager.dart';


class AiScreen extends StatefulWidget {
  final Function(Locale)? changeLocale;

  const AiScreen({
    Key? key,
    this.changeLocale,
  }) : super(key: key);

  @override
  State<AiScreen> createState() => _AiScreenState();
}

class _AiScreenState extends State<AiScreen> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GradientHeaderText(),

                const SubtitleText(),
                
                const SizedBox(height: 30),
                
              
                CardItem(
                  title: AppStrings.Generate,
                  onLanguagePressed: () => showLanguageSelector(
                    context: context,
                    onLanguageSelected: widget.changeLocale,
                  ),
                ),
                
                const SizedBox(height: 8),
                
                CardItem(
                  title: AppStrings.Generate2,
                  onLanguagePressed: () => showLanguageSelector(
                    context: context,
                    onLanguageSelected: widget.changeLocale,
                  ),
                ),
                
                const SizedBox(height: 32),
                
                _buildInputField(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildInputField() {
    return GestureDetector(
      onTap: () {
        _focusNode.requestFocus();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFE6E0E9),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _textController,
                focusNode: _focusNode,
                decoration: const InputDecoration(
                  hintText: AppStrings.Enter_prompt,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            const SizedBox(width: 8),
            _buildActionButton(Icons.chat_outlined),
            const SizedBox(width: 8),
            _buildActionButton(Icons.mic),
          ],
        ),
      ),
    );
  }
  
  Widget _buildActionButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Icon(icon, size: 20),
    );
  }
}