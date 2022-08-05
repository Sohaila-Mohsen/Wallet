
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet/cubit/total_cubit.dart';
import 'package:wallet/sp_helper/cache_helper.dart';
import 'package:wallet/style/text_style.dart';

import 'history_page.dart';

class GetStart extends StatelessWidget {
  GetStart({Key? key}) : super(key: key);
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TotalCubit totalCubit = TotalCubit.get(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 70 , left: 20 , right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcom to Your Wallet' , style: AppTextStyle.Heading1(),),
              Text('Add Total Saving', style: AppTextStyle.Heading2(),),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Lottie.asset("assets/lottie/total.json"),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Total"),
                      onSaved: (newValue) {
                        totalCubit.setTotal(double.parse(newValue!));
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^(\d+)?\.?\d{0,2}'))
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This Field is Required ';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            SharedPreferencesHelper.saveData(key: "isFirst", value: false);
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> HistoryPage()), (route) => false);

                          }
                        },
                        child: Text('   Start   ')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
