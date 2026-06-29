class ClinicModel {
  String? name;
  int? id;
  String? image;

  ClinicModel({this.name, this.id, this.image});

  factory ClinicModel.fromJson(jsonData) {
    return ClinicModel(
      name: jsonData['clinic_type'],
      id: jsonData['id'],
      image: jsonData['logo_url'],
    );
  }
}
