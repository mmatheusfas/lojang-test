class Article {
  final int id;
  final String description;
  final String title;
  final String imageUrl;
  final String authorName;
  final String articleUrl;

  Article({
    required this.id,
    required this.description,
    required this.title,
    required this.imageUrl,
    required this.authorName,
    required this.articleUrl,
  });

  Article.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        description = map['text'],
        title = map['title'],
        imageUrl = map['image_url'],
        authorName = map['author_name'],
        articleUrl = map['url'];

  static List<Article> fromMapList(List mapList) {
    return mapList.map((map) => Article.fromMap(map)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': description,
      'title': title,
      'image_url': imageUrl,
      'author_name': authorName,
      'url': articleUrl,
    };
  }
}
