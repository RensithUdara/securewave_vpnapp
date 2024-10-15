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
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 6.0,
            spreadRadius: 1.0,
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 4),
          )
        ],
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
      ),
      padding: const EdgeInsets.all(20.0),
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: <Widget>[
          // Header Section
          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              'Select a Server',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          // Server List
          Expanded(
            child: ListView.builder(
              itemCount: servers.length,
              itemBuilder: (BuildContext context, int index) => Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  onTap: () => onServerTap(index),
                  dense: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  title: Text(
                    servers[index]['name'],
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: selectedIndex == index
                          ? Theme.of(context).primaryColor
                          : Colors.black,
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: 20.0,
                    backgroundImage: AssetImage(servers[index]['icon']),
                  ),
                  trailing: Icon(
                    selectedIndex == index
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    color: selectedIndex == index
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
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
