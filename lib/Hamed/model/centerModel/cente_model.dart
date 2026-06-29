class CenterModel {
  final int id;
  final String name;
  final String? logoUrl;
  final String location;
  final String startDay;
  final String endDay;
  final String startTime;
  final String endTime;

  CenterModel({
    required this.id,
    required this.name,
    this.logoUrl,
    required this.location,
    required this.startDay,
    required this.endDay,
    required this.startTime,
    required this.endTime,
  });

  factory CenterModel.fromJson(Map<String, dynamic> json) {
    return CenterModel(
      id: json['id'],
      name: json['name'],
      logoUrl: json['logo_url'],
      location: json['location'],
      startDay: json['start_day'],
      endDay: json['end_day'],
      startTime: json['start_time'],
      endTime: json['end_time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logo_url': logoUrl,
      'location': location,
      'start_day': startDay,
      'end_day': endDay,
      'start_time': startTime,
      'end_time': endTime,
    };
  }
}
