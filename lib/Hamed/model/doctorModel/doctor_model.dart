class DoctorModel {
  String name;
  String? photo;
  String? specialty;
  int id;

  // int clinicId;

  // List<String> certificates;
  // List<String> services;
  // int startTime;
  // int endTime;
  // String startDay;
  // String endDay;

  DoctorModel({
    required this.name,
    required this.id,
    // required this.clinicId,
    required this.photo,
    required this.specialty,
    // required this.certificates,
    // required this.services,
    // required this.startTime,
    // required this.endTime,
    // required this.startDay,
    // required this.endDay,
  });

  factory DoctorModel.fromJson(jsonData) {
    return DoctorModel(
      name: jsonData['name'],
      id: jsonData['id'],
      // clinicId: jsonData['clinic_id'],
      photo: jsonData['image_url'],
      specialty: jsonData['specialty'],
      // certificates: jsonData['certificates'],
      // services: jsonData['services'],
      // startDay: jsonData['startDay'],
      // endTime: jsonData['endTime'],
      // startTime: jsonData['startTime'],
      // endDay: jsonData['endDay'],
    );
  }
}
