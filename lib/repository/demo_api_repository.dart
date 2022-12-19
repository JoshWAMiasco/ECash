import 'package:dio/dio.dart';
import 'package:ecash/repository/api_responce.dart';

class DemoApiRepository {
  String sampleUrl = 'https://api.sampleapis.com/coffee/hot';

  Future<ApiResponce> getUsers() async {
    try {
      var res = await Dio().get(sampleUrl);
      return ApiResponce(
        failure: false,
        data: res.data,
      );
    } catch (e) {
      return ApiResponce(
        failure: true,
      );
    }
  }
}
