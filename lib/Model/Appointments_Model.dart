class AppointmentModel {
  int? patientId;
  // int doctorId, clinicId;
  // String? patientId;
  int doctorId;
  int clinicId;

  // String clinicId;
  int appointmantId;
  String date;
  String status;
  String time;
  String? clinicName;
  String? doctorName;
  AppointmentModel(
      {required this.doctorId,
      this.patientId,
      required this.clinicId,
      required this.appointmantId,
      required this.date,
      required this.status,
      required this.time,
      this.clinicName,
      this.doctorName});
  factory AppointmentModel.fromJson(jsonData) {
    return AppointmentModel(
      doctorId: jsonData['doctor_id'],
      patientId: jsonData['patient_id'],
      clinicId: jsonData['clinic_id'],
      appointmantId: jsonData['id'],
      date: jsonData['date'],
      status: jsonData['status'],
      time: jsonData['time'],
    );
  }
  factory AppointmentModel.fromJson1(jsonData) {
    return AppointmentModel(
        doctorId: jsonData['doctor_id'],
        clinicId: jsonData['clinic_id'],
        appointmantId: jsonData['id'],
        date: jsonData['date'],
        status: jsonData['status'],
        time: jsonData['time'],
        clinicName: jsonData['clinic_name'],
        doctorName: jsonData['doctor_name']);
  }
}
