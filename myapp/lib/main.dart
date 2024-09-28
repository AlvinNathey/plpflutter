import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/register.dart';
import 'pages/pay_bills.dart';
import 'pages/send_money.dart';
import 'pages/dashboard.dart';
import 'pages/buy_airtime.dart';
import 'pages/withdraw.dart';
import 'pages/bank_transfer.dart';
import 'pages/deposit.dart';
import 'pages/savings_page.dart'; // Import for SavingsPage
import 'pages/loan_page.dart';     // Import for LoanPage
import 'pages/account_page.dart';   // Import for AccountPage

void main() {
  runApp(const PocketBankingApp());
}

class PocketBankingApp extends StatelessWidget {
  const PocketBankingApp({super.key}); // Use key parameter for better widget management

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pocket Banking',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity, // Improve the visual density on different platforms
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/dashboard': (context) => const DashboardPage(),
        '/register': (context) =>  const RegisterPage(),
        '/paybills': (context) =>  PayBillsPage(),
        '/sendmoney': (context) => SendMoneyPage(),
        '/buyairtime': (context) => BuyAirtimePage(),
        '/withdraw': (context) =>  WithdrawPage(),
        '/banktransfer': (context) => BankTransferPage(),
        '/deposit': (context) =>  DepositPage(),
        '/savings': (context) => const SavingsPage(), // Route for SavingsPage
        '/loans': (context) =>  LoanPage(),       // Route for LoanPage
        '/account': (context) => const AccountPage(),   // Route for AccountPage
      },
    );
  }
}
