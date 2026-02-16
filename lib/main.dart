import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

import 'core/cache/cache_helper.dart';
import 'core/providers/theme_provider.dart';
import 'core/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeProvider.themeMode,
      routes: {HomeScreen.routeName: (context) => HomeScreen()},
    );
  }
}
