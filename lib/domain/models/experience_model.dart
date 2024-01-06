class ExperienceModel {
  final String title;
  final String company;
  final String from;
  final String to;
  final String description;
  final int? position;
  final List<String> skills;
  final String? logo;

  ExperienceModel({
    required this.title,
    required this.company,
    required this.from,
    required this.to,
    required this.description,
    required this.position,
    required this.skills,
    required this.logo,
  });

  ExperienceModel copyWith({
    String? title,
    String? company,
    String? from,
    String? to,
    String? description,
    int? position,
    List<String>? skills,
    String? logo,
  }) =>
      ExperienceModel(
        title: title ?? this.title,
        company: company ?? this.company,
        from: from ?? this.from,
        to: to ?? this.to,
        description: description ?? this.description,
        position: position ?? this.position,
        skills: skills ?? this.skills,
        logo: logo ?? this.logo,
      );

  factory ExperienceModel.fromJson(Map<String, dynamic> json) =>
      ExperienceModel(
        title: json["title"],
        company: json["company"],
        from: json["from"],
        to: json["to"],
        description: json["description"],
        position: json["position"],
        skills: List<String>.from(json["skills"].map((x) => x)),
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "company": company,
        "from": from,
        "to": to,
        "description": description,
        "position": position,
        "skills": List<dynamic>.from(skills.map((x) => x)),
        "logo": logo,
      };
}
