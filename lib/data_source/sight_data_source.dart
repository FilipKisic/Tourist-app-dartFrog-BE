import 'package:tourist_backend_dart_frog/entity/sight.dart';

abstract interface class SightDataSource {
  Future<List<Sight>> getAllSights();
  Future<Sight?> getSightById(int id);
  Future<void> insertSight(Sight sight);
  Future<void> update(Sight sight);
  Future<void> delete(Sight sight);
  Future<void> deleteById(int id);
}