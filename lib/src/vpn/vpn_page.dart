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
  String buttonText = 'Connect Now';
  String statusLabel = 'Disconnected';
  Color statusColor = Colors.grey;

  void onConnect() {
    setState(() {
      isConnected = !isConnected;
      buttonText = isConnected ? 'Disconnect' : 'Connect Now';
      statusLabel = isConnected ? 'Connected' : 'Disconnected';
      statusColor = isConnected ? Colors.green : Colors.grey;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'VPN',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 1.0,
        ),
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
                      isConnected ? AppAssets.online : AppAssets.offline,
                      key: ValueKey<bool>(isConnected),
                      height: 180,
                    ),
                  ),
                  SizedBox(height: 20.0),

                  // Connect/Disconnect Button
                  MaterialButton(
                    minWidth: 200.0,
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(
                        color: isConnected ? Colors.green : Colors.transparent,
                        width: 2.0,
                      ),
                    ),
                    color: isConnected ? Colors.white : Theme.of(context).primaryColor,
                    textColor: isConnected ? Colors.green : Colors.white,
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
