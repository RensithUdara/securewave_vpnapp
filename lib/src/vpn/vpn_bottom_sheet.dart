import 'package:flutter/material.dart';

class VpnBottomSheet extends StatelessWidget {
  final List servers;
  final int selectedIndex;
  final Function onServerTap;

  const VpnBottomSheet({
    Key? key,
    required this.servers,
    required this.selectedIndex,
    required this.onServerTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100], // Changed to a light grey for a modern look
        boxShadow: [
          BoxShadow(
            blurRadius: 8.0,
            spreadRadius: 2.0,
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(0, 6),
          )
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35.0), // Larger radius for softer look
          topRight: Radius.circular(35.0),
        ),
      ),
      padding: const EdgeInsets.all(24.0), // Increased padding for breathing space
      height: MediaQuery.of(context).size.height * 0.55, // Slightly taller height
      child: Column(
        children: <Widget>[
          // Header Section
          Container(
            margin: const EdgeInsets.only(bottom: 16.0), // Reduced margin for compactness
            child: Text(
              'Choose a Server',
              style: TextStyle(
                fontSize: 22.0, // Increased font size for header
                fontWeight: FontWeight.w700, // Heavier font for prominence
                letterSpacing: 1.5,
                color: Colors.blueGrey[800], // Darker color for elegance
              ),
            ),
          ),
          // Server List
          Expanded(
            child: ListView.builder(
              itemCount: servers.length,
              itemBuilder: (BuildContext context, int index) => Card(
                elevation: 6, // Increased elevation for depth
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Larger border radius for rounded corners
                ),
                margin: const EdgeInsets.symmetric(vertical: 10.0), // Increased vertical spacing
                child: ListTile(
                  onTap: () => onServerTap(index),
                  dense: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // Consistent rounded corners
                  ),
                  title: Text(
                    servers[index]['name'],
                    style: TextStyle(
                      fontSize: 18.0, // Slightly larger font size for server names
                      fontWeight: FontWeight.w600,
                      color: selectedIndex == index
                          ? Colors.blueAccent // Changed selected color for emphasis
                          : Colors.black87, // Darker text color for unselected
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: 24.0, // Increased size of the avatar
                    backgroundImage: AssetImage(servers[index]['icon']),
                  ),
                  trailing: Icon(
                    selectedIndex == index
                        ? Icons.check_circle_rounded // Changed icon to rounded checkmark
                        : Icons.radio_button_unchecked,
                    color: selectedIndex == index
                        ? Colors.blueAccent // Changed trailing icon color
                        : Colors.grey,
                    size: 26.0, // Slightly increased icon size
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
