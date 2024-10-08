class ContentModel {
  final int id;
  final String video;
  final String likesCount;

  ContentModel(
      {required this.id, required this.video, required this.likesCount});

  factory ContentModel.fromJson(Map<String, dynamic> jsonData) {
    return ContentModel(
      id: jsonData['id'],
      video: jsonData['video'],
      likesCount: jsonData['likes_count_translated'],
    );
  }
}
