class Data {
  final String wrong;
  final String right;

  Data(this.wrong, this.right);

  Data.fromJson(Map<dynamic, dynamic> json)
      : wrong = json['wrong'] as String,
        right = json['right'] as String;
  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'wrong': wrong,
        'right': right,
      };
}
