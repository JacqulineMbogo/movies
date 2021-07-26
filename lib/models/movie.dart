import 'package:get_it/get_it.dart';
import 'package:movies/models/app_config.dart';

class Movie {
  final String name,
                language,
                description,
                postapath,
                backdroppath,
                rating,
                releaseDate;
  final bool isAdult;

  Movie(this.name, this.language, this.isAdult, this.description,
      this.postapath, this.backdroppath, this.rating, this.releaseDate);

  factory Movie.fromJson(Map<String, dynamic> _json) {
    return Movie(
        _json['title'],
        _json['original_language'],
        _json['adult'],
        _json['overview'],
        _json['poster_path'],
        _json['backdrop_path'],
        _json['vote_average'],
        _json['release_date']);
  }
  String posterUrl(){

    final AppConfig _appConfig = GetIt.instance.get<AppConfig>();
    return '${_appConfig.BASE_IMAGE_URL}${this.postapath}';

  }
}
