import 'package:cloud_firestore/cloud_firestore.dart';

class DesignerModel {
  final String name;
  final String url;
  late final String? referenceID;
  DesignerModel({
    required this.name,
    required this.url,
  });
  factory DesignerModel.fromJson(Map<String, dynamic> json) =>
      _degsinerModelFromJson(json);
  Map<String, dynamic> toJson() => _designerModelToJson(this);
  factory DesignerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final newDesigner =
        DesignerModel.fromJson(snapshot.data() as Map<String, dynamic>);
    newDesigner.referenceID = snapshot.reference.id;
    return newDesigner;
  }
  @override
  String toString() => 'Events<$name>';
}

DesignerModel _degsinerModelFromJson(Map<String, dynamic> json) {
  return DesignerModel(
    name: json['name'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _designerModelToJson(DesignerModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
