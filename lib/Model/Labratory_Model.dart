import 'package:al_hadara/Model/Analysis_Model.dart';

class Labaratory {
  String name;

  List<AnalysisModel> analysis;

  Labaratory({required this.name, required this.analysis});
  factory Labaratory.fromJson(jsonData) {
    return Labaratory(
      name: jsonData['title'],
      analysis: jsonData['analysis'],
    );
  }
}
