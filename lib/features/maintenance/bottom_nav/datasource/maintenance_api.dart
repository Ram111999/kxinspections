import 'package:dio/dio.dart';

import '../../../../core/network/dio_client.dart';

class MaintenanceApi {
  final Dio _dio = DioClient.instance.dio;

  Future<Response> getBookings() async {
    return _dio.get("/maintenance/bookings");
  }

  Future<Response> getOutstandingCharge() async {
    return _dio.get("/maintenance/charges/outstanding");
  }

  Future<Response> getInventory() async {
    return _dio.get("/maintenance/inventory");
  }

  Future<Response> getInspections() async {
    return _dio.get("/maintenance/inspections");
  }

  Future<Response> getTasks() async {
    return _dio.get("/maintenance/tasks");
  }

  Future<Response> getChargeHistory() async {
    return _dio.get("/maintenance/charges/history");
  }
}
