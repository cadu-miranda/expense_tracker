import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.registeredExpenses,
    required this.removeExpense,
  });

  final List<Expense> registeredExpenses;

  final void Function(Expense expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: registeredExpenses.length,
      itemBuilder: (BuildContext context, int index) => Dismissible(
        key: ValueKey(registeredExpenses[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (DismissDirection? direction) {
          removeExpense(registeredExpenses[index]);
        },
        child: ExpenseItem(registeredExpenses[index]),
      ),
    );
  }
}
