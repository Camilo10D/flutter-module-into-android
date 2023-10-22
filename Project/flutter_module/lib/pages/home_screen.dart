import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    this.title = '',
  });

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _expandedBackColor = Color(0xFF8B0E0E);
  static const _expandedTextColor = Color(0XFFFFFF66);
  static const _shrinkedBackColor = Colors.blue;
  static const _shrinkedTextColor = Colors.white;
  static const _expandedHeight = 920.0;
  static const _shrinkedHeight = 200.0;

  static const String _fakeError =
      'Error: Esto no es ningún error importando el módulo de Flutter,\n\nEsta es la pantalla inicial del módulo';
  static const String _greeting = 'Fin de la Demo!';

  Color _backColor = _expandedBackColor;
  double _height = _expandedHeight;
  bool _expanded = true;
  String _text = _fakeError;
  Color _textColor = _expandedTextColor;

  void _updateSize() {
    setState(() {
      _height = _expanded ? _shrinkedHeight : _expandedHeight;
      _backColor = _expanded ? _shrinkedBackColor : _expandedBackColor;
      _text = _expanded ? _greeting : _fakeError;
      _textColor = _expanded ? _shrinkedTextColor : _expandedTextColor;

      _expanded = !_expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    var label = Text(
      _text,
      style: GoogleFonts.splineSansMono(
        color: _textColor,
        fontWeight: FontWeight.bold,
        fontSize: _expanded ? 14.0 : 24.0,
      ),
    );

    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => _updateSize(),
          child: AnimatedSize(
            curve: Curves.easeIn,
            duration: const Duration(seconds: 1),
            child: AnimatedContainer(
              color: _backColor,
              duration: const Duration(seconds: 1),
              width: 420.0,
              height: _height,
              child: SafeArea(
                child: Padding(
                  padding:
                      EdgeInsets.only(top: _expanded ? 32.0 : 0.0, left: 16.0),
                  child: _expanded ? label : Center(child: label),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
