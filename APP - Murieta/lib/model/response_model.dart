class ResponseModel {
  int status;
  String message;
  dynamic data;

  ResponseModel({this.status = -1, this.message = "", this.data});
}
