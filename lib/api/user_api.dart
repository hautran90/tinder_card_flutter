import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pyco_test/api/api_response.dart';
import 'package:pyco_test/model/user_model.dart';

class UserApi {
  getRandomUser()async{
    try {
      Response response = await Dio().get('https://randomuser.me/api/0.4/?randomapi');
      ApiResponse apiResponse = ApiResponse(success: true, rawData: response.data, apiError: null);
      User user = User.fromJson(json.decode(response.data));
      apiResponse.model = user;
      return apiResponse;
    } catch (e) {
      print(e);
    }
  }
}