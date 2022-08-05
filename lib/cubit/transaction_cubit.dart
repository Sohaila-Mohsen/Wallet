import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());
  static TransactionCubit get(context) => BlocProvider.of(context);
  double? transactionAmount;
  String? transactionName;

  CollectionReference transaction =
      FirebaseFirestore.instance.collection('transaction');
  Future<void> addTransaction() {
    print('start adding');
    return transaction
        .add({
          'transactionName': transactionName, // John Doe
          'transactionAmount': transactionAmount, // Stokes and Sons
        })
        .then((value) => print("Transaction Added"))
        .catchError((error) => print("Failed to add transaction: $error"));
  }
}
