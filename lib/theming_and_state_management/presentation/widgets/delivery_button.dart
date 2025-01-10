import 'package:flutter/material.dart';
import 'package:tutorial/theming_and_state_management/presentation/theme.dart';

class DeliveryButton extends StatelessWidget {
  

  final VoidCallback onTap;
  final String text;

  const DeliveryButton({required Key key, required this.onTap, required this.text}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return InkWell(
                onTap: onTap, 
                
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: deliveryGradients),
                  ),
                  child: Center(
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: DeliveryColors.white),
                    ),
                  ),
                  height: 40,
                ),
              );
  }
}