import 'dart:convert';

class AwnserModel {
  final String title;
  final bool isRight;

  AwnserModel({
    required this.title,
    this.isRight = false,
  });

  AwnserModel copyWith({
    String? title,
    bool? isRight,
  }) {
    return AwnserModel(
      title: title ?? this.title,
      isRight: isRight ?? this.isRight,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isRight': isRight,
    };
  }

  factory AwnserModel.fromMap(Map<String, dynamic> map) {
    return AwnserModel(
      title: map['title'],
      isRight: map['isRight'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AwnserModel.fromJson(String source) =>
      AwnserModel.fromMap(json.decode(source));

  @override
  String toString() => 'AwnserModel(title: $title, isRight: $isRight)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AwnserModel &&
        other.title == title &&
        other.isRight == isRight;
  }

  @override
  int get hashCode => title.hashCode ^ isRight.hashCode;
}
