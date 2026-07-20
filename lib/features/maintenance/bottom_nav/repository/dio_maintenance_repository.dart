import 'package:flutter/material.dart';

import '../../shared/models/maintenance_models.dart';
import '../datasource/maintenance_mock_api.dart';
import 'maintenance_repository.dart';

class DioMaintenanceRepository implements MaintenanceRepository {
  final MaintenanceMockApi api;

  DioMaintenanceRepository(this.api);

  @override
  Future<List<MaintenanceBooking>> fetchBookings() async {
    final data = await api.getBookings();

    return data.map((json) {
      return MaintenanceBooking(
        id: json["id"],

        startDate: DateTime.parse(json["startDate"]),

        endDate: DateTime.parse(json["endDate"]),

        unitCode: json["unitCode"],
      );
    }).toList();
  }

  @override
  Future<MaintenanceCharge?> fetchOutstandingCharge() async {
    final json = await api.getOutstandingCharge();

    if (json == null) {
      return null;
    }

    return MaintenanceCharge(
      message: json["message"],

      deadline: DateTime.parse(json["deadline"]),

      isAccepted: json["isAccepted"],
    );
  }

  @override
  Future<List<InventoryRecord>> fetchInventory() async {
    final data = await api.getInventory();

    return data.map((json) {
      return InventoryRecord(
        title: json["title"],

        location: json["location"],

        date: DateTime.parse(json["date"]),

        status: json["status"],

        reportUrl: json["reportUrl"],
      );
    }).toList();
  }

  @override
  Future<List<InspectionRecord>> fetchInspections() async {
    final data = await api.getInspections();

    return data.map((json) {
      return InspectionRecord(
        id: json["id"],

        type: json["type"],

        location: json["location"],

        date: DateTime.parse(json["date"]),

        status: json["status"],
      );
    }).toList();
  }

  @override
  Future<List<MaintenanceTask>> fetchOpenTasks() async {
    final data = await api.getTasks();

    return data.map((json) {
      return MaintenanceTask(
        id: json["id"],

        title: json["title"],

        category: json["category"],

        categoryIcon: json["category"] == "Cabinets"
            ? Icons.kitchen_outlined
            : Icons.checkroom_outlined,

        notes: json["notes"],

        location: json["location"],

        date: DateTime.parse(json["date"]),

        status: json["status"] == "newTask"
            ? MaintenanceTaskStatus.newTask
            : MaintenanceTaskStatus.outstanding,

        amount: (json["amount"] as num?)?.toDouble(),

        images: List<String>.from(json["images"] ?? []),
      );
    }).toList();
  }

  @override
  Future<List<ChargeHistoryRecord>> fetchChargeHistory() async {
    final data = await api.getChargeHistory();

    return data.map((json) {
      return ChargeHistoryRecord(
        title: json["title"],

        amount: (json["amount"] as num).toDouble(),
        date: DateTime.parse(json["date"]),

        status: json["status"] == "paid"
            ? ChargeHistoryStatus.paid
            : ChargeHistoryStatus.contested,
      );
    }).toList();
  }
}
