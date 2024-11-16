import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpenseScreen> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _amountController = TextEditingController();

  DateTime? _selectedDate;

  @override
  void dispose() {
    super.dispose();

    _titleController.dispose();

    _amountController.dispose();
  }

  void _showDatePicker() async {
    final DateTime now = DateTime.now();

    final DateTime firstDate = DateTime(now.year - 1, now.month, now.day);

    final DateTime? selectedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
    );

    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(label: Text("Title")),
              maxLength: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    decoration: const InputDecoration(
                        prefixText: "\$ ", label: Text("Amount")),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(_selectedDate == null
                          ? "No date selected"
                          : formatter.format(_selectedDate!)),
                      IconButton(
                          onPressed: _showDatePicker,
                          icon: const Icon(Icons.calendar_month))
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel")),
                const SizedBox(width: 8),
                ElevatedButton(
                    onPressed: () {
                      debugPrint(_titleController.text);
                      debugPrint(_amountController.text);
                    },
                    child: const Text("Save"))
              ],
            )
          ],
        ));
  }
}
