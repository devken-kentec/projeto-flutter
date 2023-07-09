class Video {
  late String id;
  late String title;
  late String thumb;
  late String channel;

  Video(
      {required this.id,
      required this.title,
      required this.thumb,
      required this.channel});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
        id: json['id']['videoId'],
        title: json['snippet']['title'],
        thumb: json['snippet']['thumbnails']['high']['url'],
        channel: json['snippet']['channelTitle']);
  }
}
