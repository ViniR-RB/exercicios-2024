import 'package:flutter/material.dart';

class CardActivite extends StatelessWidget {
  final String type;
  final String title;
  final String subTitle;
  final Color colorType;
  final Color backGroundColor;
  const CardActivite(
      {super.key,
      required this.title,
      required this.type,
      required this.subTitle,
      required this.colorType,
      required this.backGroundColor});

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Container(
      width: width,
      height: height / 6.4,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backGroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: colorType,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(6),
                bottomLeft: Radius.circular(6),
              ),
            ),
            width: 6,
          ),
          const SizedBox(
            width: 24,
          ),
          Wrap(
            direction: Axis.vertical,
            children: [
              const SizedBox(
                height: 14,
              ),
              Text(type,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12.0)),
              SizedBox(
                width: width * 0.9 - 24,
                child: Text(title,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w400)),
              ),
              Text(subTitle,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14.0, color: Colors.grey)),
            ],
          )
        ],
      ),
    );
  }
}
