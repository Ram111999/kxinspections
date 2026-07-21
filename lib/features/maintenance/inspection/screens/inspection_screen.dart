// import 'package:flutter/material.dart';
// import 'package:kxinspections/core/constants/app_strings.dart';

// class InspectionScreen extends StatelessWidget {
//   const InspectionScreen({super.key, required this.inspectionId});

//   final String inspectionId;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text(AppStrings.viewInspection)),
//       body: Center(child: Text('Inspection: $inspectionId')),
//     );
//   }
// }
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';

class PreArrivalInspectionScreen extends StatelessWidget {
  const PreArrivalInspectionScreen({super.key, required this.inspectionId});
  final String inspectionId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Pre-Arrival Inspection",
          style: AppTextStyles.appBarTitle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header Image
            SizedBox(
              height: 180,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    "https://images.unsplash.com/photo-1568605114967-8130f3a36994?w=1200",
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.white, Colors.transparent],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Below are the actions and updates created as part of this inspection.",
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  ),

                  const SizedBox(height: 24),

                  /// Outstanding Charges
                  const Text(
                    "Outstanding Charges",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  const SizedBox(height: 16),

                  _outstandingCard(),

                  const SizedBox(height: 30),

                  /// General
                  const Text(
                    "General",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  const SizedBox(height: 12),

                  _generalCard(),

                  const SizedBox(height: 30),

                  /// Item Actions
                  const Text(
                    "Item Actions",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  const SizedBox(height: 12),

                  _itemActionCard(),

                  const SizedBox(height: 30),

                  /// Item Updates
                  const Text(
                    "Item Updates",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  const SizedBox(height: 12),

                  _updateCard(
                    title: "Bed",
                    subtitle: "No visible signs of damage.",
                  ),

                  const SizedBox(height: 12),

                  _updateCard(title: "Lamp", subtitle: "Slight wear and tear."),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _outstandingCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardMuted,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(child: Text("Replace", style: AppTextStyles.cardTitle)),
              Icon(Icons.circle, size: 10, color: AppColors.error),
              SizedBox(width: 6),
              Text(
                "Outstanding",
                style: TextStyle(color: AppColors.textPrimary),
              ),
            ],
          ),

          const SizedBox(height: 18),

          _detailRow(Icons.chair_outlined, "Wardrobe"),
          _detailRow(Icons.build_outlined, "Doors are hanging off"),
          _detailRow(
            Icons.location_on_outlined,
            "Oceanview > Apartment 2 > OVA111",
          ),
          _detailRow(Icons.attach_money, "£25.00"),
        ],
      ),
    );
  }

  static Widget _generalCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardMuted,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Text(
        "10/09/24     This room needs to be cleaned please - will re-inspect in 1 week.",
        style: TextStyle(fontSize: 15, color: AppColors.textSecondary),
      ),
    );
  }

  static Widget _itemActionCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85",
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 16),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Item", style: TextStyle(color: AppColors.textSecondary)),
                Text(
                  "Wardrobe",
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Text("Notes", style: TextStyle(color: AppColors.textSecondary)),
                Text(
                  "Doors are hanging off.",
                  style: TextStyle(color: AppColors.textSecondary),
                ),
                SizedBox(height: 10),
                Text(
                  "Charge",
                  style: TextStyle(color: AppColors.textSecondary),
                ),
                Text(
                  "£25.00",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _updateCard({required String title, required String subtitle}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardMuted,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.cardTitle),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 15,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _detailRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text, style: TextStyle(color: AppColors.textSecondary)),
          ),
        ],
      ),
    );
  }
}
