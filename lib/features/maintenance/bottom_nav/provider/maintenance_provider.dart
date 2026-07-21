import 'package:flutter/material.dart';

import '../../shared/models/maintenance_models.dart';
import '../datasource/maintenance_mock_api.dart';
import '../repository/dio_maintenance_repository.dart';
import '../repository/maintenance_repository.dart';

/// Which tab is active on the Maintenance Hub screen.
enum MaintenanceHubTab { open, history }

/// Supplies bookings, inventory, inspections, open tasks and charge
/// history to the Maintenance feature.
///
/// This is written against a repository interface so it's easy to
/// swap the in-memory demo data for a real `MaintenanceRepository`
/// once one exists in the project. If a `MaintenanceProvider` already
/// exists elsewhere in the app, merge this state/logic into it
/// instead of registering two providers.
class MaintenanceProvider extends ChangeNotifier {
  // MaintenanceProvider({MaintenanceRepository? repository})
  //   : _repository = repository ?? DemoMaintenanceRepository() {
  //   _load();
  // }
  MaintenanceProvider({MaintenanceRepository? repository})
    : _repository =
          repository ?? DioMaintenanceRepository(MaintenanceMockApi()) {
    _load();
  }
  final MaintenanceRepository _repository;

  bool isLoading = false;
  String? errorMessage;

  MaintenanceHubTab selectedTab = MaintenanceHubTab.open;

  List<MaintenanceBooking> bookings = const [];
  MaintenanceBooking? selectedBooking;

  MaintenanceCharge? outstandingCharge;

  List<InventoryRecord> inventory = const [];
  List<InspectionRecord> inspections = const [];
  List<MaintenanceTask> openTasks = const [];
  List<ChargeHistoryRecord> chargeHistory = const [];

  Future<void> _load() async {
    isLoading = true;
    notifyListeners();
    try {
      bookings = await _repository.fetchBookings();
      selectedBooking = bookings.isNotEmpty ? bookings.first : null;
      outstandingCharge = await _repository.fetchOutstandingCharge();
      inventory = await _repository.fetchInventory();
      inspections = await _repository.fetchInspections();
      openTasks = await _repository.fetchOpenTasks();
      chargeHistory = await _repository.fetchChargeHistory();
      errorMessage = null;
    } catch (e) {
      errorMessage = 'Unable to load maintenance details. Please try again.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refresh() => _load();

  void setTab(MaintenanceHubTab tab) {
    if (selectedTab == tab) return;
    selectedTab = tab;
    notifyListeners();
  }

  void selectBooking(MaintenanceBooking booking) {
    if (selectedBooking?.id == booking.id) return;
    selectedBooking = booking;
    notifyListeners();
    // Reload booking-scoped sections for the newly selected booking.
    _load();
  }

  void updateBookings(List<MaintenanceBooking> value) {
    bookings = value;
    notifyListeners();
  }

  void updateSelectedBooking(MaintenanceBooking? value) {
    selectedBooking = value;
    notifyListeners();
  }

  void updateOutstandingCharge(MaintenanceCharge? value) {
    outstandingCharge = value;
    notifyListeners();
  }

  void acceptTask(int index) {
    if (index < 0 || index >= openTasks.length) return;

    final task = openTasks[index];

    openTasks[index] = MaintenanceTask(
      id: task.id,
      title: task.title,
      category: task.category,
      categoryIcon: task.categoryIcon,
      notes: task.notes,
      location: task.location,
      date: task.date,
      status: MaintenanceTaskStatus.accepted,
      images: task.images,
      amount: task.amount,
    );

    notifyListeners();
  }

  void updateInventory(List<InventoryRecord> value) {
    inventory = value;
    notifyListeners();
  }

  void updateInspections(List<InspectionRecord> value) {
    inspections = value;
    notifyListeners();
  }

  void updateOpenTasks(List<MaintenanceTask> value) {
    openTasks = value;
    notifyListeners();
  }

  void updateChargeHistory(List<ChargeHistoryRecord> value) {
    chargeHistory = value;
    notifyListeners();
  }
}

/// Abstraction over the data source for the Maintenance feature so
/// the provider can be tested/reused independent of the transport
/// (REST API, local cache, etc.).
// abstract class MaintenanceRepository {
//   Future<List<MaintenanceBooking>> fetchBookings();
//   Future<MaintenanceCharge?> fetchOutstandingCharge();
//   Future<List<InventoryRecord>> fetchInventory();
//   Future<List<InspectionRecord>> fetchInspections();
//   Future<List<MaintenanceTask>> fetchOpenTasks();
//   Future<List<ChargeHistoryRecord>> fetchChargeHistory();
// }

// /// In-memory implementation used until a real repository is wired up.
// /// Replace with an API/DB backed implementation and pass it into
// /// `MaintenanceProvider(repository: ...)`.
// class DemoMaintenanceRepository implements MaintenanceRepository {
//   @override
//   Future<List<MaintenanceBooking>> fetchBookings() async {
//     return [
//       MaintenanceBooking(
//         id: 'b1',
//         startDate: DateTime(2025, 9, 1),
//         endDate: DateTime(2025, 9, 30),
//         unitCode: 'OVA111',
//       ),
//     ];
//   }

//   @override
//   Future<MaintenanceCharge?> fetchOutstandingCharge() async {
//     return MaintenanceCharge(
//       message:
//           'A charge has been added to your account. Please review and pay this by',
//       deadline: DateTime(2025, 9, 30),
//       isAccepted: false,
//     );
//   }

//   @override
//   Future<List<InventoryRecord>> fetchInventory() async {
//     return [
//       InventoryRecord(
//         title: 'My Inventory',
//         location: 'Oceanview > Apartment 2 > OVA111',
//         date: DateTime(2025, 9, 1),
//         status: 'Completed',
//         reportUrl: 'https://example.com/reports/inventory/OVA111',
//       ),
//     ];
//   }

//   @override
//   Future<List<InspectionRecord>> fetchInspections() async {
//     return [
//       InspectionRecord(
//         id: 'insp-1',
//         type: 'Pre-Arrival',
//         location: 'Oceanview > Apartment 2 > OVA111',
//         date: DateTime(2024, 9, 1),
//         status: 'Completed',
//       ),
//     ];
//   }

//   @override
//   Future<List<MaintenanceTask>> fetchOpenTasks() async {
//     return [
//       MaintenanceTask(
//         id: 'TCK57',
//         title: 'Task ID: #TCK57',
//         category: 'Wardrobe',
//         categoryIcon: Icons.checkroom_outlined,
//         notes: 'Doors are hanging off',
//         location: 'Oceanview > Apartment 2 > OVA111',
//         date: DateTime(2024, 9, 1),
//         status: MaintenanceTaskStatus.newTask,
//         images: [
//           'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400',
//           "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
//         ],
//       ),
//       MaintenanceTask(
//         id: 'TCK58',
//         title: 'Task ID: #TCK58',
//         category: 'Cabinets',
//         categoryIcon: Icons.kitchen_outlined,
//         notes: 'Doors are hanging off',
//         location: 'Oceanview > Apartment 2 > OVA111',
//         date: DateTime(2024, 9, 1),
//         status: MaintenanceTaskStatus.newTask,
//         images: [
//           'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400',
//           "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
//         ],
//       ),
//       MaintenanceTask(
//         id: 'TCK59',
//         title: 'Replace',
//         category: 'Wardrobe',
//         categoryIcon: Icons.checkroom_outlined,
//         notes: 'Doors are hanging off',
//         location: 'Oceanview > Apartment 2 > OVA111',
//         date: DateTime(2024, 9, 1),
//         status: MaintenanceTaskStatus.outstanding,
//         amount: 25.00,
//         images: [
//           'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400',
//           "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
//           'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400',
//           "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
//           'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400',
//           "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
//           'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400',
//           "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
//           'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400',
//           "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
//           'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400',
//           "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
//           'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400',
//           "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
//           'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400',
//           "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
//           'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400',
//           "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
//           'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400',
//           "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
//           'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400',
//           "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
//           'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400',
//           "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
//           'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400',
//           "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
//         ],
//       ),
//     ];
//   }

//   @override
//   Future<List<ChargeHistoryRecord>> fetchChargeHistory() async {
//     return [
//       ChargeHistoryRecord(
//         title: 'Wardrobe Replacement',
//         amount: 25.00,
//         date: DateTime(2024, 6, 12),
//         status: ChargeHistoryStatus.paid,
//       ),
//       ChargeHistoryRecord(
//         title: 'Cabinet Repair',
//         amount: 15.00,
//         date: DateTime(2024, 3, 4),
//         status: ChargeHistoryStatus.contested,
//       ),
//     ];
//   }
// }
