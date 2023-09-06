import 'package:json_annotation/json_annotation.dart';

part 'sight.g.dart';

@JsonSerializable()
class Sight {
  final int? id;
  final String name;
  final String? description;
  final String? address;
  final double lat;
  final double lng;
  final int rating;

  const Sight({
    this.id,
    required this.name,
    this.description,
    this.address,
    required this.lat,
    required this.lng,
    this.rating = 0,
  });

  factory Sight.fromJson(final Map<String, dynamic> json) => _$SightFromJson(json);

  Map<String, dynamic> toJson() => _$SightToJson(this);

  Sight copyWith(
    {
    final int? id,
    final String? name,
    final String? description,
    final String? address,
    final double? lat,
    final double? lng,
    final int? rating,
  }
  ) =>
      Sight(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        address: address ?? this.address,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
        rating: rating ?? this.rating,
      );
}
