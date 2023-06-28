class Result {
  late String placement;
  late String ymin;
  late String xmin;
  late String ymax;
  late String xmax;
  late String score;

  Result({
    required this.placement,
    required this.ymin,
    required this.xmin,
    required this.ymax,
    required this.xmax,
    required this.score,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      placement: json['placement'],
      ymin: json['ymin'],
      xmin: json['xmin'],
      ymax: json['ymax'],
      xmax: json['xmax'],
      score: json['score'],
    );
  }
}
