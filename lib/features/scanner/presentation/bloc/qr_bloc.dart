import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:qrcode2/features/scanner/data/models/course_model.dart';
import 'package:qrcode2/features/scanner/domain/entities/course.dart';

part 'qr_event.dart';
part 'qr_state.dart';

class QrBloc extends Bloc<QrEvent, QrState> {
  QrBloc() : super(const QrInitial(courses: <Course>[])) {
    on<GetCoursesEvent>((event, emit) async {
      final String coursesString =
          await rootBundle.loadString('assets/courses.json');

      final courcesJson = jsonDecode(coursesString) as List<dynamic>;
      final courses = <Course>[];

      for (final courseMap in courcesJson) {
        final course = CourseModel.fromJson(courseMap);
        courses.add(course);
      }

      emit(state.copyWith(courses: courses, loading: false));
    });

    on<GetCourseEvent>((event, emit) {
      try {
        final course = state.courses
            .firstWhere((element) => element.ref.toString() == event.ref);

        emit(state.copyWith(course: course));
      } catch (e) {
        log('ERROR ===> $e');
      }
    });
  }
}