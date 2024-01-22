import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgViewer extends StatelessWidget {
  final String assetName;
  final double? height;
  final double? width;
  final ColorFilter? colorFilter;
  final BoxFit? fit;
  final Alignment? alignment;

  const SvgViewer.asset({
    super.key,
    required this.assetName,
    this.height,
    this.width,
    this.colorFilter,
    this.fit,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      height: height,
      width: width,
      colorFilter: colorFilter,
      fit: fit ?? BoxFit.contain,
      alignment: alignment ?? Alignment.center,
    );
  }
}
