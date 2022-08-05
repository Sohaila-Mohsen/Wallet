import 'package:flutter/material.dart';

class HistoryElement extends StatelessWidget {
  String? transactionName;
  double? transactionAmount;
  HistoryElement({required this.transactionAmount,required this.transactionName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white))),
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: CircleAvatar(
              radius: 20.0,
              child: Text(transactionName!.substring(0,1)),
              foregroundColor: Colors.white,
              backgroundColor:  Colors.purple.withOpacity(0.5),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(

              padding: const EdgeInsets.only(left: 10),
              width: 200,
              child: Text(
                    transactionName!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 40, 35, 29),
                        fontWeight: FontWeight.w700),
                  ),
            ),
          ),
          Expanded(child: Text('${transactionAmount}'))
        ],
      ),
    );
  }
}
