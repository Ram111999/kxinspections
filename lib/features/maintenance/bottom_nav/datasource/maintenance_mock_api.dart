class MaintenanceMockApi {
  Future<List<Map<String, dynamic>>> getBookings() async {
    return [
      {
        "id": "b1",
        "startDate": "2025-09-01",
        "endDate": "2025-09-30",
        "unitCode": "OVA111",
      },
    ];
  }

  Future<Map<String, dynamic>> getCharge() async {
    return {
      "message":
          "A charge has been added to your account. Please review and pay this by",

      "deadline": "2025-09-30",

      "isAccepted": false,
    };
  }

  Future<List<Map<String, dynamic>>> getTasks() async {
    return [
      {
        "id": "TCK57",
        "title": "Task ID: #TCK57",
        "category": "Wardrobe",
        "notes": "Doors are hanging off",
        "location": "Oceanview > Apartment 2 > OVA111",
        "date": "2024-09-01",
        "status": "newTask",
        "images": [
          "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400",
          "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
        ],
      },
      {
        "id": "TCK58",
        "title": "Task ID: #TCK58",
        "category": "Cabinets",
        "notes": "Doors are hanging off",
        "location": "Oceanview > Apartment 2 > OVA111",
        "date": "2024-09-01",
        "status": "newTask",
        "images": [
          "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400",
          "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
        ],
      },
      {
        "id": "TCK59",
        "title": "Replace",
        "category": "Wardrobe",
        "notes": "Doors are hanging off",
        "location": "Oceanview > Apartment 2 > OVA111",
        "date": "2024-09-01",
        "status": "outstanding",
        "amount": 25.0,
        "images": [
          "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400",
          "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
          "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400",
          "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
          "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400",
          "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
          "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400",
          "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
          "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400",
          "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
          "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400",
          "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
          "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400",
          "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
          "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400",
          "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
          "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400",
          "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
          "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400",
          "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
          "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400",
          "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
          "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400",
          "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
          "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=400",
          "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=400",
        ],
      },
    ];
  }

  Future<List<Map<String, dynamic>>> getInventory() async {
    return [
      {
        "title": "My Inventory",

        "location": "Oceanview > Apartment 2 > OVA111",

        "date": "2025-09-01",

        "status": "Completed",

        "reportUrl": "https://example.com/reports/inventory/OVA111",
      },
    ];
  }

  Future<List<Map<String, dynamic>>> getInspections() async {
    return [
      {
        "id": "insp-1",

        "type": "Pre-Arrival",

        "location": "Oceanview > Apartment 2 > OVA111",

        "date": "2024-09-01",

        "status": "Completed",
      },
    ];
  }

  Future<List<Map<String, dynamic>>> getChargeHistory() async {
    return [
      {
        "title": "Wardrobe Replacement",

        "amount": 25.0,

        "date": "2024-06-12",

        "status": "paid",
      },
    ];
  }

  Future<Map<String, dynamic>?> getOutstandingCharge() async {
    return {
      "message":
          "A charge has been added to your account. Please review and pay this by",
      "deadline": "2025-09-30",
      "isAccepted": false,
    };
  }
}
