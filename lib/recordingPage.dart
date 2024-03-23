import 'dart:async';
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
  String? _category;
  double _amount = 0.0;
  List<String> _categories = ['餐饮', '购物', '出行', '社交', '其他'];
  final TextEditingController _amountController = TextEditingController();
  bool _isExpense = true; // Track if it's an expense or income page
  bool _isListening = false;
  IconData _micIcon = Icons.mic;
  bool _isLoading = false;
  Color _themeColor = Colors.deepOrange; // Default color for expenses

  @override
  void initState() {
    super.initState();
    _category = _categories.first;
    _amountController.text = _amount.toString();
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _toggleListening() {
    if (!_isListening) {
      setState(() {
        _isListening = true;
        _micIcon = Icons.mic_off;
      });
    } else {
      setState(() => _isLoading = true);
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _isListening = false;
          _micIcon = Icons.mic;
          _category = _isExpense ? '购物' : "理财";
          _amount = _isExpense ? 243.0 : 500;
          _amountController.text = _amount.toString();
          _isLoading = false;
        });
      });
    }
  }

  void _submitData() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Provider.of<SpendingListProvider>(context, listen: false)
          .addSpending(_category!, _amount);
      Navigator.pop(context);
    }
  }

  void _togglePage() {
    setState(() {
      _isExpense = !_isExpense;
      _category = null;
      _amount = 0.0;
      _amountController.text = _amount.toString();
      _categories = _isExpense
          ? ['餐饮', '购物', '出行', '社交', '其他']
          : ['工资', '理财', '礼金', '其他'];
      _themeColor = _isExpense ? Colors.deepOrange : Colors.teal[800]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isExpense ? '记录支出' : '记录收入'),
        actions: [
          IconButton(
            icon: Icon(_isExpense ? Icons.inbox : Icons.outbox),
            onPressed: _togglePage,
          ),
        ],
        backgroundColor: _themeColor,
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _isExpense ? "支出" : "收入",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: _themeColor,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DropdownButtonFormField<String>(
                                  value: _category,
                                  decoration: InputDecoration(
                                    labelText: '类别',
                                    labelStyle: TextStyle(
                                      color: _themeColor,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  items: _categories.map<DropdownMenuItem<String>>((String value) {
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
                                      return '请选择一个类别';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 16.0),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: '金额',
                                    labelStyle: TextStyle(
                                      color: _themeColor,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  controller: _amountController,
                                  keyboardType: TextInputType.number,
                                  onSaved: (value) => _amount = double.tryParse(value ?? '0.0') ?? 0.0,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '请输入金额';
                                    }
                                    if (double.tryParse(value) == null) {
                                      return '请输入有效的数字';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 16.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: _submitData,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: _themeColor,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 32.0,
                                          vertical: 16.0,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      child: const Text(
                                        '完成',
                                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: _toggleListening,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: _themeColor,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 32.0,
                                          vertical: 16.0,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(_micIcon, color: Colors.white),
                                          const SizedBox(width: 8.0),
                                          Text(
                                            _isListening ? '停止录音' : '开始录音',
                                            style: const TextStyle(fontSize: 16.0, color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          _isLoading ? _loadingOverlay() : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _loadingOverlay() {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(_themeColor),
        ),
      ),
    );
  }
}