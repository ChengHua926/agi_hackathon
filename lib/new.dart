import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/spending.dart';
import 'package:speech_to_text/speech_to_text.dart';



class RecordingPage extends StatefulWidget {
  const RecordingPage({super.key});

  @override
  _RecordingPageState createState() => _RecordingPageState();
}

class _RecordingPageState extends State<RecordingPage> {
  final _formKey = GlobalKey<FormState>();
  String? _category; // Change this line to use a nullable String
  double _amount = 0.0;
  final List<String> _categories = ['餐饮', '购物', '出行', '社交', '其他'];

  void _submitData() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Provider.of<SpendingListProvider>(context, listen: false)
          .addSpending(_category!, _amount);
      Navigator.pop(
          context); // Uncomment this to pop the current route after recording data
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Record Spending')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButtonFormField<String>(
                      value: "餐饮",
                      decoration: const InputDecoration(labelText: 'Category'),
                      items: _categories
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _category = newValue!;
                        });
                      },
                      onSaved: (value) => _category = value!,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a category';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Amount'),
                      keyboardType: TextInputType.number,
                      onSaved: (value) =>
                          _amount = double.tryParse(value ?? '0.0') ?? 0.0,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an amount';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: _submitData,
                        child: const Text('Done'),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FloatingActionButton(
                    onPressed: () {
                      // TODO: Implement microphone functionality
                    },
                    child: const Icon(Icons.mic),
                    elevation: 4.0,
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
