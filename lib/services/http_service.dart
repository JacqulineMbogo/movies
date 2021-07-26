import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/models/app_config.dart';

class HttpService{

  final Dio dio = Dio();

  final GetIt getIt = GetIt.instance;
  late String  _baseUrl ;
  late String  _apiKey ;


  HttpService(){
    AppConfig _config = getIt.get<AppConfig>();

     _baseUrl = _config.API_BASE_URL;
     _apiKey  = _config.API_KEY;
  }

  Future<Response> get(String _path, {required Map<String, dynamic> query}) async {

      String _url = '$_baseUrl$_apiKey';
      Map<String, dynamic> _query ={

      'api_key':_apiKey,
      'language':'en-us',
      };

      _query.addAll(query);

     return await dio.get(_url,queryParameters: _query);




  }


}