import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/services/http_service.dart';

class MoviesService{


  final GetIt getIt = GetIt.instance;

  late HttpService _httpService;

  MoviesService(){

    _httpService = getIt.get<HttpService>();

  }
}