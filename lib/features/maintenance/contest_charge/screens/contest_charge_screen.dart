import 'package:flutter/material.dart';

class ContestChargeScreen extends StatefulWidget {
  const ContestChargeScreen({super.key, required this.chargeId});

  final String chargeId;

  @override
  State<ContestChargeScreen> createState() => _ContestChargeScreenState();
}

class _ContestChargeScreenState extends State<ContestChargeScreen> {
  final TextEditingController reasonController = TextEditingController(
    text: "This wasn't me this was my roommate. I was on holiday",
  );

  @override
  void dispose() {
    reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                /// HEADER IMAGE
                SizedBox(
                  height: 150,
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

                      Positioned(
                        left: 20,
                        bottom: 20,

                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },

                              child: const Icon(
                                Icons.arrow_back,
                                size: 28,
                                color: Colors.black87,
                              ),
                            ),

                            const SizedBox(width: 8),

                            const Text(
                              "Contest Charge",

                              style: TextStyle(
                                fontSize: 24,

                                fontWeight: FontWeight.w700,

                                color: Colors.black87,
                              ),
                            ),
                          ],
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
                        "Please explain in your own words why you wish to contest\nthis charge.",

                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),

                      const SizedBox(height: 25),

                      /// REASON CARD
                      Container(
                        width: double.infinity,

                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),

                        decoration: BoxDecoration(
                          color: const Color(0xffF5F5F5),

                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  const Text(
                                    "Reason",

                                    style: TextStyle(
                                      fontSize: 12,

                                      color: Colors.grey,
                                    ),
                                  ),

                                  const SizedBox(height: 4),

                                  Text(
                                    reasonController.text,

                                    style: const TextStyle(
                                      fontSize: 13,

                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            IconButton(
                              onPressed: () {
                                _showEditDialog();
                              },

                              icon: const Icon(
                                Icons.edit_outlined,

                                size: 20,

                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            /// SUBMIT BUTTON
            Positioned(
              left: 20,

              right: 20,

              bottom: 20,

              child: SizedBox(
                height: 52,

                width: double.infinity,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff304A8D),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),

                  onPressed: () {
                    // Submit contest
                  },

                  child: const Text(
                    "Submit",

                    style: TextStyle(
                      color: Colors.white,

                      fontSize: 14,

                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog() {
    showDialog(
      context: context,

      builder: (context) {
        final controller = TextEditingController(text: reasonController.text);

        return AlertDialog(
          title: const Text("Edit Reason"),

          content: TextField(
            controller: controller,

            maxLines: 5,

            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text("Cancel"),
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  reasonController.text = controller.text;
                });

                Navigator.pop(context);
              },

              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
