import '../../shared/models/maintenance_models.dart';

abstract class MaintenanceRepository {
  Future<List<MaintenanceBooking>> fetchBookings();

  Future<MaintenanceCharge?> fetchOutstandingCharge();

  Future<List<InventoryRecord>> fetchInventory();

  Future<List<InspectionRecord>> fetchInspections();

  Future<List<MaintenanceTask>> fetchOpenTasks();

  Future<List<ChargeHistoryRecord>> fetchChargeHistory();
}
