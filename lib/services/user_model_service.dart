import 'package:dio/dio.dart';
import 'package:flutter_api_json/models/user_model.dart';

class UserModelApi {
  Future<List<UserModel>>? getUserList() async {
    try {
      var response =
          await Dio().get("https://jsonplaceholder.typicode.com/users");
      List<UserModel>? _userList = [];
      if (response.statusCode == 200) {
        // print(response.data.toString());
        _userList =
            (response.data as List).map((e) => UserModel.fromMap(e)).toList();
      }
      return _userList;
    } on DioError catch (e) {
      print(e.toString());
      return Future.error(e.message);
    }
  }
}
