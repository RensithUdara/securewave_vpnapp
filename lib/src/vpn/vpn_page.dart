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
  String buttonText = 'Connect Now'; // Initial value (swapped logic)
  String statusLabel = 'Disconnected'; // Initial status
  Color statusColor = Colors.grey; // Initial color for disconnected state

  void onConnect() {
    setState(() {
      isConnected = !isConnected;
      buttonText = isConnected ? 'Disconnect' : 'Connect Now'; // Logic swap
      statusLabel = isConnected ? 'Connected' : 'Disconnected'; // Logic swap
      statusColor = isConnected ? Colors.green : Colors.grey; // Color swap
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0), // Taller AppBar
          child: AppBar(
            backgroundColor: Color.fromARGB(255, 0, 94, 255), // Vibrant blue color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(26.0), // Rounded bottom edge for the AppBar
              ),
            ),
            title: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lock_outline, color: Colors.white), // VPN lock icon
                      SizedBox(width: 10.0),
                      Text(
                        'SecureWave VPN',
                        style: TextStyle(
                          color: Colors.white, // White text for contrast
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0, // Large, bold font
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.0),
                Text(
                  "Fast & Secure Connection",
                  style: TextStyle(
                    color: Colors.white70, // Subtle secondary text
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
            centerTitle: true,
          ),
        ),
        backgroundColor: Colors.grey[100], // Light background for modern design
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
