import 'package:flutter/material.dart';
import 'package:wallet/components/history_element.dart';
import 'package:wallet/cubit/total_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet/style/text_style.dart';
import 'package:wallet/views/new_transaction.dart';
import 'package:lottie/lottie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TotalCubit? totalCubit = TotalCubit.get(context);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
          onPressed: () {
          print('total at beginning of float = ${totalCubit.total}');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NewTransaction()));
      }),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: BlocConsumer<TotalCubit, TotalState>(
              listener: (context, state) {},
              builder: (context, state) {
                totalCubit.getTotal();
                print('total from history page ${totalCubit.total}');
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset("assets/lottie/total.json"),
                    Text("${totalCubit.total}", style: AppTextStyle.title(),),
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('transaction').snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else return Container(
                            padding: EdgeInsets.only(top: 10 ),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(35, 35, 192, 184),
                              borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                            ),
                            height: 300,
                            child: ListView(
                              children: snapshot.data!.docs.map((DocumentSnapshot doc) {
                                Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
                                return HistoryElement(
                                  transactionName: data['transactionName'],
                                  transactionAmount: data['transactionAmount'],
                                );
                              }).toList(),
                            ),
                          );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
