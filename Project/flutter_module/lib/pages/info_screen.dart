import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title = const Text(
      'Módulo de Flutter ejecutado desde Android',
      style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 40,
        color: Color(0xFF666870),
        height: 1,
        letterSpacing: -1,
      ),
    );

    title = title
        .animate(onPlay: (controller) => controller.repeat())
        .shimmer(duration: 3000.ms, color: const Color(0xFF80DDFF))
        .animate()
        .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
        .slide();

    List<Widget> tabInfoItems = [
      _buildTile(Icons.access_time, 'Rápida implementación'),
      _buildTile(Icons.rocket_launch, 'Excelente performance'),
      _buildTile(Icons.recycling, 'Reusabilidad de código'),
      _buildTile(Icons.timeline, 'Baja curva de aprendizaje'),
    ];

    tabInfoItems = tabInfoItems
        .animate(interval: 800.ms)
        .fadeIn(duration: 1200.ms, delay: 300.ms)
        .shimmer(blendMode: BlendMode.srcOver, color: const Color(0x8073C5E3))
        .move(begin: const Offset(-16, 0), curve: Curves.easeOutQuad);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            title,
            hr,
            const Text(
              'Este ejemplo muestra como se puede integrar fácilmente un módulo de Flutter en una aplicación nativa de Android que se ha desarrollado bajo Kotlin.',
              textAlign: TextAlign.left,
            ),
            hr,
            ...tabInfoItems,
            hr,
            const Text('Librería usada para las animaciones: flutter_animate'),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF4BB8DF)),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              text,
            ),
          ),
        ],
      ),
    );
  }

  Widget get hr => Container(
        height: 2,
        color: const Color(0x8073C5E3),
        margin: const EdgeInsets.symmetric(vertical: 16),
      ).animate().scale(duration: 600.ms, alignment: Alignment.centerLeft);
}
