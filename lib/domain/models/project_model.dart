class ProjectModel {
  final String title;
  final String appType;
  final String description;
  final int year;
  final List<String> assets;
  final bool? fullWidth;
  final int? position;

  ProjectModel({
    required this.title,
    required this.appType,
    required this.description,
    required this.year,
    required this.assets,
    required this.fullWidth,
    required this.position,
  });

  ProjectModel copyWith({
    String? title,
    String? appType,
    String? description,
    int? year,
    List<String>? assets,
    bool? fullWidth,
    int? position,
  }) =>
      ProjectModel(
        title: title ?? this.title,
        appType: appType ?? this.appType,
        description: description ?? this.description,
        year: year ?? this.year,
        assets: assets ?? this.assets,
        fullWidth: fullWidth ?? this.fullWidth,
        position: position ?? this.position,
      );

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        title: json["title"],
        appType: json["appType"],
        description: json["description"],
        year: json["year"],
        assets: List<String>.from(json["assets"].map((x) => x)),
        fullWidth: json["fullWidth"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "appType": appType,
        "description": description,
        "year": year,
        "assets": List<dynamic>.from(assets.map((x) => x)),
        "fullWidth": fullWidth,
        "position": position,
      };
}
