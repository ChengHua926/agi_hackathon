import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/spending.dart';

class RecordingPage extends StatefulWidget {
  const RecordingPage({super.key});

  @override
  _RecordingPageState createState() => _RecordingPageState();
}

class _RecordingPageState extends State<RecordingPage> {
  final _formKey = GlobalKey<FormState>();
  String? _category =
      '餐饮'; // Default value to match your dropdown's initial value
  double _amount = 0.0;
  final List<String> _categories = ['餐饮', '购物', '出行', '社交', '其他'];
  final TextEditingController _amountController = TextEditingController();

  // State management for FAB icon and speech listening status
  bool _isListening = false;
  IconData _fabIcon = Icons.mic;

  @override
  void initState() {
    super.initState();
    // Initialize the TextEditingController with the default amount
    _amountController.text = _amount.toString();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is removed from the widget tree
    _amountController.dispose();
    super.dispose();
  }

  void _toggleListening() {
    setState(() {
      _isListening = !_isListening;
      _fabIcon = _isListening ? Icons.mic_off : Icons.mic;

      // Update the form fields when toggling
      if (!_isListening) {
        _category = '购物';
        _amount = 243.0;
        _amountController.text = _amount.toString();
      }
      // Optional: add logic here if you want to reset or change the values when the button is toggled off
    });
  }

  void _submitData() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Provider.of<SpendingListProvider>(context, listen: false)
          .addSpending(_category!, _amount);
      Navigator.pop(context); // Pop the current route after recording data
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
                      value: _category,
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
                          _category = newValue;
                        });
                      },
                      onSaved: (value) => _category = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a category';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Amount'),
                      controller: _amountController, // Use the controller here

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
                    onPressed: _toggleListening,
                    child: Icon(_fabIcon),
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