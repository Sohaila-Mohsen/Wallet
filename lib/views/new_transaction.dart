import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet/cubit/total_cubit.dart';
import 'package:wallet/cubit/transaction_cubit.dart';
import 'package:lottie/lottie.dart';
import 'package:wallet/style/text_style.dart';
import 'history_page.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TransactionCubit transactionCubit = TransactionCubit.get(context);
    TotalCubit totalCubit = TotalCubit.get(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Center(
              child: Column(
            children: [
              Container( child: Lottie.asset("assets/lottie/buy.json")),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: "Title"),
                        onSaved: (newValue) {
                          transactionCubit.transactionName = newValue!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Transaction Name ';
                          }
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: "Amount"),
                        onSaved: (newValue) {
                          transactionCubit.transactionAmount =
                              double.parse(newValue!);
                          totalCubit.withdraw(double.parse( newValue));
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^(\d+)?\.?\d{0,2}'))
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Transaction Amount ';
                          }
                        },
                      ),
                      SizedBox(height: 40,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print("valid");
                              _formKey.currentState!.save();
                              transactionCubit.addTransaction();
                              print("done");
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> HistoryPage()), (route) => false);
                            }
                          },
                          child: Text('    ADD   '))
                    ],))],)),),),);
  }
}
