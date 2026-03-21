// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';

// /// A widget that wraps the main application to continuously monitor
// /// internet connectivity and display a sliding banner when offline.
// class ConnectivityBanner extends StatefulWidget {
//   final Widget child;
//   const ConnectivityBanner({super.key, required this.child});

//   @override
//   State<ConnectivityBanner> createState() => _ConnectivityBannerState();
// }

// class _ConnectivityBannerState extends State<ConnectivityBanner>
//     with SingleTickerProviderStateMixin {
//   // late initialization used as the subscription is set up in initState
//   late StreamSubscription<List<ConnectivityResult>> _subscription;
//   bool _isOnline = true; // Assume online initially until checked

//   // Animation controllers for smooth slide-in/slide-out motion
//   late AnimationController _animationController;
//   late Animation<Offset> _offsetAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 300),
//     );

//     // Defines the movement:
//     // begin: (0.0, 1.0) is off-screen (at the bottom)
//     // end: Offset.zero is visible on screen
//     _offsetAnimation =
//         Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero).animate(
//           CurvedAnimation(
//             parent: _animationController,
//             curve: Curves.easeInOut,
//           ),
//         );

//     // Start checking connection immediately
//     _checkInitialConnectivity();
//     // Start listening for connectivity changes
//     _subscription = Connectivity().onConnectivityChanged.listen(
//       _handleConnectivityChange,
//     );
//   }

//   @override
//   void dispose() {
//     // Cancel the stream subscription and dispose of the animation controller
//     _subscription.cancel();
//     _animationController.dispose();
//     super.dispose();
//   }

//   /// Checks if any result implies an active connection.
//   bool _isConnected(List<ConnectivityResult> results) {
//     return results.contains(ConnectivityResult.mobile) ||
//         results.contains(ConnectivityResult.wifi) ||
//         results.contains(ConnectivityResult.ethernet);
//   }

//   /// Initial check to set the state correctly on app start.
//   Future<void> _checkInitialConnectivity() async {
//     final initialResults = await Connectivity().checkConnectivity();
//     _handleConnectivityChange(initialResults);
//   }

//   /// Handles every change emitted by the connectivity stream.
//   void _handleConnectivityChange(List<ConnectivityResult> results) {
//     if (!mounted) return;
//     final newIsOnline = _isConnected(results);

//     if (_isOnline != newIsOnline) {
//       setState(() {
//         _isOnline = newIsOnline;
//       });

//       // Control the slide animation
//       if (_isOnline) {
//         _animationController.reverse(); // Slide out (down)
//       } else {
//         _animationController.forward(); // Slide in (up)
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         // 1. The main content of your app
//         widget.child,

//         // 2. The sliding banner (positioned at the bottom)
//         Align(
//           alignment: Alignment.bottomCenter,
//           child: SlideTransition(
//             position: _offsetAnimation,
//             child: Container(
//               width: double.infinity,
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 16.0,
//                 vertical: 12.0,
//               ),
//               color: Colors.red[700], // Prominent red background
//               child: const SafeArea(
//                 child: Row(
//                   children: [
//                     Icon(Icons.wifi_off, color: Colors.white),
//                     SizedBox(width: 12),
//                     Expanded(
//                       child: Text(
//                         'No internet access. Shopping is unavailable. Please check your connection.',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }




import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

/// A widget that wraps the main application to continuously monitor
/// internet connectivity and display a sliding banner when offline.
class ConnectivityBanner extends StatefulWidget {
  final Widget child;
  const ConnectivityBanner({super.key, required this.child});

  @override
  State<ConnectivityBanner> createState() => _ConnectivityBannerState();
}

class _ConnectivityBannerState extends State<ConnectivityBanner>
    with SingleTickerProviderStateMixin {
  late StreamSubscription<List<ConnectivityResult>> _subscription;
  bool _isOnline = true; // Assume online initially until check

  // Animation controllers for smooth slide-in/slide-out motion
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    // Defines the movement:
    // begin: (0.0, 1.0) is off-screen (at the bottom)
    // end: Offset.zero is visible on screen
    _offsetAnimation =
        Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

    // Start checking connection immediately on app start
    _checkConnectivityManually();
    // Start listening for automatic connectivity changes
    _subscription = Connectivity().onConnectivityChanged.listen(
      _handleConnectivityChange,
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    _animationController.dispose();
    super.dispose();
  }

  /// Checks if any result implies an active connection.
  bool _isConnected(List<ConnectivityResult> results) {
    return results.contains(ConnectivityResult.mobile) ||
        results.contains(ConnectivityResult.wifi) ||
        results.contains(ConnectivityResult.ethernet);
  }

  /// Manually checks the connectivity status. Used on app launch and by the RETRY button.
  Future<void> _checkConnectivityManually() async {
    final results = await Connectivity().checkConnectivity();
    _handleConnectivityChange(results);
  }

  /// Handles every change emitted by the connectivity stream or manual check.
  void _handleConnectivityChange(List<ConnectivityResult> results) {
    if (!mounted) return;
    final newIsOnline = _isConnected(results);

    if (_isOnline != newIsOnline) {
      setState(() {
        _isOnline = newIsOnline;
      });

      // Control the slide animation
      if (_isOnline) {
        _animationController.reverse(); // Slide out (down)
      } else {
        _animationController.forward(); // Slide in (up)
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. The main content of your app
        widget.child,

        // 2. The sliding banner (positioned at the bottom)
        Align(
          alignment: Alignment.bottomCenter,
          child: SlideTransition(
            position: _offsetAnimation,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ), // Reduced vertical padding slightly
              color: Colors.red[700], // Prominent red background
              child: SafeArea(
                // Removed const to allow for dynamic children
                child: Row(
                  children: [
                    const Icon(Icons.wifi_off, color: Colors.white),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'No internet access. Shopping is unavailable.',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                        maxLines: 2,
                      ),
                    ),

                    // --- The new RETRY Button ---
                    TextButton(
                      onPressed: _checkConnectivityManually,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(50, 30),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'RETRY',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          decoration: TextDecoration.underline,
                        ),
                      ),
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
}
