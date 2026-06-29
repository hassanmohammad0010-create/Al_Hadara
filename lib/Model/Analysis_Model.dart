class AnalysisModel {
  String name;

  String information;

  AnalysisModel({required this.name, required this.information});
  factory AnalysisModel.fromJson(jsonData) {
    return AnalysisModel(
      name: jsonData['name'],
      information: jsonData['information'],
    );
  }
}
