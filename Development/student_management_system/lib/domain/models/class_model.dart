final String tablePeriods = "Period";

class PeriodFields {
  static final List<String> values = [
    id,
    subject,
    day,
    type,
    location,
    startH,
    endH,
    startM,
    endM,
  ];

  static final String id = "_id";
  static final String subject = "fk_subject";
  static final String day = "day";
  static final String type = "type";
  static final String location = "location";
  static final String startH = "start";
  static final String endH = "end";
  static final String startM = "start";
  static final String endM = "end";
}

class Period {
  final int? id;
  int subject;
  int day;
  String type;
  String location;
  int startH;
  int endH;
  int startM;
  int endM;

  Period({
    this.id,
    required this.subject,
    required this.day,
    required this.type,
    required this.location,
    required this.startH,
    required this.endH,
    required this.startM,
    required this.endM,
  });

  factory Period.fromMap(Map<String, dynamic> json) => new Period(
        id: json[PeriodFields.id] as int,
        subject: json[PeriodFields.subject] as int,
        day: json[PeriodFields.day] as int,
        type: json[PeriodFields.type] as String,
        location: json[PeriodFields.location] as String,
        startH: json[PeriodFields.startH] as int,
        endH: json[PeriodFields.endH] as int,
        startM: json[PeriodFields.startM] as int,
        endM: json[PeriodFields.endM] as int,
      );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      PeriodFields.id: id,
      PeriodFields.subject: subject,
      PeriodFields.day: day,
      PeriodFields.type: type,
      PeriodFields.location: location,
      PeriodFields.startH: startH,
      PeriodFields.endH: endH,
      PeriodFields.startM: startM,
      PeriodFields.endM: endM,
    };

    return map;
  }
}
