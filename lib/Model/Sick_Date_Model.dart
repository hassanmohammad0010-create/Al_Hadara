class SickDateModel {
  String clinic, doctor, date, type;

  SickDateModel(
      {required this.clinic,
      required this.doctor,
      required this.date,
      required this.type});
  factory SickDateModel.fromJson(jsonData) {
    return SickDateModel(
      clinic: jsonData['clinic'],
      doctor: jsonData['doctor'],
      date: jsonData['date'],
      type: jsonData['type'],
    );
  }
}
