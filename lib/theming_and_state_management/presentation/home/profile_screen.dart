import 'package:flutter/material.dart';
import 'package:tutorial/theming_and_state_management/presentation/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [Expanded(
          child: Column(
            children: [Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: DeliveryColors.green,
              ),
              child: Padding(padding: const EdgeInsets.all(4.0),
              child: CircleAvatar(
                radius: 50,
               ),
             ),
           ),
           const SizedBox(height: 10),
           Text('User')
         ]
        )
       ),
       Expanded(child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Personal info',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,)
              ],
            ),
          )
        ],        
       ))
      ],
     ),
    );

  }
}