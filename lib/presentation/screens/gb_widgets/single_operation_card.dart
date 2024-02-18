import 'package:flutter/material.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/fonts_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/style_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';

class SingleOperationCard extends StatelessWidget {
  const SingleOperationCard({
    Key? key,
    required this.press1,
    required this.title1,
    required this.title2,
    required this.value,
    required this.left,
    required this.right,
    required this.color,
  }) : super(key: key);

  final VoidCallback press1;
  final String title1, title2, value;
  final double left;
  final double right;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          padding: const EdgeInsets.all(10),
          height: AppSize.s190,
          margin: EdgeInsets.only(
            right: right,
            left: left,
          ),
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: Colormanager.white)),
          child: InkWell(
            onTap: press1,
            child: Column(
              children: [
                const SizedBox(
                  height: AppSize.s10,
                ),
                Row(
                  children: [
                    Text(
                      title2,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      style: getRegularStyle(color: Colormanager.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),
                Text(
                  value,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: getBoldStyle(
                      color: Colormanager.white, fontSize: FontSize.s20),
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),
                Text(
                  title1,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: getSemiBoldStyle(
                      color: Colormanager.white, fontSize: FontSize.s16),
                ),
                const SizedBox(
                  height: AppSize.s10,
                ),
              ],
            ),
          )),
    );
  }
}
