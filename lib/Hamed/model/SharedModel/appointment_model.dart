class AppointmentModel {
  final int id;
  final int doctorId;
  final int patientId;
  final int clinicId;
  final String date;
  final String time;
  final String status;
  final String doctorName;
  final String patientName;
  final String clinicName;

  AppointmentModel({
    required this.id,
    required this.doctorId,
    required this.patientId,
    required this.clinicId,
    required this.date,
    required this.time,
    required this.status,
    required this.doctorName,
    required this.patientName,
    required this.clinicName,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['id'],
      doctorId: json['doctor_id'],
      patientId: json['patient_id'],
      clinicId: json['clinic_id'],
      date: json['date'],
      time: json['time'],
      status: json['status'],
      doctorName: json['doctor']['name'],
      patientName: json['patient']['name'],
      clinicName: json['doctor']['specialty'],
    );
  }
}
