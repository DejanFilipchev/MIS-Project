import 'package:mis_project/request_model.dart';

class RequestStorage {
  static final RequestStorage _instance = RequestStorage._internal();
  factory RequestStorage() => _instance;
  RequestStorage._internal();

  final List<Request> _requests = [];

  List<Request> get requests => _requests;

  void addRequest(Request request) {
    _requests.add(request);
  }
}
