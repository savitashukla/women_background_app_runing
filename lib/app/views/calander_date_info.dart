class CalendarDateInfo {
  final DateTime date;
  final bool applyBorder;
  final bool enabled;
  CalendarDateInfo({
    required this.date,
    required this.applyBorder,
    required this.enabled,
  });
  CalendarDateInfo copyWith({
    DateTime? date,
    bool? applyBorder,
    bool? enabled,
  }) {
    return CalendarDateInfo(
      date: date ?? this.date,
      applyBorder: applyBorder ?? this.applyBorder,
      enabled: enabled ?? this.enabled,
    );
  }
}