import 'package:flutter/material.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';

class AccountLevel extends StatelessWidget {
  final lblText1, lblText2;
  final VoidCallback press;
  const AccountLevel(
      {Key? key,
      required this.lblText1,
      required this.lblText2,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(15),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            //'Already have an account ?',
            lblText1,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: press,
            child: Text(
              lblText2,
              style: TextStyle(
                  color: Colormanager.primary,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
