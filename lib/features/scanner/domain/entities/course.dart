import 'package:equatable/equatable.dart';

class Course extends Equatable {
  const Course({
    required this.ref,
    required this.name,
    required this.classe,
    this.descriptionAr = '',
    this.descriptionFr = '',
    this.descriptionEn = '',
  });

  final int ref;
  final String name;
  final String classe;
  final String? descriptionAr;
  final String? descriptionFr;
  final String? descriptionEn;

  @override
  List<Object?> get props => [
        ref,
        name,
        classe,
        descriptionAr,
        descriptionFr,
        descriptionEn,
      ];
}
