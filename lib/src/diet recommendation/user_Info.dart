import 'package:flutter/material.dart';

import 'algo.dart';

class UserInfoFormScreen extends StatefulWidget {
  @override
  _UserInfoFormScreenState createState() => _UserInfoFormScreenState();
}

class _UserInfoFormScreenState extends State<UserInfoFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String name = '';
  int weight = 0;
  double height = 0.0;
  int age = 0;
  String gender = 'Male';
  String physicalActivity = 'Sedentary(little or no exercise)';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    name = value!;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Weight'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Weight is required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    weight = int.parse(value!);
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Height'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Height is required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    height = double.parse(value!);
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Age is required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    age = int.parse(value!);
                  },
                ),
                const SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Gender'),
                  value: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'Male',
                      child: Text('Male'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Female',
                      child: Text('Female'),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Physical Activity'),
                  value: physicalActivity,
                  onChanged: (value) {
                    setState(() {
                      physicalActivity = value!;
                    });
                  },
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'Sedentary(little or no exercise)',
                      child: Text('Sedentary (little or no exercise)'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Light Active(1-3 days/week)',
                      child: Text('Light Active (1-3 days/week)'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Moderately Active(3-5 days/week)',
                      child: Text('Moderately Active (3-5 days/week)'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Very Active(6-7 days/week)',
                      child: Text('Very Active (6-7 days/week)'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Super Active(twice/day)',
                      child: Text('Super Active (twice/day)'),
                    ),
                  ],
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  WeightLossScreen()),
                      );
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
