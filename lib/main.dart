import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() {
  runApp(const MyApp()); // Entry point of the application
}

// Root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hero Animation Demo', // Title of the application
      home: const RadialHero(), // Initial widget to be displayed
    );
  }
}

// First screen with a Hero widget
class RadialHero extends StatelessWidget {
  const RadialHero({super.key});

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return Scaffold(
      body: Align(
        alignment:
            Alignment.topCenter, // Center horizontally and align to the top
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0), // Add padding from the top
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const RadialHero2(), // Navigate to the second screen
              ),
            ),
            child: Hero(
              tag:
                  'tag', // Unique tag to identify this Hero widget for the transition
              flightShuttleBuilder: (flightContext, animation, direction,
                  fromContext, toContext) {
                return AnimatedBuilder(
                  animation: animation, // Animation for the Hero transition
                  builder: (context, child) {
                    return ClipOval(
                      clipper: _OvalClipper(animation
                          .value), // Apply clipping based on animation value
                      child: child,
                    );
                  },
                  child: Image.asset(
                    'lib/assets/hero.jpg', // Image for the transition animation
                    width: 100,
                    height: 100,
                  ),
                );
              },
              child: ClipOval(
                child: Image.asset(
                  'lib/assets/hero.jpg', // Initial image displayed on the first screen
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Second screen with the same Hero widget
class RadialHero2 extends StatelessWidget {
  const RadialHero2({super.key});

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return Scaffold(
      body: Align(
        alignment: Alignment
            .bottomCenter, // Center horizontally and align to the bottom
        child: Padding(
          padding: const EdgeInsets.only(
              bottom: 50.0), // Add padding from the bottom
          child: GestureDetector(
            onTap: () => Navigator.pop(context), // Go back to the first screen
            child: Hero(
              tag:
                  'tag', // Same tag as the first screen's Hero widget for the transition
              flightShuttleBuilder: (flightContext, animation, direction,
                  fromContext, toContext) {
                return AnimatedBuilder(
                  animation: animation, // Animation for the Hero transition
                  builder: (context, child) {
                    return ClipOval(
                      clipper: _OvalClipper(animation
                          .value), // Apply clipping based on animation value
                      child: child,
                    );
                  },
                  child: Image.asset(
                    'lib/assets/hero.jpg', // Image for the transition animation
                    width: 100,
                    height: 100,
                  ),
                );
              },
              child: Image.asset(
                'lib/assets/hero.jpg', // Final image displayed on the second screen
                width: 200,
                height: 200,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Custom clipper to create an oval transition effect
class _OvalClipper extends CustomClipper<Rect> {
  final double progress; // Progress of the animation

  _OvalClipper(this.progress);

  @override
  Rect getClip(Size size) {
    final double offset = size.width *
        0.5 *
        progress; // Calculate offset based on animation progress
    return Rect.fromLTRB(
      -offset,
      -offset,
      size.width + offset,
      size.height + offset,
    ); // Define the clipping rectangle
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) =>
      true; // Always reclip for changes
}
