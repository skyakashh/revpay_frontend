import 'package:flutter/material.dart';
import 'package:revpay/screens/withdraw.dart';
import 'package:revpay/screens/Account.dart';
import 'package:revpay/screens/Deposit.dart';
import 'package:revpay/screens/balance.dart';



class Payment extends StatefulWidget {
  static const id='Payemnt_screen';
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Revpay'),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(70, 50, 0, 0),
          child: Column(
            children: <Widget>[
              Hero(tag:'logo', child: Container(
                height: 250.0,
                child: Image.asset('image/rev.png'),
              ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 16),
                  child: Material(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () async{
                        //when button is pressed spinner is started
                        setState(() {
                          //showspinner=true;
                        });
                          Navigator.pushNamed(context, Account.id);
                        },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Make Account',
                      ),
                    ),
                  )
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 16),
                  child: Material(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () async{
                        //when button is pressed spinner is started
                        setState(() {
                          //showspinner=true;
                        });
                        Navigator.pushNamed(context, Balance.id);
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'check balance',
                      ),
                    ),
                  )
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 16),
                  child: Material(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () async{
                        //when button is pressed spinner is started
                        setState(() {
                          //showspinner=true;
                        });
                        Navigator.pushNamed(context, Withdraw.id);
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Withdraw',
                      ),
                    ),
                  )
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 16),
                  child: Material(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () async{
                        //when button is pressed spinner is started
                        setState(() {
                          //showspinner=true;
                        });
                        Navigator.pushNamed(context, Deposit.id);
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Deposit',
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
    );
  }
}
