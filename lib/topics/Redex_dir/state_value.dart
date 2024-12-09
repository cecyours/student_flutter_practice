class UpdateValue {
  final int count;

  UpdateValue({required this.count});

  factory UpdateValue.DefaultValue() {
    return UpdateValue(count: 0);
  }
}
