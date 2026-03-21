import 'package:e_coomerce_fruit/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class AlwadiSplashContent extends StatefulWidget {
  const AlwadiSplashContent({super.key});

  @override
  State<AlwadiSplashContent> createState() => _AlwadiSplashContentState();
}

class _AlwadiSplashContentState extends State<AlwadiSplashContent>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _opacityGlowAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.92,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _opacityGlowAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFCFAF7),
      child: Stack(
        children: [
          // subtle top-right soft glow
          Positioned(
            top: -80,
            right: -60,
            child: FadeTransition(
              opacity: _opacityGlowAnimation,
              child: _softGlow(size: 220, color: const Color(0x14F57C00)),
            ),
          ),

          // subtle bottom-left green touch
          Positioned(
            bottom: -90,
            left: -70,
            child: FadeTransition(
              opacity: _opacityGlowAnimation,
              child: _softGlow(size: 180, color: const Color(0x0E2E7D32)),
            ),
          ),

          // thin decorative top line
          Positioned(
            top: 110,
            left: 32,
            right: 32,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Container(
                height: 1.2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      const Color(0x22F57C00),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),

          // center logo section
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        _softGlow(size: 170, color: const Color(0x18F57C00)),
                        Image.asset(
                          Assets.imagesAlwadiLogo,
                          width: 190,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Container(
                      width: 90,
                      height: 3,
                      decoration: BoxDecoration(
                        color: const Color(0x33F57C00),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // subtle bottom line
          Positioned(
            bottom: 90,
            left: 70,
            right: 70,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Container(
                height: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      const Color(0x1A2E7D32),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _softGlow({required double size, required Color color}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [BoxShadow(color: color, blurRadius: 60, spreadRadius: 16)],
      ),
    );
  }
}
