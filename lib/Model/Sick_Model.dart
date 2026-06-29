class SickModel {
  String name;
  String? image;
  int id;
  String phoneNumber;
  String gender;
  String birthDate;
  String bloodType;
  List<dynamic>? appointments;

  SickModel(
      {required this.name,
      required this.image,
      required this.id,
      required this.birthDate,
      required this.appointments,
      required this.bloodType,
      required this.gender,
      required this.phoneNumber});
  factory SickModel.fromJson(jsonData) {
    return SickModel(
      name: jsonData['name'],
      image: jsonData['image_url'],
      phoneNumber: jsonData['phone'],
      gender: jsonData['gender'],
      birthDate: jsonData['date_of_birth'],
      bloodType: jsonData['blood_type'],
      appointments: jsonData['appointments'],
      id: jsonData['id'],
    );
  }
}
