import 'package:expense_tracker/models/expense.dart';

class ExpenseManager {
  final List<Expense> expenses;

  ExpenseManager(this.expenses);

  double get totalExpenses {
    return expenses.fold(0, (sum, expense) => sum + expense.amount);
  }
}
