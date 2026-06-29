class LaboratoryModel {
  final int id;
  final String? logoUrl;
  final int centerId;
  final String startDay;
  final String endDay;
  final String startTime;
  final String endTime;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;

  LaboratoryModel({
    required this.id,
    this.logoUrl,
    required this.centerId,
    required this.startDay,
    required this.endDay,
    required this.startTime,
    required this.endTime,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
  });

  factory LaboratoryModel.fromJson(dynamic json) {
    return LaboratoryModel(
      id: json["id"] as int,
      logoUrl: json["logo_url"] as String?, // can be null
      centerId: json["center_id"] as int,
      startDay: json["start_day"] as String,
      endDay: json["end_day"] as String,
      startTime: json["start_time"] as String,
      endTime: json["end_time"] as String,
      createdAt: DateTime.parse(json["created_at"] as String),
      updatedAt: DateTime.parse(json["updated_at"] as String),
      name: json["name"] as String,
    );
  }
}
