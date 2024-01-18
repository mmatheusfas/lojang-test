import 'package:flutter/material.dart';

class AuthorCard extends StatelessWidget {
  const AuthorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 27, 27, 27),
        borderRadius: BorderRadius.circular(24),
      ),
      height: 80,
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/green_background.png'),
          ),
          SizedBox(width: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Author Name',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 12),
              Expanded(
                child: Text(
                  'Author Description jsjsjkaskjsajksa ksajsakjdaskjdkasj kdjaskdjakjsd',
                  maxLines: 3,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
