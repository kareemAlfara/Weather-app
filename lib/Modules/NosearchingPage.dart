import 'package:flutter/material.dart';
import 'package:weather_app/components/components.dart';


class NosearchingPage extends StatelessWidget {
  const NosearchingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: defulttext(
              data: "there is no weather 😔 start", fSize: 28),
        ),
    const    SizedBox(height: 11,),
      const    Text(
              ' searching now 🔍',
              style: TextStyle(fontSize: 28),),
      ],
    );
  }
}
