import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hero Animation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'tag',
          child: Icon(
            Icons.ac_unit,
            size: 100,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyWidget2()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyWidget2 extends StatelessWidget {
  const MyWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'tag',
          child: Icon(
            Icons.access_alarm,
            size: 100,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.remove),
      ),
    );
  }
}
// import 'dart:math' as math;

// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart' show timeDilation;

// class Photo extends StatelessWidget {
//   const Photo(
//       {Key? key, required this.icon, required this.color, required this.onTap})
//       : super(key: key);

//   final IconData icon;
//   final Color color;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Theme.of(context).primaryColor.withOpacity(0.25),
//       child: InkWell(
//         onTap: onTap,
//         child: LayoutBuilder(
//           builder: (BuildContext context, BoxConstraints size) {
//             return Icon(
//               icon,
//               size: 50,
//               color: color,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class RadialExpansion extends StatelessWidget {
//   const RadialExpansion({
//     Key? key,
//     required this.maxRadius,
//     required this.child,
//   })  : clipRectSize = 2.0 * (maxRadius / math.sqrt2),
//         super(key: key);

//   final double maxRadius;
//   final double clipRectSize;
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return ClipOval(
//       child: Center(
//         child: SizedBox(
//           width: clipRectSize,
//           height: clipRectSize,
//           child: ClipRect(
//             child: child,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class RadialExpansionDemo extends StatelessWidget {
//   static const double kMinRadius = 32.0;
//   static const double kMaxRadius = 128.0;
//   static const opacityCurve = Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

//   const RadialExpansionDemo({super.key});

//   static Tween<Rect?> _createRectTween(Rect? begin, Rect? end) {
//     return MaterialRectCenterArcTween(begin: begin, end: end);
//   }

//   static Widget _buildPage(
//       BuildContext context, IconData icon, String description) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(description),
//       ),
//       body: Container(
//         color: Theme.of(context).canvasColor,
//         child: Center(
//           child: Card(
//             elevation: 8.0,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SizedBox(
//                   width: kMaxRadius * 2.0,
//                   height: kMaxRadius * 2.0,
//                   child: Hero(
//                     createRectTween: _createRectTween,
//                     tag: icon,
//                     child: RadialExpansion(
//                       maxRadius: kMaxRadius,
//                       child: Photo(
//                         icon: icon,
//                         color: Colors.black,
//                         onTap: () {
//                           Navigator.of(context).pop();
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//                 Text(
//                   description,
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                   textScaleFactor: 3.0,
//                 ),
//                 const SizedBox(height: 20.0),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildHero(BuildContext context, IconData icon, String description) {
//     return SizedBox(
//       width: kMinRadius * 3.0,
//       height: kMinRadius * 3.0,
//       child: Hero(
//         createRectTween: _createRectTween,
//         tag: icon,
//         child: RadialExpansion(
//           maxRadius: kMaxRadius,
//           child: Photo(
//             icon: icon,
//             color: Colors.green,
//             onTap: () {
//               Navigator.of(context).push(
//                 PageRouteBuilder<void>(
//                   pageBuilder: (BuildContext context,
//                       Animation<double> animation,
//                       Animation<double> secondaryAnimation) {
//                     return AnimatedBuilder(
//                       animation: animation,
//                       builder: (BuildContext context, Widget? child) {
//                         return Opacity(
//                           opacity: opacityCurve.transform(animation.value),
//                           child: _buildPage(context, icon, description),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // animation speed.
//     timeDilation = 4.0;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Radial Expansion Demo'),
//         backgroundColor: Colors.green,
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(33.0),
//         alignment: Alignment.bottomLeft,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             _buildHero(context, Icons.ac_unit, 'Ice'),
//             _buildHero(context, Icons.access_alarm, 'Alarm'),
//             _buildHero(context, Icons.accessibility, 'Accessibility'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(home: RadialExpansionDemo()));
// }