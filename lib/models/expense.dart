import 'package:uuid/uuid.dart';

//getting third party method for unique id
const uuid = Uuid();

//Enum for category
enum Category {
  food,
  rent,
  other,
}

class Expense {
  //Attributes
  String id;
  final String title;
  final String amount;
  final DateTime date;
  final Category category;

  //Constructor
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); //getting v4 level of unique id

  // Alternative
  // Expense(this.id,this.title,this.amount,this.date){
  //   id = uuid.v4();
  // }
}
