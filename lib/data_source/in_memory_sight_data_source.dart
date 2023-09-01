import 'package:tourist_backend_dart_frog/data_source/sight_data_source.dart';
import 'package:tourist_backend_dart_frog/entity/sight.dart';

class InMemorySightDataSource implements SightDataSource {
  final _cache = <int, Sight>{};

  @override
  Future<List<Sight>> getAllSights() async => _cache.values.toList();

  @override
  Future<Sight?> getSightById(int id) async => _cache[id];

  @override
  Future<void> insertSight(Sight sight) async {
    final id = DateTime.now().millisecondsSinceEpoch;
    final newSight = sight.copyWith(id: id);
    _cache[id] = newSight;
  }

  @override
  Future<void> update(Sight sight) async => _cache.update(sight.id!, (value) => sight);

  @override
  Future<void> delete(final Sight sight) async => _cache.remove(sight.id!);

  @override
  Future<void> deleteById(int id) async => _cache.remove(id);
}
