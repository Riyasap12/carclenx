class LoginResponseModel {
  LoginResponseModel({
      this.status, 
      this.message, 
      this.data,});

  LoginResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        // data?.add(dynamic.fromJson(v));
      });
    }
  }
  String? status;
  String? message;
  List<dynamic>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}