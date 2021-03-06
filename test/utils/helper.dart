import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:moviex/data/repositories/datasources/local_data_source.dart';
import 'package:moviex/data/repositories/datasources/remote_data_source.dart';
import 'package:moviex/domain/repositories/film_repository.dart';

@GenerateMocks([
  Box,
  FilmRepository,
  RemoteDataSource,
  LocalDataSource,
])
void main() {}
