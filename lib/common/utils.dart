import 'package:flutter/material.dart';

const defaultScrollPhysics = BouncingScrollPhysics();

extension CurrencyFormat on String {
  String toCurrency() {
    double amount = double.parse(this);
    return "\$ ${amount.toStringAsFixed(2)}";
  }
}
