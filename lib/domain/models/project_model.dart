class ProjectModel {
  final String title;
  final String appType;
  final String description;
  final int year;
  final List<String> assets;

  ProjectModel({
    required this.title,
    required this.appType,
    required this.description,
    required this.year,
    required this.assets,
  });

  ProjectModel copyWith({
    String? title,
    String? appType,
    String? description,
    int? year,
    List<String>? assets,
  }) =>
      ProjectModel(
        title: title ?? this.title,
        appType: appType ?? this.appType,
        description: description ?? this.description,
        year: year ?? this.year,
        assets: assets ?? this.assets,
      );

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        title: json["title"],
        appType: json["appType"],
        description: json["description"],
        year: json["year"],
        assets: List<String>.from(json["assets"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "appType": appType,
        "description": description,
        "year": year,
        "assets": List<dynamic>.from(assets.map((x) => x)),
      };
}
