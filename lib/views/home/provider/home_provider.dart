import 'package:flutter/cupertino.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_translat/helper/home_helper.dart';
import 'package:google_translat/model/launguage.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class HomeProvider with ChangeNotifier {
  String textList = "";
  List<ChatGptModel> launguageList = [];
  String textSelected = "";
  TextEditingController controller = TextEditingController();
  String tl = "hi";
  String sl = "auto";
  FlutterTts flutterTts = FlutterTts();
  String? launguageSelected;
  stt.SpeechToText speech = stt.SpeechToText();
  bool isListening = false;
  String searchText = "";
  Future<void> translate() async {
    textList = await HomeHelper.helper.translate(textSelected, tl, sl) ?? "";
    notifyListeners();
  }

  void startListening() async {
    bool available = await speech.initialize();

    if (available) {
      isListening = true;
      speech.listen(
        onResult: (result) {
          searchText = result.recognizedWords;

          textList = searchText;
          controller.text = searchText;
          notifyListeners();
        },
      );
      notifyListeners();
    }
  }

  void stopListening() {
    isListening = false;
    speech.stop();
    notifyListeners();
  }

  void speak(String text) async {
    await flutterTts.speak(text);
    notifyListeners();
  }

  void onChange(String text) {
    textSelected = text;
    notifyListeners();
  }

  Future<void> getLaunguage() async {
    launguageList = await HomeHelper.helper.getLaunguage() ?? [];
    notifyListeners();
  }
}
