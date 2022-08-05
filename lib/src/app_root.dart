import 'package:flutter/material.dart';
import 'package:wallet/cubit/total_cubit.dart';
import 'package:wallet/cubit/transaction_cubit.dart';
import 'package:wallet/views/history_page.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet/views/new_transaction.dart';
import 'package:wallet/views/splash_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TotalCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
      ],
      child: MaterialApp(
        home: SplachScreen(),
      ),
    );
  }
}
