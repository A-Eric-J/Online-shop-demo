import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'wine.g.dart';

@HiveType(typeId: 0)
class Wine extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final double code;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String imageUrl;

  Wine({
    required this.id,
    required this.name,
    required this.code,
    required this.description,
    required this.imageUrl,
  });

  factory Wine.fromJson(Map<String, dynamic> json) {
    return Wine(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  @override
  List<Object> get props => [id, name, code ,description, imageUrl];
}
