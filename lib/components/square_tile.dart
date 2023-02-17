import 'package:flutter/material.dart';


class SquareTile extends StatefulWidget {
  final String imagePath;
  final VoidCallback onTap;
  const SquareTile({
    Key? key,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  _SquareTileState createState() => _SquareTileState();
}


class _SquareTileState extends State<SquareTile> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),

      child: GestureDetector(
        onTap: widget.onTap,

        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(16),
            color: isHovered ? Colors.grey[400] : Colors.grey[200],
          ),
          child: Image.asset(
            widget.imagePath,
            height: 40,
          ),
        ),
      ),
    );
  }
}
