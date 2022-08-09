part of 'qr_bloc.dart';

class QrState extends Equatable {
  const QrState({
    required this.courses,
    this.qrCode,
    this.course,
    this.loading = true,
  });

  final List<Course> courses;
  final String? qrCode;
  final Course? course;
  final bool loading;

  QrState copyWith({
    List<Course>? courses,
    String? qrCode,
    Course? course,
    bool? loading,
  }) {
    return QrState(
      courses: courses ?? this.courses,
      qrCode: qrCode ?? this.qrCode,
      course: course ?? this.course,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object?> get props => [courses, qrCode, course, loading];
}

class QrInitial extends QrState {
  const QrInitial({required super.courses});
}
