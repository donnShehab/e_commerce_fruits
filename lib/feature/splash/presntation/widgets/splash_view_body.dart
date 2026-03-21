import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_coomerce_fruit/core/helper_functions/app_router.dart';
import 'package:e_coomerce_fruit/feature/splash/presntation/widgets/alwadi_splash_content.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  bool _hasNavigated = false;
  bool? _isOnline; // null = still checking
  final Duration _splashDuration = const Duration(seconds: 3);

  @override
  void initState() {
    super.initState();
    _startAppInitialization();
  }

  @override
  void disposes() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const AlwadiSplashContent(),

        if (_isOnline == false)
          Positioned.fill(
            child: Container(
              color: Colors.black54,
              child: Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.wifi_off, color: Colors.red, size: 48),
                      SizedBox(height: 16),
                      Text(
                        'No Internet Connection',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Checking connection...',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  bool _isConnected(List<ConnectivityResult> results) {
    return results.contains(ConnectivityResult.mobile) ||
        results.contains(ConnectivityResult.wifi) ||
        results.contains(ConnectivityResult.ethernet);
  }

  void _startAppInitialization() async {
    final initialResults = await Connectivity().checkConnectivity();
    _isOnline = _isConnected(initialResults);

    if (mounted) {
      setState(() {});
    }

    _subscription = Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      if (!mounted) return;

      final newIsOnline = _isConnected(results);

      if (newIsOnline != _isOnline) {
        setState(() {
          _isOnline = newIsOnline;
        });
      }

      if (newIsOnline && !_hasNavigated) {
        log('Connected to the internet, navigating...');
        _hasNavigated = true;
        _navigateBasedOnPrefsAndAuth();
      }
    });

    await Future.delayed(_splashDuration);

    if (_isOnline == true && !_hasNavigated) {
      _hasNavigated = true;
      _navigateBasedOnPrefsAndAuth();
    }
  }

  void _navigateBasedOnPrefsAndAuth() {
    if (!mounted) return;
    final router = GoRouter.of(context);
    router.go(AppRouter.kOnboarding);
  }
}
