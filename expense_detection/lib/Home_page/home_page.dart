import 'package:flutter/material.dart';

import '../transaction_sections/transaction.dart';
import '../transaction_sections/transaction_list.dart';
import '../Kconstants.dart';
import '../chart_sections/chart.dart';
import '../transaction_sections/new_transactions.dart';

class HomePage extends StatefulWidget {
  static String id = 'Home_page';
   @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [];

  void _addNewTransactions(String txTitle, double txAmount, DateTime selectedDate) {
    Transaction newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: selectedDate,
    );

    setState(() {
      addNewTrx(newTx);
    });
  }

  void _addTransactionBar(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        enableDrag: true,
        context: context,
        builder: (_) {
          return SingleChildScrollView(
            child: GestureDetector(
              onTap: () {},
              child: NewTransaction(addTransaction: _addNewTransactions),
              behavior: HitTestBehavior.opaque,
            ),
          );
        });
  }

  List<Transaction> get _currentWeekTransaction {
    return _transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  void addNewTrx(Transaction newTx) {
    _transactions.add(newTx);
  }

  void _deleteTransactions(String id) {
    setState(() {
      _transactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KCustomGreen,
        title: Text(
          'Expenditure Detector',
          style: KAppBarStyle,
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:AssetImage('images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            height: MediaQuery.of(context).size.width*2,
            child: ListView(
              children: <Widget>[
                Chart(
                  recentTransactions: _currentWeekTransaction,
                ),
                TransactionList(
                  transactions: _transactions,
                  deleteTx: _deleteTransactions,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 35,
          color:KCustomBlack,
        ),
        backgroundColor: KCustomGreen,
        onPressed: () => _addTransactionBar(context),
      ),
    );
  }
}
