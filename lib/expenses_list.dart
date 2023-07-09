import 'package:expense_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
  });

  final List<Expense> expenses;

  @override
  Widget build(context) {
    //Alternative you can use simple ListView or Column
    //(but for huge list it will not be a good practice and also decrease performance)

    //ListView builder will use for dynamically get the list and help to increase the performance
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Text(expenses[index].title),
    );
  }
}
