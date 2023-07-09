import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

//getting third party method for unique id
const uuid = Uuid();

final dateFormatter = DateFormat.yMd();

//Enum for category
enum Category {
  food,
  rent,
  work,
  other,
}

//creating map for Category items to icons
const categoryIcons = {
  Category.food: Icons.food_bank,
  Category.rent: Icons.house,
  Category.work: Icons.work,
  Category.other: Icons.other_houses,
};

class Expense {
  //Attributes
  String id;
  final String title;
  final double amount;
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

  String get formattedDate {
    return dateFormatter.format(date);
  }
}
