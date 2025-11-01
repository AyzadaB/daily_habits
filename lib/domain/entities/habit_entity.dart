class HabitEntity {
  final int id;
  final String title;
  final String emoji;
  final bool isCompleted;
  final DateTime createdDate;

  HabitEntity({
    required this.id,
    required this.title,
    required this.emoji,
    required this.isCompleted,
    required this.createdDate,
  });
}

//HabitEntity — это чистая модель без зависимостей (слой domain).
