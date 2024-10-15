import 'package:flutter/material.dart';

class VpnStatus extends StatelessWidget {
  final String label;
  final Color statusColor;

  VpnStatus({
    Key? key,
    required this.label,
    required this.statusColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.0,
      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12.0,
            offset: Offset(0, 6.0),
          ),
        ],
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              letterSpacing: 1.1,
            ),
          ),
          Container(
            height: 12,
            width: 12,
            decoration: BoxDecoration(
              color: statusColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: statusColor.withOpacity(0.5),
                  blurRadius: 6.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
