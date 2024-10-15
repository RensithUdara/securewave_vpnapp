import 'package:flutter/material.dart';
import 'package:vpn_app/src/app_assets.dart';
import 'package:vpn_app/src/vpn/vpn_server_dropdown.dart';
import 'package:vpn_app/src/vpn/vpn_status_widget.dart';

class VpnPage extends StatefulWidget {
  @override
  _VpnPageState createState() => _VpnPageState();
}

class _VpnPageState extends State<VpnPage> {
  bool isConnected = false;
  String buttonText = 'Disconnect'; // Initial value
  String statusLabel = 'Connected'; // Initial status
  Color statusColor = Colors.green; // Initial color

  void onConnect() {
    setState(() {
      isConnected = !isConnected;
      buttonText = isConnected ? 'Connect Now' : 'Disconnect'; // Logic swap
      statusLabel = isConnected ? 'Disconnected' : 'Connected'; // Logic swap
      statusColor = isConnected ? Colors.grey : Colors.green; // Color swap
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock_outline, color: Colors.black), // VPN lock icon
              SizedBox(width: 10.0),
              Text(
                'SecureWave VPN',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 1.0,
          actions: [
            IconButton(
              icon: Icon(Icons.settings, color: Colors.black),
              onPressed: () {
                // Placeholder for settings button action
              },
            ),
          ],
        ),
        backgroundColor: Colors.blueGrey[50], // Soft background color
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Status Widget
                  Flexible(
                    child: VpnStatus(
                      label: statusLabel,
                      statusColor: statusColor,
                    ),
                  ),
                  SizedBox(height: 20.0),

                  // VPN Connection Image
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    child: Image.asset(
                      isConnected ? AppAssets.offline : AppAssets.online, // Image swap
                      key: ValueKey<bool>(isConnected),
                      height: 180,
                    ),
                  ),
                  SizedBox(height: 20.0),

                  // Connect/Disconnect Button
                  MaterialButton(
                    minWidth: 220.0, // Slightly wider button
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(
                        color: isConnected ? Colors.grey : Colors.green, // Swapped border color
                        width: 2.0,
                      ),
                    ),
                    color: isConnected ? Colors.white : Colors.green, // Button color swap
                    textColor: isConnected ? Colors.grey : Colors.white, // Text color swap
                    onPressed: onConnect,
                    child: Text(
                      buttonText.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Server Selection Dropdown
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: VpnServerDropDown(),
            ),
          ],
        ),
      ),
    );
  }
}
