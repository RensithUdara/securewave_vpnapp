import 'package:flutter/material.dart';
import 'package:vpn_app/src/constants.dart';
import 'package:vpn_app/src/vpn/vpn_bottom_sheet.dart';

class VpnServerDropDown extends StatefulWidget {
  @override
  _VpnServerDropDownState createState() => _VpnServerDropDownState();
}

class _VpnServerDropDownState extends State<VpnServerDropDown> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> servers = Constants.servers;

  onServerTap(index) {
    setState(() {
      selectedIndex = index;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 6.0,
            spreadRadius: 1.0,
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 4),
          )
        ],
        borderRadius: BorderRadius.circular(15.0), // Added border radius for rounded corners
      ),
      padding: EdgeInsets.all(16.0), // Increased padding for more space
      alignment: Alignment.center,
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0), // Match container border radius
        onTap: () {
          showBottomSheet(
            backgroundColor: Colors.white,
            context: context,
            builder: (context) {
              return VpnBottomSheet(
                servers: servers,
                selectedIndex: selectedIndex,
                onServerTap: onServerTap,
              );
            },
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0), // Added internal padding for button
          decoration: BoxDecoration(
            color: const Color.fromARGB(
                255, 0, 94, 255), // Changed background color for a more prominent button
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6.0,
                offset: Offset(0, 4),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 14.0, // Increased size for a larger flag/avatar
                backgroundImage: AssetImage(
                  servers[selectedIndex]['icon'],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  servers[selectedIndex]['name'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // Made text bold for emphasis
                    fontSize: 18.0,
                    color: Colors.white, // White text to match the new button color
                  ),
                ),
              ),
              Icon(Icons.keyboard_arrow_down, color: Colors.white), // Changed icon color to white
            ],
          ),
        ),
      ),
    );
  }
}
