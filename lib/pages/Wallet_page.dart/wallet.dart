
import 'package:flutter/material.dart';
import 'package:plantapp/Widgets/Custom_Widgets/Custom_Appbar/custom_appbar.dart';
import 'package:plantapp/Widgets/Wallet_Items/wallet_items.dart';


class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: Custom_Appbar(),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: wallet_items(),
        ),
      ),
    );
  }
}

