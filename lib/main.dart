// ignore_for_file: unused_element_parameter

import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    final lightTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      fontFamily: 'Roboto',
      scaffoldBackgroundColor: const Color(0xFFF9F9F9),
      cardColor: Colors.white,
      shadowColor: Colors.black,
      colorScheme: const ColorScheme.light(
        onSurface: Colors.black,
        surfaceContainerHighest: Color(0xFFE0E0E0),
      ),
      textTheme: TextTheme(
        displaySmall: const TextStyle(
          fontSize: 38,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        titleLarge: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        titleSmall: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Colors.grey[700],
          height: 1.4,
        ),
        bodySmall: TextStyle(fontSize: 12, color: Colors.grey[600]),
      ),
    );

    final darkTheme = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      fontFamily: 'Roboto',
      scaffoldBackgroundColor: const Color(0xFF121212),
      cardColor: const Color(0xFF1E1E1E),
      shadowColor: Colors.black,
      colorScheme: const ColorScheme.dark(
        onSurface: Colors.white,
        surfaceContainerHighest: Color(0xFF424242),
      ),
      textTheme: TextTheme(
        displaySmall: const TextStyle(
          fontSize: 38,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        titleLarge: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        titleSmall: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Colors.grey[400],
          height: 1.4,
        ),
        bodySmall: TextStyle(fontSize: 12, color: Colors.grey[500]),
      ),
    );

    return MaterialApp(
      title: 'Flutter Onboarding',
      debugShowCheckedModeBanner: false,

      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,

      home: OnboardingScreen(onToggleTheme: _toggleTheme),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const OnboardingScreen({super.key, required this.onToggleTheme});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _bottomTextController;

  @override
  void initState() {
    super.initState();
    _bottomTextController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _bottomTextController.forward();
  }

  @override
  void dispose() {
    _bottomTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gridLineColor = Theme.of(context).brightness == Brightness.light
        ? Colors.grey.shade300
        : Colors.grey.shade800;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned.fill(
                        child: CustomPaint(
                          painter: _GridPainter(
                            gridSize: 100.0,

                            lineColor: gridLineColor,
                          ),
                        ),
                      ),

                      _ContinuouslyMovingCard(
                        constraints: constraints,
                        initialPosition: Offset(
                          constraints.maxWidth * 0.05,
                          constraints.maxHeight * 0.1,
                        ),
                        duration: const Duration(seconds: 5),
                        child: Transform.rotate(
                          angle: -0.2,
                          child: const _FloatingAssetCard(
                            icon: Text("🇪🇺", style: TextStyle(fontSize: 24)),
                            ticker: "EUR/USD",
                            name: "Euro Dollar",
                            value: "\$108,8",
                            change: "↓ -127%",
                            changeColor: Colors.red,
                          ),
                        ),
                      ),
                      _ContinuouslyMovingCard(
                        constraints: constraints,
                        initialPosition: Offset(
                          constraints.maxWidth * 0.2,
                          constraints.maxHeight * 0.25,
                        ),
                        duration: const Duration(seconds: 4),
                        child: Transform.rotate(
                          angle: 0.1,
                          child: const _FloatingAssetCard(
                            icon: Text("🇬🇧", style: TextStyle(fontSize: 24)),
                            ticker: "GBP/USD",
                            name: "Pound Dollar",
                            value: "\$125,920",
                          ),
                        ),
                      ),
                      _ContinuouslyMovingCard(
                        constraints: constraints,
                        initialPosition: Offset(
                          constraints.maxWidth * 0.02,
                          constraints.maxHeight * 0.45,
                        ),
                        duration: const Duration(seconds: 6),
                        child: Transform.rotate(
                          angle: -0.1,
                          child: const _FloatingAssetCard(
                            icon: Text(
                              "Ξ",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                              ),
                            ),
                            ticker: "ETH",
                            name: "Ethereum",
                            value: "\$387,812M",
                            change: "↑ +50%",
                            changeColor: Colors.green,
                          ),
                        ),
                      ),
                      _ContinuouslyMovingCard(
                        constraints: constraints,
                        initialPosition: Offset(
                          constraints.maxWidth * 0.5,
                          constraints.maxHeight * 0.08,
                        ),
                        duration: const Duration(seconds: 4),
                        child: Transform.rotate(
                          angle: 0.15,
                          child: const _FloatingAssetCard(
                            icon: Icon(
                              Icons.apple,
                              color: Colors.black,
                              size: 28,
                            ),
                            ticker: "AAPL",
                            name: "Apple Inc",
                            value: "\$219",
                            change: "↑ +1.5%",
                            changeColor: Colors.green,
                          ),
                        ),
                      ),
                      _ContinuouslyMovingCard(
                        constraints: constraints,
                        initialPosition: Offset(
                          constraints.maxWidth * 0.55,
                          constraints.maxHeight * 0.35,
                        ),
                        duration: const Duration(seconds: 5),
                        child: Transform.rotate(
                          angle: -0.05,
                          child: const _FloatingAssetCard(
                            icon: Text(
                              "₿",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.orange,
                              ),
                            ),
                            ticker: "BTC/USD",
                            name: "Bitcoin",
                            value: "\$65,435B",
                            change: "↑ +550%",
                            changeColor: Colors.green,
                          ),
                        ),
                      ),
                      _ContinuouslyMovingCard(
                        constraints: constraints,
                        initialPosition: Offset(
                          constraints.maxWidth * 0.4,
                          constraints.maxHeight * 0.6,
                        ),
                        duration: const Duration(seconds: 6),
                        child: Transform.rotate(
                          angle: 0.1,
                          child: const _FloatingAssetCard(
                            icon: Icon(
                              Icons.electric_car,
                              color: Colors.red,
                              size: 24,
                            ),
                            ticker: "TSLA",
                            name: "Tesla inc",
                            value: "\$33,87",
                            change: "↓ -50%",
                            changeColor: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            _AnimatedItem(
              controller: _bottomTextController,
              interval: const Interval(0.2, 1.0, curve: Curves.easeOut),
              slideFrom: const Offset(0, 0.5),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Smart Trading,\nEasy Growth",
                      style: Theme.of(
                        context,
                      ).textTheme.displaySmall?.copyWith(height: 1.2),
                    ),
                    const SizedBox(height: 16),

                    Text(
                      "A Modern Finance App To Monitor Stocks, Forex, And Crypto Markets With Real-Time Insights.",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Text(
                            "₺",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          label: const Text(
                            "Start Now",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3B5BFF),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 28,
                              vertical: 18,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),

                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Theme.of(context).brightness == Brightness.dark
                                    ? Icons.light_mode_outlined
                                    : Icons.dark_mode_outlined,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                              onPressed: widget.onToggleTheme,
                            ),
                            _buildPageIndicator(isActive: true),
                            _buildPageIndicator(isActive: false),
                            _buildPageIndicator(isActive: false),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator({required bool isActive}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: isActive
            ? Theme.of(context).colorScheme.onSurface
            : Theme.of(context).colorScheme.surfaceContainerHighest,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _ContinuouslyMovingCard extends StatefulWidget {
  final Widget child;
  final BoxConstraints constraints;
  final Offset initialPosition;
  final Duration duration;
  final double cardWidth;
  final double cardHeight;

  const _ContinuouslyMovingCard({
    required this.child,
    required this.constraints,
    required this.initialPosition,
    this.duration = const Duration(seconds: 4),
    this.cardWidth = 200.0,
    this.cardHeight = 150.0,
  });

  @override
  _ContinuouslyMovingCardState createState() => _ContinuouslyMovingCardState();
}

class _ContinuouslyMovingCardState extends State<_ContinuouslyMovingCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late Offset _currentPosition;
  late Offset _nextPosition;
  final _random = math.Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _currentPosition = widget.initialPosition;
    _nextPosition = _getRandomPosition();

    _animation = Tween<Offset>(
      begin: _currentPosition,
      end: _nextPosition,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animateToNewPosition();
      }
    });

    _controller.forward();
  }

  void _animateToNewPosition() {
    setState(() {
      _currentPosition = _nextPosition;
      _nextPosition = _getRandomPosition();

      _controller.duration = Duration(
        milliseconds:
            (widget.duration.inMilliseconds *
                    (0.8 + _random.nextDouble() * 0.4))
                .round(),
      );
      _animation = Tween<Offset>(
        begin: _currentPosition,
        end: _nextPosition,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    });
    _controller.forward(from: 0.0);
  }

  Offset _getRandomPosition() {
    const double overhang = 80.0;

    final double minX = -overhang;
    final double minY = -overhang;

    final double maxX =
        widget.constraints.maxWidth - widget.cardWidth + overhang;
    final double maxY =
        widget.constraints.maxHeight - widget.cardHeight + overhang;

    final double rangeX = maxX - minX;
    final double rangeY = maxY - minY;

    final double newX =
        minX + (_random.nextDouble() * (rangeX > 0 ? rangeX : 0));
    final double newY =
        minY + (_random.nextDouble() * (rangeY > 0 ? rangeY : 0));

    return Offset(newX, newY);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Positioned(
          left: _animation.value.dx,
          top: _animation.value.dy,
          child: widget.child,
        );
      },
      child: widget.child,
    );
  }
}

class _AnimatedItem extends StatelessWidget {
  final AnimationController controller;
  final Interval interval;
  final Widget child;
  final Offset slideFrom;

  const _AnimatedItem({
    required this.controller,
    required this.interval,
    required this.child,
    this.slideFrom = const Offset(0, 0.5),
  });

  @override
  Widget build(BuildContext context) {
    final fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: interval));

    final slideAnimation = Tween<Offset>(
      begin: slideFrom,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: interval));

    return AnimatedBuilder(
      animation: controller,
      builder: (context, childWidget) {
        return FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(position: slideAnimation, child: childWidget),
        );
      },
      child: child,
    );
  }
}

class _FloatingAssetCard extends StatelessWidget {
  final Widget icon;
  final String ticker;
  final String name;
  final String value;
  final String? change;
  final Color? changeColor;

  const _FloatingAssetCard({
    required this.icon,
    required this.ticker,
    required this.name,
    required this.value,
    this.change,
    this.changeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              icon,
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(ticker, style: Theme.of(context).textTheme.titleSmall),
                  Text(name, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          Text(value, style: Theme.of(context).textTheme.titleLarge),
          if (change != null) ...[
            const SizedBox(height: 4),
            Text(
              change!,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: changeColor ?? Colors.grey,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  final double gridSize;
  final Color lineColor;

  _GridPainter({this.gridSize = 30.0, required this.lineColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;

    for (double x = gridSize; x < size.width; x += gridSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    for (double y = gridSize; y < size.height; y += gridSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
