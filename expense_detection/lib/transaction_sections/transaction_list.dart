import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'transaction.dart';
import 'package:expense_detection/Kconstants.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList({@required this.transactions,@required this.deleteTx});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      child: transactions.isEmpty
          ? Column(
            children: [
              Text('No Transactions yet...',style:KIntStyle,),
              SizedBox(
                height: 25.0,
              ),
              Image(
                  height: MediaQuery.of(context).size.width/2,
                image:AssetImage('images/notrx.png'),
                ),
            ],
          )
          : Container(
            height: MediaQuery.of(context).size.width*2,
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
                    elevation: 5.0,
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 1.0,vertical: 0.5),
                      leading: CircleAvatar(
                        radius: 50,
                        backgroundColor: KCustomGreen,
                        foregroundColor: KCustomBlack,
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Container(
                            height: 20,
                            child: FittedBox(
                                child: Text(
                              '₹${transactions[index].amount.toStringAsFixed(1)}',
                              style: KIntStyle.copyWith(color: KCustomBlack),
                            )),
                          ),
                        ),
                      ),
                      title:Text(
                        '${transactions[index].title}',
                        style: KTextStyle,
                      ),
                      subtitle: Text(
                        DateFormat.yMd()
                            .add_jm()
                            .format(transactions[index].date),
                        style: KIntStyle,
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete,size: 30.0,color: Colors.grey,),
                        onPressed: () {
                          deleteTx(transactions[index].id);
                          },
                      ),
                    ),
                  );
                },
                itemCount: transactions.length,
              ),
          ),
    );
  }
}

