import 'package:flutter/material.dart';

class CardActivite extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color colorType;
  final Color backGroundColor;
  const CardActivite(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.colorType,
      required this.backGroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 6,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backGroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Cor da sombra
            spreadRadius: 2, // Propagação da sombra
            blurRadius: 5, // Raio do desfoque
            offset: const Offset(0, 2), // Deslocamento da sombra
          ),
        ],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              color: colorType,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                bottomLeft: Radius.circular(4),
              ),
            ),
            width: 6,
          ),
          const SizedBox(
            width: 24,
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 14,
              ),
              Text('Mesa redonda de 07:00 até 08:00',
                  style: TextStyle(fontSize: 14.0)),
              Text('A Física dos Buracos Negros\nSupermassivos',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400)),
              Text('Stephen William Hawking',
                  style: TextStyle(fontSize: 14.0, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
