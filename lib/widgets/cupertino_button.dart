import 'package:flutter/cupertino.dart';

class CupertinoStyledButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData icon;

  const CupertinoStyledButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Container(
        height: 64,
        width: 300,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 59, 105, 145),
              Color.fromARGB(255, 111, 169, 219),
            ],
          ),
        ),
        child: CupertinoButton(
          onPressed: onPressed,
          child: Row(
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 241, 244, 253),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 22,
                  color: const Color.fromARGB(255, 59, 105, 145),
                ),
              ),
              const SizedBox(width: 45),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
