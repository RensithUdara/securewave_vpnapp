import 'package:vpn_app/src/app_assets.dart';

class Constants {
  static final List<Map<String, dynamic>> slides = [
    {
      "title": "Security that lasts.",
      "description":
          "Experience ultimate protection with our cutting-edge encryption technology. Your data stays safe, always.",
      "img": AppAssets.welcome,
    },
    {
      "title": "Encryption you can trust.",
      "description":
          "We ensure your connections are always secure, encrypted, and protected from unauthorized access.",
      "img": AppAssets.encrypted
    },
    {
      "title": "Privacy redefined.",
      "description":
          "Your online activity remains completely private. We safeguard your privacy with state-of-the-art solutions.",
      "img": AppAssets.privacy
    }
  ];

  static final List<Map<String, dynamic>> servers = [
    {"name": "Automatic", "icon": AppAssets.automatic},
    {"name": "New York, USA", "icon": AppAssets.us},
    {"name": "London, UK", "icon": AppAssets.uk},
    {"name": "Moscow, Russia", "icon": AppAssets.russia},
    {"name": "Stockholm, Sweden", "icon": AppAssets.sweden},
    {"name": "Melbourne, Australia", "icon": AppAssets.australia},
    {"name": "New Delhi, India", "icon": AppAssets.india},
    {"name": "Singapore", "icon": AppAssets.singapore}
  ];
}
