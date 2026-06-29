bool visible({
  required String month,
  required String day,
  required String hour,
}) {
  //  int monthAppointment = int.parse(textEditingController.text.substring(5, 7));
  //             int dayAppointment = int.parse(textEditingController.text.substring(8, 10));
  int monthAppointment = int.parse(month);
  int dayAppointment = int.parse(day);
  int hourAppointment = int.parse('10');
  DateTime nowDate = DateTime.now();
  int nowMonth = nowDate.month;
  int nowDay = nowDate.day;
  int nowHour = nowDate.hour;
  // print('$month   $day   $hour');
  // print('$nowMonth   $nowDay   $nowHour');

  if (monthAppointment <= nowMonth &&
      dayAppointment <= nowDay &&
      hourAppointment < nowHour) {
    return false;
  } else {
    return true;
  }
}
