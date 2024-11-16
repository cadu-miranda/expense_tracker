import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/screens/add_expense.dart';
import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:flutter/material.dart';

final today = DateTime.now();

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesState();
}

class _ExpensesState extends State<ExpensesScreen> {
  final List<Expense> _registeredExpenses = [
    // Expense(
    //   title: "Flutter Course",
    //   amount: 19.99,
    //   date: today,
    //   category: Category.work,
    // ),
    // Expense(
    //   title: "Cinema",
    //   amount: 15.69,
    //   date: today,
    //   category: Category.leisure,
    // ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext ctx) => const AddExpenseScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expenses",
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(child: ExpensesList(registeredExpenses: _registeredExpenses))
        ],
      ),
    );
  }
}
