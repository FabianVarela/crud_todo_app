import 'package:crud_todo_app/common/adaptive_contextual_layout.dart';
import 'package:crud_todo_app/common/extension.dart';
import 'package:flutter/material.dart';

class UnknownView extends StatelessWidget {
  const UnknownView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF4A78FA),
        title: const Text(
          'Not found',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
      body: SizedBox(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/image 404.png',
              fit: BoxFit.contain,
              height: size.height * .4,
              width: size.width * .4,
            ),
            Text(
              webSegments.contains(getDevice())
                  ? 'Oops!!! Page not found'
                  : 'Oops!!! Screen not found',
              style: const TextStyle(fontSize: 30),
            ).paddingOnly(t: 50),
          ],
        ),
      ),
    );
  }
}
