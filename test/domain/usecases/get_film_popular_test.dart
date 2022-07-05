import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:moviex/domain/usecases/get_film_popular.dart';
import 'package:moviex/utils/enum.dart';
import 'package:moviex/state/remote_state.dart';

import '../../fake/data.dart';
import '../../utils/helper.mocks.dart';

void main() {
  late GetFilmPopular usecase;
  late MockFilmRepository mock;

  setUp(() {
    mock = MockFilmRepository();
    usecase = GetFilmPopular(mock);
  });
  group('Movie', () {
    test('should success', () async {
      when(mock.getPopular(any)).thenAnswer(
        (_) async => RemoteState.success(data: [moviefilm]),
      );
      (await usecase.execute(FilmType.movie)).maybeWhen(
        orElse: () {
          expect(true, false);
        },
        success: (value) {
          expect(value, [moviefilm]);
        },
        error: (message) {
          expect(message, null);
        },
      );
    });
  });
  group('TV', () {
    test('should success', () async {
      when(mock.getPopular(any)).thenAnswer(
        (_) async => RemoteState.success(data: [tvfilm]),
      );
      (await usecase.execute(FilmType.tv)).maybeWhen(
        orElse: () {
          expect(true, false);
        },
        success: (value) {
          expect(value, [tvfilm]);
        },
        error: (message) {
          expect(message, null);
        },
      );
    });
  });
}