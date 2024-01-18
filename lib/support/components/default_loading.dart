import 'package:flutter/material.dart';

class DefaultLoading extends StatelessWidget {
  const DefaultLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      right: 0,
      left: 0,
      bottom: 24,
      child: SizedBox(
        height: 48,
        width: 48,
        child: CircleAvatar(
          backgroundColor: Color.fromRGBO(224, 144, 144, 1),
          child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
