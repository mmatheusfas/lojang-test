class DetailedArticle {
  final int id;
  final String description;
  final String title;
  final String imageUrl;
  final String authorName;
  final String articleUrl;
  final String fullText;
  final String? authorImage;
  final String? authorDescription;

  DetailedArticle({
    required this.id,
    required this.description,
    required this.title,
    required this.imageUrl,
    required this.authorName,
    required this.articleUrl,
    required this.fullText,
    this.authorImage,
    this.authorDescription,
  });

  DetailedArticle.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        description = map['text'],
        title = map['title'],
        imageUrl = map['image_url'],
        authorName = map['author_name'],
        articleUrl = map['url'],
        fullText = map['full_text'],
        authorImage = map['author_image'],
        authorDescription = map['author_description'];
}
