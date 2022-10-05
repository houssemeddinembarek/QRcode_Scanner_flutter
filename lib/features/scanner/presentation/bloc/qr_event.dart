part of 'qr_bloc.dart';

abstract class QrEvent extends Equatable {
  const QrEvent();

  @override
  List<Object?> get props => [];
}

class GetCoursesEvent extends QrEvent {
  const GetCoursesEvent();
}

class GetCourseEvent extends QrEvent {
  const GetCourseEvent({
    required this.ref,
  });

  final String ref;

  @override
  List<Object?> get props => [ref];
}
