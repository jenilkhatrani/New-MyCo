import 'dart:async';
import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  final List<String> imagePaths;
  final bool isCarousel; // true = allow manual swipe
  final bool showBottomShadow;
  final bool showIndicator;
  final double? height;
  final double? width;
  final Duration switchDuration; // Delay between auto slides
  final Duration animationDuration; // Animation duration per slide

  const CustomSlider({
    Key? key,
    required this.imagePaths,
    this.isCarousel = false,
    this.showBottomShadow = false,
    this.showIndicator = true,
    this.height = 200,
    this.width = double.infinity,
    this.switchDuration = const Duration(seconds: 4),
    this.animationDuration = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  late final PageController _controller;
  late final List<ImageProvider<Object>> _images;
  Timer? _timer;

  static const int _initialPage = 1000;
  int _currentIndex = _initialPage;

  List<ImageProvider<Object>> get _imageProviders {
    return widget.imagePaths.map<ImageProvider<Object>>((path) {
      if (path.startsWith('http://') || path.startsWith('https://')) {
        return NetworkImage(path);
      } else {
        return AssetImage(path);
      }
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    _images = _imageProviders;
    _controller = PageController(initialPage: _initialPage);

    if (_images.isNotEmpty) {
      _startAutoSlide();
    }
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(widget.switchDuration, (_) {
      if (_controller.hasClients) {
        _currentIndex++;
        _controller.animateToPage(
          _currentIndex,
          duration: widget.animationDuration,
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_images.isEmpty) return const SizedBox();

    return SizedBox(
      height: widget.height ?? 200,
      width: widget.width ?? double.infinity,
      child: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemBuilder: (context, index) {
              final realIndex = index % _images.length;
              final image = _images[realIndex];

              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image(image: image, fit: BoxFit.cover),
                      ),
                      if (widget.showBottomShadow)
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          height: 40,
                          child: Container(
                            decoration: BoxDecoration(
                              // gradient: LinearGradient(
                              //   begin: Alignment.bottomCenter,
                              //   end: Alignment.topCenter,
                              //   colors: [
                              //     Colors.black45,
                              //     Colors.black26,
                              //     Colors.black12,
                              //     Colors.transparent,
                              //   ],
                              // ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 20,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
            physics: widget.isCarousel
                ? const BouncingScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
          ),
          if (widget.showIndicator)
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_images.length, (index) {
                  final isActive = (_currentIndex % _images.length) == index;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: isActive ? 10 : 6,
                    height: isActive ? 10 : 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isActive
                          ? Colors.white
                          : Colors.white.withValues(alpha: 0.4),
                    ),
                  );
                }),
              ),
            ),
        ],
      ),
    );
  }
}
