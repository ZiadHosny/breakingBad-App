// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';

class CharactersApi {
  final String _BASE_URL = 'https://breakingbadapi.com/api/';
  late Dio dio;
  CharactersApi() {
    BaseOptions options =
        BaseOptions(baseUrl: _BASE_URL, receiveDataWhenStatusError: true);
    dio = Dio(options);
  }
  Future<List<dynamic>> getAllCharacters() async {
    try {
      var response = await dio.get('characters');
      return response.data;
    } catch (e) {
      return [];
    }
  }

  Future<List<dynamic>> getAllQuotes(String name) async {
    try {
      var response = await dio.get('quote', queryParameters: {
        'author': name,
      });

      return response.data;
    } catch (e) {
      return [];
    }
  }
}
