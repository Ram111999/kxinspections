import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

enum TaskStatus {
  pending,
  inProgress,
  completed,
}

enum TaskPriority {
  low,
  medium,
  high,
}

@freezed
abstract class Task with _$Task {
  const factory Task({
    required String id,
    required String inspectionId,
    required String title,
    required String description,
    required String room,
    required TaskStatus status,
    @Default(TaskPriority.medium) TaskPriority priority,
    @Default([]) List<String> photoIds,
    DateTime? dueDate,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
