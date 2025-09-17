class Request {
  final DateTime? fromDate;
  final DateTime? toDate;
  final String country;
  final String reason;
  final Map<String, bool> expenses;
  final bool? ukimProject;
  final String lessonInfo;

  Request({
    required this.fromDate,
    required this.toDate,
    required this.country,
    required this.reason,
    required this.expenses,
    required this.ukimProject,
    required this.lessonInfo,
  });
}
