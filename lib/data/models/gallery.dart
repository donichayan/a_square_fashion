import 'package:cloud_firestore/cloud_firestore.dart';

class GalleryModel {
  final String name;
  final String url;
  late final String? referenceID;
  GalleryModel({
    required this.name,
    required this.url,
  });
  factory GalleryModel.fromJson(Map<String, dynamic> json) =>
      _galleryModelFromJson(json);
  Map<String, dynamic> toJson() => _galleryModelToJson(this);
  factory GalleryModel.fromSnapshot(DocumentSnapshot snapshot) {
    final newEvent =
        GalleryModel.fromJson(snapshot.data() as Map<String, dynamic>);
    newEvent.referenceID = snapshot.reference.id;
    return newEvent;
  }
  @override
  String toString() => 'Events<$name>';
}

GalleryModel _galleryModelFromJson(Map<String, dynamic> json) {
  return GalleryModel(
    name: json['name'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _galleryModelToJson(GalleryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
