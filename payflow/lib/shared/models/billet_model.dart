import 'dart:convert';

class BilletModel {
  final String? name;
  final String? dueDate;
  final double? value;
  final String? barcode;
  BilletModel({
    this.name,
    this.dueDate,
    this.value,
    this.barcode,
  });

  BilletModel copyWith({
    String? name,
    String? dueDate,
    double? value,
    String? barcode,
  }) {
    return BilletModel(
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      value: value ?? this.value,
      barcode: barcode ?? this.barcode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dueDate': dueDate,
      'value': value,
      'barcode': barcode,
    };
  }

  factory BilletModel.fromMap(Map<String, dynamic> map) {
    return BilletModel(
      name: map['name'],
      dueDate: map['dueDate'],
      value: map['value']?.toDouble(),
      barcode: map['barcode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BilletModel.fromJson(String source) =>
      BilletModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BilletModel(name: $name, dueDate: $dueDate, value: $value, barcode: $barcode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BilletModel &&
        other.name == name &&
        other.dueDate == dueDate &&
        other.value == value &&
        other.barcode == barcode;
  }

  @override
  int get hashCode {
    return name.hashCode ^ dueDate.hashCode ^ value.hashCode ^ barcode.hashCode;
  }
}
