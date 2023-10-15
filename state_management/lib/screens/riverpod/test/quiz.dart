import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz.freezed.dart';

@freezed
class Quiz with _$Quiz {
  const factory Quiz({
    required int id,
    required String title,
    required String description,
  }) = _Quiz;
}
