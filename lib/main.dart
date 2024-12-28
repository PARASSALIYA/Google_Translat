import 'package:flutter/material.dart';
import 'package:google_translat/views/home/provider/home_provider.dart';
import 'package:google_translat/views/home/views/home_page.dart';
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
          '/': (context) => const HomePage(),
          'translate': (context) => const TranslatFromPage(),
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(GoogleTranslateUI());
// }
//
// class GoogleTranslateUI extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.light(),
//       home: TranslateScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class TranslateScreen extends StatefulWidget {
//   @override
//   _TranslateScreenState createState() => _TranslateScreenState();
// }
//
// class _TranslateScreenState extends State<TranslateScreen> {
//   String? sourceLanguage = "English";
//   String? targetLanguage = "Spanish";
//
//   final List<String> languages = [
//     "English",
//     "Spanish",
//     "French",
//     "German",
//     "Hindi",
//     "Gujarati",
//     "Chinese",
//     "Japanese",
//   ];
//
//   final TextEditingController inputController = TextEditingController();
//   String translatedText = "";
//
//   void translate() {
//     setState(() {
//       translatedText =
//           "Translated: ${inputController.text}"; // Placeholder logic
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Google Translate"),
//         backgroundColor: Colors.blue,
//         elevation: 0,
//       ),
//       body: Column(
//         children: [
//           Container(
//             color: Colors.blue,
//             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // Source Language Dropdown
//                 DropdownButton<String>(
//                   value: sourceLanguage,
//                   dropdownColor: Colors.white,
//                   iconEnabledColor: Colors.white,
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       sourceLanguage = newValue!;
//                     });
//                   },
//                   items: languages.map((String language) {
//                     return DropdownMenuItem<String>(
//                       value: language,
//                       child: Text(language),
//                     );
//                   }).toList(),
//                 ),
//
//                 const Icon(Icons.swap_horiz, color: Colors.white, size: 30),
//
//                 // Target Language Dropdown
//                 DropdownButton<String>(
//                   value: targetLanguage,
//                   dropdownColor: Colors.white,
//                   iconEnabledColor: Colors.white,
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       targetLanguage = newValue!;
//                     });
//                   },
//                   items: languages.map((String language) {
//                     return DropdownMenuItem<String>(
//                       value: language,
//                       child: Text(language),
//                     );
//                   }).toList(),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Input TextField
//                   TextField(
//                     controller: inputController,
//                     decoration: InputDecoration(
//                       hintText: "Enter text",
//                       border: OutlineInputBorder(),
//                     ),
//                     maxLines: 4,
//                   ),
//                   SizedBox(height: 16),
//                   // Translate Button
//                   ElevatedButton(
//                     onPressed: translate,
//                     child: Text("Translate"),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   // Translated Text
//                   Text(
//                     translatedText.isNotEmpty
//                         ? translatedText
//                         : "Translation will appear here",
//                     style: TextStyle(fontSize: 16, color: Colors.black87),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
