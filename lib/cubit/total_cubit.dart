import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'total_state.dart';

class TotalCubit extends Cubit<TotalState> {
  static TotalCubit get(context) => BlocProvider.of(context);
  TotalCubit() : super(TotalInitial());

  double? total;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference totalCollec =
      FirebaseFirestore.instance.collection('total');

  void setTotal(double t) {
    total = t;
    totalCollec
        .add({'total': total})
        .then((value) => print("Total set"))
        .catchError((error) => print("Error in setting total : ${error}"));
    emit(TotalDecrementedState());
    emit(TotalSetState());
  }

  Future<double?> getTotal() async {
    dynamic id = await getID('total');
    print("id $id  ${id.toString()}");
    var document = await totalCollec.doc(id.toString()).get();
    if (document.exists) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      print("value ${data['total']}");
      total = data['total'];
    }
    return total;
  }

  Future<dynamic> getID(String collec) async {
    dynamic snapshot;
    await firestore.collection(collec).get().then((querySnapshot) {
      print('id == ${querySnapshot.docs[querySnapshot.size-1].id}');
      snapshot = (querySnapshot.size>2)? querySnapshot.docs[querySnapshot.size-2].id:querySnapshot.docs[querySnapshot.size-1];
    }).catchError((error) => print("Error in getting size total : ${error}"));
    print("snapshot $snapshot");
    return snapshot;
  }

  void withdraw(double amount) {
    getTotal();
    print('total before withdraw = $total');
    if (total != null) {
      total = total! - amount;
      totalCollec
          .add({'total': total})
          .then((value) => print("Total updated"))
          .catchError((error) => print("Error in updting total : ${error}"));
      getTotal();
      print('total after withdraw = $total');
      emit(TotalDecrementedState());
    }
  }
}
