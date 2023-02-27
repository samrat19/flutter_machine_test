import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../model/availability_response_model.dart';

class APIService {
  Dio dio = Dio();

  Future<AvailabilityResponseModel?> getAvailableTime() async {
    try {
      final formData = FormData.fromMap({
        'date': '2023-02-27',
        'time': '10:30',
        'person': '2',
        'latitude': '53.798407',
        'longitude': '-1.548248',
      });

      Response response = await dio.post(
        options: Options(
          headers: {
            'x-api-key': 'NB10SKS20AS30',
          },
        ),
        'https://igmiweb.com/gladdenhub/Api/search_table',
        data: formData,
      );

      if (kDebugMode) {
        print(response.data);
      }

      return AvailabilityResponseModel.fromJson(response.data);
    } catch (e, stackTrace) {
      if (e is DioError) {
        if (kDebugMode) {
          print('Dio Error: ${e.response}');
        }
      } else {
        if (kDebugMode) {
          print('Error: $e');
        }
      }

      if (kDebugMode) {
        print(stackTrace.toString());
      }

      return null;
    }
  }
}
