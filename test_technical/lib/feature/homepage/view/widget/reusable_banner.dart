import 'package:flutter/material.dart';

class SPKLUCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final Color subtitleColor;
  final VoidCallback? onTap;

  const SPKLUCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    this.backgroundColor = Colors.blue, // Default background
    this.borderColor = Colors.white, // Default border
    this.textColor = Colors.black, // Default text color
    this.subtitleColor = Colors.grey, // Default subtitle color
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Image.asset(
            imagePath,
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.height * 0.05,
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: subtitleColor,
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: onTap,
              icon: Icon(Icons.arrow_forward_ios_rounded, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
