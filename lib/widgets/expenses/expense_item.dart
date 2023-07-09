import 'package:expense_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({
    super.key,
    required this.expense,
  });

  final Expense expense;

  @override
  Widget build(context) {
    //Alternative you can use simple ListView or Column
    //(but for huge list it will not be a good practice and also decrease performance)

    //ListView builder will use for dynamically get the list and help to increase the performance
    return Card(
      margin: const EdgeInsets.all(10),
      color: const Color.fromARGB(255, 235, 235, 235),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              expense.title,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              //Alternative of Spacer()
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${expense.amount.toStringAsFixed(2)}',
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(expense.formattedDate.toString()),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
