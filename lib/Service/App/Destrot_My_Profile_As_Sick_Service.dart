// import 'package:al_hadara/Constant/Const.dart';
// import 'package:http/http.dart' as http;

// class DestroyMyProfileAsSick {
//   Future<String> destroyMyProfileAsSick({required String id}) async {
//     http.Response response = await http.delete(
//         Uri.parse(
//             'https://medicore-production.up.railway.app/api/appointments/$id'),
//         headers: {
//           'Authorization':
//               'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbWVkaWNvcmUtcHJvZHVjdGlvbi51cC5yYWlsd2F5LmFwcC9hcGkvdXNlcnMvbG9naW4iLCJpYXQiOjE3NTcwMTUyODgsImV4cCI6MTc1NzAxODg4OCwibmJmIjoxNzU3MDE1Mjg4LCJqdGkiOiJwZ0V0blBqQklIZU9wUnJqIiwic3ViIjoiNiIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.CinvkpqH7T8YJZ-ZEDLm0NLatPTJLitcdWxurmSUnpI',
//           'Accept': 'application/json'
//         });

//     if (response.statusCode == 200) {
//       return success;
//     } else {
//       return fail;
//     }
//   }
// }
