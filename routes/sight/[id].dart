import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:tourist_backend_dart_frog/data_source/sight_data_source.dart';

FutureOr<Response> onRequest(RequestContext context, String id) {
  switch (context.request.method) {
    case HttpMethod.get:
      return _getById(context, id);
    case HttpMethod.post:
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.put:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _getById(RequestContext context, String id) async {
  final repository = context.read<SightDataSource>();
  final sight = await repository.getSightById(int.parse(id));
  if (sight == null) {
    return Response(statusCode: HttpStatus.notFound, body: 'Not found');
  } else {
    return Response.json(body: sight);
  }
}
