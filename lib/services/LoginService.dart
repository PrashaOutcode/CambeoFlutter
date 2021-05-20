import 'package:http/http.dart' as http;
import 'package:world_time/request/LoginRequest.dart';
import 'package:world_time/response/LoginResponse.dart';
import 'dart:convert';


Future<LoginResponse> login(LoginRequest request) async {
  final response =  await http.post(('https://api.stage.jipejobs.com/api/v1/auth/'+'login/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(request),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    return LoginResponse.fromJson(jsonDecode(response.body));
  } else {
    print("body:${response.body}");
    print("request:${response.request}");
    print("statusCode:${response.statusCode}");
    throw Exception('Failed ');
  }

}








//https://api.stage.jipejobs.com/api/v1/auth/login/
