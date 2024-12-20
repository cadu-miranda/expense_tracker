import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/screens/add_expense.dart';
import 'package:expense_tracker/widgets/chart.dart';
import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:flutter/material.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesState();
}

class _ExpensesState extends State<ExpensesScreen> {
  final List<Expense> _registeredExpenses = [];

  @override
  void initState() {
    super.initState();
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final int expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 5),
      content: Text("Expense ${expense.title} deleted."),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () => {
                setState(() {
                  _registeredExpenses.insert(expenseIndex, expense);
                })
              }),
    ));
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext ctx) => AddExpenseScreen(addExpense: _addExpense),
      isScrollControlled: true,
      useSafeArea: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    Widget mainContent;

    if (_registeredExpenses.isEmpty) {
      mainContent = Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wallet,
            size: 128,
            color: Theme.of(context).colorScheme.primary,
          ),
          const Text(
            "No expenses found",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ],
      ));
    } else {
      mainContent = ExpensesList(
        registeredExpenses: _registeredExpenses,
        removeExpense: _removeExpense,
      );
    }

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
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(child: mainContent)
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _registeredExpenses)),
                Expanded(child: mainContent)
              ],
            ),
    );
  }
}
