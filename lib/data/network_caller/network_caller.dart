import 'dart:convert';

import 'package:http/http.dart';
import 'package:shop_nest/data/model/network_response_model.dart';

class NetworkCaller {
  static Future<NetworkResponseModel> getRequest(String url) async {
    try {
      Response response = await get(
        Uri.parse(url),
        headers: {
          'token': '',
        },
      );

      if (response.statusCode == 200) {
        final decodeData = jsonDecode(response.body);
        return NetworkResponseModel(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodeData,
        );
      } else if (response.statusCode == 401) {
        return NetworkResponseModel(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      } else {
        return NetworkResponseModel(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (error) {
      return NetworkResponseModel(
        statusCode: -1,
        isSuccess: false,
        errorMessage: error.toString(),
      );
    }
  }

  static Future<NetworkResponseModel> postRequest(String url, {Map<String, dynamic>? body}) async {
    try {
      Response response = await post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: {
          'Content-type': 'Application/json',
          'token': '',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodeData = jsonDecode(response.body);
        return NetworkResponseModel(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodeData,
        );
      } else if (response.statusCode == 401) {
        return NetworkResponseModel(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      } else {
        return NetworkResponseModel(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (error) {
      return NetworkResponseModel(
        statusCode: -1,
        isSuccess: false,
        errorMessage: error.toString(),
      );
    }
  }
}
