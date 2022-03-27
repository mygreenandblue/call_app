import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String? text;
  final VoidCallback? onClicked;

  const ButtonWidget({
    this.text,
    this.onClicked,
  });

  @override
  Widget build(BuildContext context) => Container(
        child: Container(
            width: double.infinity,
            height: 70,
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.pinkAccent, width: 1),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.pinkAccent,
                      blurRadius: 10,
                      offset: Offset(1, 1)),
                ],
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: onClicked, icon: Icon((Icons.calendar_today))),
                Text(text!)
              ],
            )),
      );
}
