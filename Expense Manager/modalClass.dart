import "package:flutter/material.dart";


class TransactionModalClass {
  final String title;
   String? category;
  final String desccription;
  final String amount;

   TransactionModalClass({
    required this.title,  this.category ,required this.amount ,required this.desccription
  });
}