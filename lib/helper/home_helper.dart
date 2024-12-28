import 'dart:convert';

import 'package:google_translat/model/launguage.dart';
import 'package:http/http.dart' as http;

class HomeHelper {
  static HomeHelper helper = HomeHelper._();

  HomeHelper._();

  Future<String?> translate(String text, String tl, String sl) async {
    String link = "https://ai-translate.p.rapidapi.com/translate";

    Map m1 = {
      "texts": [text],
      "tl": tl,
      "sl": sl,
    };

    http.Response response = await http.post(
      Uri.parse(link),
      headers: {
        "Content-Type": "application/json",
        "x-rapidapi-host": "ai-translate.p.rapidapi.com",
        "x-rapidapi-key": "15e08b4c8dmsh6070c2aa3738a3cp145e39jsnd649680af011",
      },
      body: jsonEncode(m1),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['texts'][0];
    }
    return null;
  }

  Future<List<ChatGptModel>?> getLaunguage() async {
    String link =
        "https://google-translate113.p.rapidapi.com/api/v1/translator/support-languages";
    List<ChatGptModel> launguageList = [];
    http.Response response = await http.get(
      Uri.parse(link),
      headers: {
        "x-rapidapi-host": "google-translate113.p.rapidapi.com",
        "x-rapidapi-key": "2e59e3a545mshd803fd1ed71a23cp1eb9c0jsne0d6a0bc95b6",
      },
    );
    if (response.statusCode == 200) {
      List allData = jsonDecode(response.body);
      launguageList = allData.map((e) => ChatGptModel.mapToMap(e)).toList();
      return launguageList;
    }
    return null;
  }
}
