import 'package:expense_app/widgets/expenses/expenses_list.dart';
import 'package:expense_app/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  //Creating expense class list and populating dummy data
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Title 1',
      amount: 20.4,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Title 2',
      amount: 22.4,
      date: DateTime.now(),
      category: Category.other,
    ),
  ];

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expense Tracker App'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: Column(
          children: [
            const Text('Chart'),
            //As ListView doesn't show anything in existing list of Column []
            //As it doesnt know the size of inner list
            //That's why use Expanded
            Expanded(
              child: ExpensesList(
                expenses: _registeredExpenses,
              ),
            ),
          ],
        ));
  }
}
