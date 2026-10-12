import 'package:flutter/material.dart';

class GoogleMapReview extends StatelessWidget {
  const GoogleMapReview({super.key});

  Widget _buildButton({required IconData icon, required String title}) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        Text(title, style: TextStyle(color: Colors.blue)),
      ],
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.all(28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("Merbabu Montain"), Text("Via Suwanting")],
          ),
          Row(
            children: [
              Icon(Icons.star, color: Colors.blue),
              Text("4,9"),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Image(image: AssetImage("asset/mrbb.jpg")),
            _buildTitle(),
            Padding(
              padding: EdgeInsets.all(18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildButton(icon: Icons.call, title: "Call"),
                  _buildButton(icon: Icons.navigation, title: "Navigation"),
                  _buildButton(icon: Icons.share, title: "Share"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Gunung Merbabu adalah gunung berapi tipe strato dengan ketinggian 3.145 mdpl yang terletak di Provinsi Jawa Tengah, membentang di tiga wilayah kabupaten yaitu Boyolali, Magelang, dan Semarang.",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
