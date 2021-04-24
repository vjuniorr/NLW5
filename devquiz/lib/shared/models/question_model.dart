import 'dart:convert';

import 'package:DevQuiz/shared/models/awnser_model.dart';
import 'package:collection/collection.dart';

class QuestionModel {
  final String title;
  final List<AwnserModel> awnsers;

  QuestionModel({
    required this.title,
    required this.awnsers,
  }) : assert(
          awnsers.length == 4,
        );

  QuestionModel copyWith({
    String? title,
    List<AwnserModel>? awnsers,
  }) {
    return QuestionModel(
      title: title ?? this.title,
      awnsers: awnsers ?? this.awnsers,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'awnsers': awnsers.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      title: map['title'],
      awnsers: List<AwnserModel>.from(
          map['awnsers']?.map((x) => AwnserModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));

  @override
  String toString() => 'QuestionModel(title: $title, awnsers: $awnsers)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is QuestionModel &&
        other.title == title &&
        listEquals(other.awnsers, awnsers);
  }

  @override
  int get hashCode => title.hashCode ^ awnsers.hashCode;
}
