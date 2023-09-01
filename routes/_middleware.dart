import 'package:dart_frog/dart_frog.dart';
import 'package:tourist_backend_dart_frog/data_source/in_memory_sight_data_source.dart';
import 'package:tourist_backend_dart_frog/data_source/sight_data_source.dart';

final _repository = InMemorySightDataSource();

Handler middleware(Handler handler) =>
    handler.use(requestLogger()).use(provider<SightDataSource>((_) => _repository));
