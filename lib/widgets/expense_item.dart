import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(
    this.registeredExpense, {
    super.key,
  });

  final Expense registeredExpense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                registeredExpense.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    '\$${registeredExpense.amount.toStringAsFixed(2)}',
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(categoryIcons[registeredExpense.category]),
                      const SizedBox(width: 8),
                      Text(registeredExpense.formattedDate)
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
