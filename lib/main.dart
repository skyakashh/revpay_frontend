import 'package:flutter/material.dart';
import 'package:revpay/screens/Account.dart';
import 'package:revpay/screens/login.dart';
import 'package:revpay/screens/register.dart';
import 'package:revpay/screens/welcome.dart';
import 'package:revpay/screens/payment.dart';
import 'package:revpay/screens/withdraw.dart';
import 'package:revpay/screens/Account.dart';
import 'package:revpay/screens/Deposit.dart';
import 'package:revpay/screens/balance.dart';


void main() {
  runApp(revpay());
}

class revpay extends StatelessWidget {
  const revpay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Welcome.id,
      routes: {
        Register.id : (context) =>  Register(),
        Login.id : (context)=>  Login(),
        Welcome.id: (context)=>  Welcome(),
        Payment.id : (context)=>  Payment(),
        Account.id : (context)=>  Account(),
        Balance.id : (context)=>  Balance(),
        Withdraw.id : (context)=>  Withdraw(),
        Deposit.id : (context)=>  Deposit(),
      },
    );
  }
}
