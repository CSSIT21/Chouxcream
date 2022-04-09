import 'package:chouxcream_app/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          tileMode: TileMode.mirror,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ThemeConstant.swatchAccentLight[700] ?? ThemeConstant.colorAccentLight,
            ThemeConstant.swatchAccentDark[900] ?? ThemeConstant.colorAccentDark,
          ],
          stops: const [
            0,
            1,
          ],
        ),
        backgroundBlendMode: BlendMode.srcOver,
      ),
      child: PlasmaRenderer(
        type: PlasmaType.bubbles,
        particles: 8,
        color: ThemeConstant.colorAccentDark.withOpacity(0.3),
        blur: 0.3,
        size: 1.2,
        speed: 0.6,
        offset: 0,
        blendMode: BlendMode.plus,
        particleType: ParticleType.atlas,
        variation1: 0,
        variation2: 0.3,
        variation3: 0,
        rotation: 0,
        fps: 15,
      ),
    );
  }
}
