import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//third party library for formatting date
final dateFormatter = DateFormat.yMd();

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});
  @override
  State<StatefulWidget> createState() {
    return _AddExpenseState();
  }
}

class _AddExpenseState extends State<AddExpense> {
  final titleInput = TextEditingController();
  final amountInput = TextEditingController();
  //? telling that value can be null
  DateTime? selectedDate;

  void presetDatePicker() async {
    final now = DateTime.now();
    //setting firstDate one year back,
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    //Showing built-in date picker widget
    //await is used to get future values
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    ); //it does not go to next line until await is over

    setState(() {
      selectedDate = pickedDate;
    });
  }

  //always dispose the controller inputs
  //as it don't automatically destroy and remain through out the app life cycle
  @override
  void dispose() {
    titleInput.dispose();
    amountInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          TextField(
            controller: titleInput,
            maxLength: 50,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountInput,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      selectedDate == null
                          ? 'Select Date'
                          //! in the end used to forcefully saying that this variable will not be null
                          : dateFormatter.format(selectedDate!),
                    ),
                    IconButton(
                      // alignment: Alignment.topRight,
                      onPressed: () {
                        presetDatePicker();
                      },
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {
                  //to pop the current overlay widget
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.redAccent,
                ),
                child: const Text(
                  'Cancel',
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  print(titleInput.text);
                  print(amountInput.text);
                },
                child: const Text('Add'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
