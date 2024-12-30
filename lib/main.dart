import 'package:flutter/material.dart';
import 'package:google_translat/views/home/provider/home_provider.dart';
import 'package:google_translat/views/home/views/home_page.dart';
import 'package:google_translat/views/splash/views/splash_page.dart';
import 'package:google_translat/views/translatefrom_page/views/transleatfrom_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: HomeProvider(),
        ),
      ],
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          'home': (context) => const HomePage(),
          'translate': (context) => const TranslatFromPage(),
        },
      ),
    );
  }
}
