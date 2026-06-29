class ServiceModel {
  String name;
  String description;
  ServiceModel({required this.name, required this.description});
  factory ServiceModel.fromJson(jsonData) {
    return ServiceModel(
      name: jsonData['name'],
      description: jsonData['description'],
    );
  }
}
