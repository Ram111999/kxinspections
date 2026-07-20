import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../shared/models/maintenance_models.dart';

/// Booking dropdown selector shown below the Open/History tabs, in
/// the format "MM/DD/YYYY > MM/DD/YYYY - OVA111".
class BookingSelector extends StatelessWidget {
  const BookingSelector({
    super.key,
    required this.bookings,
    required this.selected,
    required this.onChanged,
  });

  final List<MaintenanceBooking> bookings;
  final MaintenanceBooking? selected;
  final ValueChanged<MaintenanceBooking> onChanged;

  @override
  Widget build(BuildContext context) {
    if (selected == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Booking', style: AppTextStyles.bodySmall),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.cardMuted,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: selected!.id,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.textSecondary,
              ),
              style: AppTextStyles.bookingLabel,
              onChanged: (id) {
                final booking = bookings.firstWhere((b) => b.id == id);
                onChanged(booking);
              },
              items: bookings
                  .map(
                    (b) => DropdownMenuItem<String>(
                      value: b.id,
                      child: Text(b.label, overflow: TextOverflow.ellipsis),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
