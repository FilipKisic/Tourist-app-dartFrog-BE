import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:tourist_backend_dart_frog/data_source/sight_data_source.dart';
import 'package:tourist_backend_dart_frog/entity/sight.dart';

FutureOr<Response> onRequest(RequestContext context) {
  switch (context.request.method) {
    case HttpMethod.get:
      return _getAllSights(context);
    case HttpMethod.post:
      return _post(context);
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.put:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _getAllSights(RequestContext context) async {
  final repository = context.read<SightDataSource>();
  final sights = await repository.getAllSights();
  return Response.json(body: sights);
}

Future<Response> _post(RequestContext context) async {
  final repository = context.read<SightDataSource>();
  final sight = Sight.fromJson(await context.request.json());

  try {
    await repository.insertSight(sight);
    return Response.json(statusCode: HttpStatus.created);
  } catch (e) {
    return Response.json(statusCode: HttpStatus.internalServerError);
  }
}
