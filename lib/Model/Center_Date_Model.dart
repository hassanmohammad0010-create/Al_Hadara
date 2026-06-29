class CenterDateModel {
  String clinic, doctor, date, hour, type, sickName;

  CenterDateModel(
      {required this.sickName,
      required this.clinic,
      required this.doctor,
      required this.date,
      required this.type,
      required this.hour});
  factory CenterDateModel.fromJson(jsonData) {
    return CenterDateModel(
      sickName: jsonData['sickName'],
      clinic: jsonData['clinic'],
      doctor: jsonData['doctor'],
      date: jsonData['date'],
      type: jsonData['type'],
      hour: jsonData['hour'],
    );
  }
}
