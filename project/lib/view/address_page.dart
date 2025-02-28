// import 'package:flutter/material.dart';
// import 'package:project/view/order_summary.dart';

// class AddressPage extends StatefulWidget {
//   const AddressPage({super.key});

//   @override
//   State<StatefulWidget> createState() => _AddressPageState();
// }

// class _AddressPageState extends State {
//   @override
//   Widget build(BuildContext Context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Add Delivery Address",
//           style: TextStyle(
//             color: Color(0xFF093D2E),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const TextField(
//               decoration: InputDecoration(
//                 labelText: "Full Name (Required) *",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 10),
//             const TextField(
//               decoration: InputDecoration(
//                 labelText: "Phone number (Required) *",
//                 border: OutlineInputBorder(),
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 5),
//             ElevatedButton(
//               onPressed: () {},
//               child: const Text("+ Add Alternate Phone Number"),
//             ),
//             const SizedBox(height: 5),
//             const Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       labelText: "Pincode (Required) *",
//                       border: OutlineInputBorder(),
//                     ),
//                     keyboardType: TextInputType.number,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             const Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       labelText: "State (Required) *",
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       labelText: "City (Required) *",
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             const TextField(
//               decoration: InputDecoration(
//                 labelText: "House No., Building Name (Required) *",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 10),
//             const TextField(
//               decoration: InputDecoration(
//                 labelText: "Road name, Area, Colony (Required) *",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 5),
//             ElevatedButton(
//               onPressed: () {},
//               child: const Text("+ Add Nearby Famous Shop/Mall/Landmark"),
//             ),
//             const SizedBox(height: 10),
//             const Text(
//               "Type of address",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             Row(
//               children: [
//                 ChoiceChip(
//                   label: const Text("Home"),
//                   selected: false,
//                   onSelected: (bool selected) {},
//                 ),
//                 const SizedBox(width: 10),
//                 ChoiceChip(
//                   label: const Text("Work"),
//                   selected: false,
//                   onSelected: (bool selected) {},
//                 ),
//               ],
//             ),
//             const Spacer(),
//             SizedBox(
//               width: 400,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF093D2E),
//                   padding: const EdgeInsets.symmetric(vertical: 16.0),
//                 ),
//                 onPressed: () {
//                   // Navigator.of(context)
//                   //     .push(MaterialPageRoute(builder: (context) {
//                   //   return const OrderSummary();
//                   // }));
//                 },
//                 child: const Text(
//                   "Save Address",
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/view/order_summary.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<StatefulWidget> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  // Controllers for the text fields
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController houseController = TextEditingController();
  final TextEditingController roadController = TextEditingController();

  // Selected address type
  String addressType = "Home";

  // Function to save address
  Future<void> _saveAddress() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("You must be logged in to save an address.")),
      );
      return;
    }

    final address = {
      'fullName': fullNameController.text.trim(),
      'phone': phoneController.text.trim(),
      'pincode': pincodeController.text.trim(),
      'state': stateController.text.trim(),
      'city': cityController.text.trim(),
      'house': houseController.text.trim(),
      'road': roadController.text.trim(),
      'type': addressType,
    };

    // Ensure required fields are filled
    if (address.values.any((value) => value.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all required fields.")),
      );
      return;
    }

    try {
      // Update Firestore with the address
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update({'address': address});

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Address saved successfully!")),
      );

      // Optionally navigate to the next page
      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OrderSummary()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to save address: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          true, // Ensures the body resizes when the keyboard is visible
      appBar: AppBar(
        title: const Text(
          "Add Delivery Address",
          style: TextStyle(
            color: Color(0xFF093D2E),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: fullNameController,
                decoration: const InputDecoration(
                  labelText: "Full Name (Required) *",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: "Phone number (Required) *",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: pincodeController,
                decoration: const InputDecoration(
                  labelText: "Pincode (Required) *",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: stateController,
                      decoration: const InputDecoration(
                        labelText: "State (Required) *",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: cityController,
                      decoration: const InputDecoration(
                        labelText: "City (Required) *",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                controller: houseController,
                decoration: const InputDecoration(
                  labelText: "House No., Building Name (Required) *",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: roadController,
                decoration: const InputDecoration(
                  labelText: "Road name, Area, Colony (Required) *",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Type of address",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  ChoiceChip(
                    label: const Text("Home"),
                    selected: addressType == "Home",
                    onSelected: (bool selected) {
                      setState(() {
                        addressType = "Home";
                      });
                    },
                  ),
                  const SizedBox(width: 10),
                  ChoiceChip(
                    label: const Text("Work"),
                    selected: addressType == "Work",
                    onSelected: (bool selected) {
                      setState(() {
                        addressType = "Work";
                      });
                    },
                  ),
                ],
              ),
              // const Spacer(),
              const SizedBox(
                height: 200,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF093D2E),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  onPressed: () {
                    _saveAddress();
                    setState(() {});
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Save Address",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
