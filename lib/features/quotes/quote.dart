class Quote {
  final int id;
  final String text;
  final String author;

  Quote({
    required this.id,
    required this.text,
    required this.author,
  });

  Quote.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        text = map['text'],
        author = map['author'];

  static List<Quote> fromMapList(List mapList) {
    return mapList.map((map) => Quote.fromMap(map)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'author': author,
    };
  }
}
