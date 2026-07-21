import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kxinspections/core/constants/app_strings.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../bottom_nav/provider/maintenance_provider.dart';
import '../../shared/models/maintenance_models.dart';

class ChargeScreen extends StatefulWidget {
  const ChargeScreen({super.key, required this.index});

  final String index;

  @override
  State<ChargeScreen> createState() => _ChargeScreenState();
}

class _ChargeScreenState extends State<ChargeScreen> {
  final ScrollController _imageScrollController = ScrollController();
  @override
  void dispose() {
    _imageScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MaintenanceProvider>();
    // final provider = Provider.of<MaintenanceProvider>(context, listen: false);
    final MaintenanceTask task;
    // task = provider.openTasks[int.parse(index)];
    if (provider.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    } else {
      task = provider.openTasks[int.parse(widget.index)];
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          centerTitle: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
          title: const Text(
            AppStrings.viewCharge,
            style: AppTextStyles.appBarTitle,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header Image
              SizedBox(
                height: 170,
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
                      "The below charge has been raised against your account.\n"
                      "Please accept or contest this by 30/09/2025 or this will "
                      "automatically be accepted on your behalf.",
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                    ),

                    const SizedBox(height: 24),

                    //
                    _infoCard(title: "Item", value: task.category),

                    const SizedBox(height: 16),

                    _infoCard(title: "Type", value: task.title),

                    const SizedBox(height: 16),

                    _infoCard(title: "Notes", value: task.notes),

                    const SizedBox(height: 16),

                    _infoCard(title: "Amount", value: "${task.amount}"),

                    const SizedBox(height: 24),
                    Scrollbar(
                      controller: _imageScrollController,
                      thumbVisibility: true,
                      child: SizedBox(
                        height: 64,
                        child: ListView.separated(
                          controller: _imageScrollController,
                          scrollDirection: Axis.horizontal,
                          itemCount: task.images.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 16),
                          itemBuilder: (context, index) =>
                              _imageTile(task.images[index]),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: AppColors.error,
                            width: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          context.push('/contest/${"2"}');
                        },
                        child: const Text(
                          "Contest",
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff304A8D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          if (provider.outstandingCharge != null) {
                            provider.updateOutstandingCharge(
                              provider.outstandingCharge!.copyWith(
                                isAccepted: true,
                              ),
                            );

                            provider.acceptTask(int.parse(widget.index));
                            context.pop();
                          }
                        },
                        child: const Text(
                          "Accept",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _infoCard({required String title, required String value}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xffF4F4F4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey, fontSize: 13)),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageTile(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(image, width: 64, height: 64, fit: BoxFit.cover),
    );
  }
}
