class PostModel {
  final int userId;
  final int id;
  final String title;
  final String description;

  PostModel({
    this.userId,
    this.id,
    this.title,
    this.description,
  });

  // Convert Json to Model
  factory PostModel.fromJson(Map<String, dynamic> item) {
    return PostModel(
      userId: item['userId'],
      id: item['id'],
      title: item['title'].toString(),
      description: item['body'].toString(),
    );
  }
}
