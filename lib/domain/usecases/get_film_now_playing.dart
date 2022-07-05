import 'package:injectable/injectable.dart';
import 'package:moviex/domain/entities/film.dart';
import 'package:moviex/domain/repositories/film_repository.dart';
import 'package:moviex/utils/enum.dart';
import 'package:moviex/state/remote_state.dart';

@lazySingleton
class GetFilmNowPlaying {
  final FilmRepository repo;

  const GetFilmNowPlaying(this.repo);

  Future<RemoteState<List<Film>>> execute(FilmType type) async {
    return await repo.getNowPlaying(type);
  }
}
