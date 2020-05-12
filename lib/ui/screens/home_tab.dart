import 'package:covid_sa/ui/widgets/info_card.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeTab extends StatelessWidget {
  _launchWhatsApp() async {
    String phoneNumber = '+27 60 012 3456';
    String message = 'Hi 👋';
    var whatsappUrl = "whatsapp://send?phone=$phoneNumber&text=$message";
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      print('Could not launch $whatsappUrl');
    }
  }

  _launchDialer() async {
    const url = "tel:+27 800 029 999";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Stay Home.",
                      style: GoogleFonts.dmSans()
                          .copyWith(color: Colors.purple, fontSize: 28),
                    ),
                    Text(
                      "Stay Safe.",
                      style: GoogleFonts.dmSans()
                          .copyWith(color: Colors.purple, fontSize: 26),
                    ),
                  ],
                ),
                SizedBox(
                  width: 100,
                  height: 150,
                  child: SvgPicture.asset(
                    "assets/images/house.svg",
                    semanticsLabel: "stay home.",
                  ),
                ),
              ],
            ),
          ),
          InfoCard(
            title: "Need Help?",
            content: Column(
              children: <Widget>[
                Wrap(
                  children: <Widget>[
                    FlatButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      onPressed: _launchWhatsApp,
                      icon: Icon(
                        FontAwesomeIcons.whatsapp,
                        color: Colors.white,
                      ),
                      label: Text(
                        "DoH WhatsApp",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 5),
                    FlatButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      onPressed: _launchDialer,
                      icon: Icon(
                        FontAwesomeIcons.phone,
                        color: Colors.white,
                        size: 18,
                      ),
                      label: Text(
                        "Call Covid-19 Hotline",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    FlatButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      onPressed: _launchWhatsApp,
                      icon: Icon(
                        FontAwesomeIcons.handsHelping,
                        color: Colors.white,
                        size: 18,
                      ),
                      label: Text(
                        " Call Emotional Support Line",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
