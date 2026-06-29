class DropDownModel {
  final String option;
  final int id;

  DropDownModel(this.option, this.id);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DropDownModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'DropDownModel(option: $option, id: $id)';
}
