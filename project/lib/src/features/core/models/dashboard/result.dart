class Result {
  late String placement;
  late String ymin;
  late String xmin;
  late String ymax;
  late String xmax;
  late double score;
  late String date;
  late String time;
  late String id;
  late String imagePath;
  late String txtPath;

  Result({
    required this.placement,
    required this.ymin,
    required this.xmin,
    required this.ymax,
    required this.xmax,
    required this.score,
    required this.date, // Initialize date field
    required this.time,
    required this.id,
    required this.imagePath,
    required this.txtPath,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      placement: json['placement'].toString(),
      ymin: json['ymin'].toString(),
      xmin: json['xmin'].toString(),
      ymax: json['ymax'].toString(),
      xmax: json['xmax'].toString(),
      score: json['score'].toDouble(),
      date: json['date'].toString(),
      time: json['time'].toString(),
      id: json['id'].toString(),
      imagePath: json['image_path'].toString(),
      txtPath: json['txt_path'].toString(),
    );
  }
}
