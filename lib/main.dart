import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tadrib_hub/presentation/Screens/Layout/pages/language_provider.dart';
import 'package:tadrib_hub/presentation/Screens/Layout/pages/theme_provider.dart';
import 'package:tadrib_hub/resources/app_router.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      themeMode: ThemeMode.system, // استخدام النظام الافتراضي في البداية
      theme: ThemeData.light(), // الثيم الفاتح
      darkTheme: ThemeData.dark(), // الثيم الداكن
      locale: const Locale('en'), // اللغة الافتراضية
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      builder: (context, child) {
        // سيتم تنفيذ هذا الجزء بعد أن تصبح الـ Providers متاحة
        final themeProvider = Provider.of<ThemeProvider>(context, listen: true);
        final languageProvider = Provider.of<LanguageProvider>(context, listen: true);
        
        return MaterialApp.router(
          key: ValueKey('${themeProvider.isDarkMode}_${languageProvider.isArabic}'), // إعادة بناء عند التغيير
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter,
          theme: themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          locale: languageProvider.isArabic ? const Locale('ar') : const Locale('en'),
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
        );
      },
    );
  }
}