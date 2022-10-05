// ignore_for_file: prefer_if_null_operators


import '../../domain/entities/course.dart';

class CourseModel extends Course {
  
  const CourseModel({
    required super.ref,
    required super.name,
    required super.classe,
    super.descriptionAr,
    super.descriptionFr,
    super.descriptionEn,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      ref: json['Ref'],
      name: json['Name'],
      classe: json['Classe'],
      descriptionAr:
          json['descriptionAr'] != null ? json['descriptionAr'] : null,
      descriptionFr:
          json['descriptionFr'] != null ? json['descriptionFr'] : null,
      descriptionEn:
          json['descriptionEn'] != null ? json['descriptionEn'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'Ref': ref,
      'Name': name,
      'Classe': classe,
      'descriptionAr': descriptionAr,
      'descriptionFr': descriptionFr,
      'descriptionEn': descriptionEn,
    };
  }
}
