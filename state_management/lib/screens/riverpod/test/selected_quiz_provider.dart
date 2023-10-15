import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_management/screens/riverpod/test/quiz.dart';

part 'selected_quiz_provider.g.dart';

@riverpod
class SelectedQuiz extends _$SelectedQuiz {
  @override
  Quiz build() {
    return const Quiz(id: -1, title: '', description: '');
  }

  void setTile(String title) {
    state = state.copyWith(title: title);
  }
}
