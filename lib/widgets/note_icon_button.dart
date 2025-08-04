import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class  NoteIconButton extends StatelessWidget {
  const NoteIconButton({
   required this.size,
  required this.Icon,
  required this.onPressed,
  super.key});
  final IconData Icon;
  final double? size;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
    onPressed: onPressed,
    icon: FaIcon(Icon),
    padding: EdgeInsets.zero,
    visualDensity: VisualDensity.compact,
    constraints: BoxConstraints(),
    style: IconButton.styleFrom(tapTargetSize:MaterialTapTargetSize.shrinkWrap ),
    iconSize: size,
    color: gray700,
    );
  }
}
