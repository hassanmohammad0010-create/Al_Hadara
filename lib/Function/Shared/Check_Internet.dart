import 'dart:io';

Future<bool> checkInternet() async {
  try {
    var res = await InternetAddress.lookup('google.com');
    if (res.isNotEmpty && res[0].rawAddress.isNotEmpty) {
      return true;
    }
  } catch (e) {
    return false;
  }
  return false;
}
