import 'package:fitness_app/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdditionalInfoScreen extends StatefulWidget {
  final String username;
  final String email;
  final String password;
  final String contactNumber;

  const AdditionalInfoScreen({
    super.key,
    required this.username,
    required this.email,
    required this.password,
    required this.contactNumber,
  });

  @override
  _AdditionalInfoScreenState createState() => _AdditionalInfoScreenState();
}

class _AdditionalInfoScreenState extends State<AdditionalInfoScreen> {
  String _selectedHeightUnit = 'ft';
  String _selectedWeightUnit = 'kg';
  double _heightValue = 5.0; // Default height in feet
  double _weightValue = 60.0; // Default weight in kilograms
  String _selectedGender = 'Male'; // Default gender
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _caloriesGoalController = TextEditingController();

  final _caloriesConsumed = 0.0; // Example data
  double _caloriesGoal = 2500.0; // Example goal

  @override
  void dispose() {
    _ageController.dispose();
    _caloriesGoalController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_ageController.text.isEmpty || _caloriesGoalController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _caloriesGoal =
          double.tryParse(_caloriesGoalController.text) ?? _caloriesGoal;
    });

    // Handle additional info logic here (e.g., save the data)

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('User created successfully!'),
        backgroundColor: Colors.green,
      ),
    );

    // Directly navigate to HomeScreen (or BottomBar, depending on your choice)
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => BottomBar()), // Change to BottomBar() if needed
    );
  }

  @override
  Widget build(BuildContext context) {
    double progress = _caloriesConsumed / _caloriesGoal;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Additional Info",
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromRGBO(187, 242, 70, 1),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white, // Change background color to white
        ),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Age
              _buildSectionTitle("Age"),
              _buildSectionSubtitle(
                  "Enter your age for personalized recommendations."),
              const SizedBox(height: 10),
              TextField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter your age",
                  border: const OutlineInputBorder(),
                  prefixIcon: Icon(Icons.cake,
                      color: Colors.grey[800]), // Change icon color
                ),
                style: GoogleFonts.poppins(
                  color: Colors.black, // Change text color to black
                ),
              ),
              const SizedBox(height: 20),

              // Height
              _buildSectionTitle(
                  "Height (${_selectedHeightUnit.toUpperCase()})"),
              _buildSectionSubtitle("Adjust the slider to set your height."),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Slider(
                          value: _heightValue,
                          min: _selectedHeightUnit == 'ft' ? 4.0 : 120.0,
                          max: _selectedHeightUnit == 'ft' ? 13.0 : 220.0,
                          divisions: _selectedHeightUnit == 'ft' ? 9 : 100,
                          label:
                              '${_heightValue.toStringAsFixed(1)} ${_selectedHeightUnit == 'ft' ? 'ft' : 'cm'}',
                          onChanged: (value) {
                            setState(() {
                              _heightValue = value;
                            });
                          },
                          activeColor: Colors.teal,
                          inactiveColor: Colors.teal.withOpacity(0.3),
                        ),
                        Text(
                          '${_heightValue.toStringAsFixed(1)} ${_selectedHeightUnit == 'ft' ? 'ft' : 'cm'}',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black, // Change text color to black
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  DropdownButton<String>(
                    value: _selectedHeightUnit,
                    dropdownColor: Colors.grey[300], // Change dropdown color
                    items: const [
                      DropdownMenuItem(value: 'ft', child: Text('Feet')),
                      DropdownMenuItem(value: 'cm', child: Text('Centimeters')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedHeightUnit = value!;
                        // Adjust height value to the new unit
                        _heightValue = _selectedHeightUnit == 'ft'
                            ? _heightValue * 0.0328084
                            : _heightValue * 30.48;
                      });
                    },
                    style: GoogleFonts.poppins(
                      color: Colors.black, // Change text color to black
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Weight
              _buildSectionTitle(
                  "Weight (${_selectedWeightUnit.toUpperCase()})"),
              _buildSectionSubtitle("Adjust the slider to set your weight."),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Slider(
                          value: _weightValue,
                          min: _selectedWeightUnit == 'kg' ? 30.0 : 66.0,
                          max: _selectedWeightUnit == 'kg' ? 150.0 : 330.0,
                          divisions: _selectedWeightUnit == 'kg' ? 120 : 130,
                          label:
                              '${_weightValue.toStringAsFixed(1)} ${_selectedWeightUnit == 'kg' ? 'kg' : 'lb'}',
                          onChanged: (value) {
                            setState(() {
                              _weightValue = value;
                            });
                          },
                          activeColor: Colors.orange,
                          inactiveColor: Colors.orange.withOpacity(0.3),
                        ),
                        Text(
                          '${_weightValue.toStringAsFixed(1)} ${_selectedWeightUnit == 'kg' ? 'kg' : 'lb'}',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black, // Change text color to black
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  DropdownButton<String>(
                    value: _selectedWeightUnit,
                    dropdownColor: Colors.grey[300], // Change dropdown color
                    items: const [
                      DropdownMenuItem(value: 'kg', child: Text('Kilograms')),
                      DropdownMenuItem(value: 'lb', child: Text('Pounds')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedWeightUnit = value!;
                        // Adjust weight value to the new unit
                        _weightValue = _selectedWeightUnit == 'kg'
                            ? _weightValue * 0.453592
                            : _weightValue * 2.20462;
                      });
                    },
                    style: GoogleFonts.poppins(
                      color: Colors.black, // Change text color to black
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Calories Goal
              _buildSectionTitle("Daily Caloric Goal"),
              _buildSectionSubtitle(
                  "Set your daily calorie goal to track your progress."),
              const SizedBox(height: 10),
              TextField(
                controller: _caloriesGoalController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter your calorie goal",
                  border: const OutlineInputBorder(),
                  prefixIcon: Icon(Icons.local_fire_department,
                      color: Colors.grey[800]), // Change icon color
                ),
                style: GoogleFonts.poppins(
                  color: Colors.black, // Change text color to black
                ),
                onChanged: (value) {
                  setState(() {
                    _caloriesGoal = double.tryParse(value) ?? _caloriesGoal;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Gender
              _buildSectionTitle("Gender"),
              _buildSectionSubtitle(
                  "Select your gender for personalized recommendations."),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: Text('Male',
                          style: GoogleFonts.poppins(
                            color: Colors.black, // Change text color to black
                          )),
                      value: 'Male',
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: Text('Female',
                          style: GoogleFonts.poppins(
                            color: Colors.black, // Change text color to black
                          )),
                      value: 'Female',
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Submit Button
              Center(
                child: ElevatedButton(
                  onPressed: _handleSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(25, 33, 38, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                  ),
                  child: Text(
                    'Submit',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white, // Change text color to black
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Colors.black, // Change text color to black
      ),
    );
  }

  Widget _buildSectionSubtitle(String subtitle) {
    return Text(
      subtitle,
      style: GoogleFonts.poppins(
        fontSize: 14,
        color: Colors.grey[700], // Change subtitle color to a grey shade
      ),
    );
  }
}
