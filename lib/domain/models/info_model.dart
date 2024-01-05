class InfoModel {
  final String title;
  final String infoText;
  final String infoText2;
  final String infoText3;

  InfoModel({
    required this.title,
    required this.infoText,
    required this.infoText2,
    required this.infoText3,
  });

  InfoModel copyWith({
    String? title,
    String? infoText,
    String? infoText2,
    String? infoText3,
  }) =>
      InfoModel(
        title: title ?? this.title,
        infoText: infoText ?? this.infoText,
        infoText2: infoText2 ?? this.infoText2,
        infoText3: infoText3 ?? this.infoText3,
      );

  factory InfoModel.fromJson(Map<String, dynamic> json) => InfoModel(
        title: json["title"],
        infoText: json["infoText"],
        infoText2: json["infoText2"],
        infoText3: json["infoText3"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "infoText": infoText,
        "infoText2": infoText2,
        "infoText3": infoText3,
      };
}
