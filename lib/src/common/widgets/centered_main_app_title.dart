import 'package:flutter/material.dart';

class CenteredMainAppTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Center(
        child: Text(
          "Holder Arch",
        ),
      ),
    );
  }
}
