class Video {
  final int id;
  final String name;
  final String description;
  final String videoUrl;
  final String awsUrl;
  final String imageUrl;

  Video({
    required this.id,
    required this.name,
    required this.description,
    required this.videoUrl,
    required this.awsUrl,
    required this.imageUrl,
  });

  Video.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        description = map['description'],
        videoUrl = map['url2'],
        awsUrl = map['aws_url'],
        imageUrl = map['image_url'];

  static List<Video> fromMapList(List mapList) {
    return mapList.map((map) => Video.fromMap(map)).toList();
  }
}
