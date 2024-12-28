class ChatGptModel {
  final String code, language;

  ChatGptModel(this.code, this.language);

  factory ChatGptModel.mapToMap(Map data) =>
      ChatGptModel(data['code'], data['language']);
}
