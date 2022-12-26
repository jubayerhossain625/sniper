
class DataModel {
  DataModel({
    this.statusCode,
    this.path,
  });

  String? statusCode;
  String? path;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    statusCode: json["status_code"],
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "path": path,
  };
}
