final String tablePeriods = "Period";

class PeriodFields {
  static final List<String> values = [
    id,
    subject,
    day,
    type,
    location,
    start,
    end,
  ];

  static final String id = "_id";
  static final String subject = "fk_subject";
  static final String day = "day";
  static final String type = "type";
  static final String location = "location";
  static final String start = "start";
  static final String end = "end";
}

class Period {
  final int? id;
  int subject;
  int day;
  String type;
  String location;
  DateTime start;
  DateTime end;

  Period({
    this.id,
    required this.subject,
    required this.day,
    required this.type,
    required this.location,
    required this.start,
    required this.end,
  });

  factory Period.fromMap(Map<String, dynamic> json) => new Period(
        id: json[PeriodFields.id] as int,
        subject: json[PeriodFields.subject] as int,
        day: json[PeriodFields.day] as int,
        type: json[PeriodFields.type] as String,
        location: json[PeriodFields.location] as String,
        start: DateTime.parse(json[PeriodFields.start] as String),
        end: DateTime.parse(json[PeriodFields.end] as String),
      );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      PeriodFields.id: id,
      PeriodFields.subject: subject,
      PeriodFields.day: day,
      PeriodFields.type: type,
      PeriodFields.location: location,
      PeriodFields.start: start.toIso8601String(),
      PeriodFields.end: end.toIso8601String(),
    };

    return map;
  }
}
