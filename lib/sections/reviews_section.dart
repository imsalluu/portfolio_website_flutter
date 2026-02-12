import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../core/constants.dart';
import '../widgets/section_wrapper.dart';
import '../widgets/glass_card.dart';

class ReviewsSection extends StatefulWidget {
  const ReviewsSection({super.key});

  @override
  State<ReviewsSection> createState() => _ReviewsSectionState();
}

class _ReviewsSectionState extends State<ReviewsSection> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      
      if (_pageController.hasClients) {
        int nextPage = _currentPage + 1;
        if (nextPage >= reviews.length) {
          nextPage = 0;
        }
        
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOutCirc,
        );
      }
    });
  }

  final reviews = [
    {
      "name": "Waleed",
      "role": "The London Team",
      "review": "Salman is an exceptional Flutter developer. He delivered our project ahead of schedule with top-notch quality. His attention to detail in UI/UX is unmatched.",
      "stars": 5
    },
    {
      "name": "Johan Fleuren",
      "role": "CEO",
      "review": "The final product was even better than we imagined. Salman is highly professional and a great communicator. A true asset for any development team.",
      "stars": 5
    },
    {
      "name": "Ilias Diaf",
      "role": "Startup Founder",
      "review": "Working with Salman was a breeze. He took our complex ideas and turned them into a smooth, high-performing app in record time. Highly recommended!",
      "stars": 5
    },
    {
      "name": "Emily Chen",
      "role": "CTO at InnovateX",
      "review": "Technical expertise is top-tier. He solved complex backend integration issues we were facing and optimized the app performance significantly.",
      "stars": 5
    },
    {
      "name": "David Wilson",
      "role": "Director of Engineering",
      "review": "One of the best freelancers I've worked with. Clean code, great architecture choices, and very reliable. Will definitely hire again.",
      "stars": 5
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SectionWrapper(
      title: "Client Reviews",
      subtitle: "WHAT THEY SAY",
      child: MouseRegion(
        onEnter: (_) {
          _timer?.cancel();
          _timer = null;
        },
        onExit: (_) => _startAutoScroll(),
        child: Column(
          children: [
          SizedBox(
            height: 400, // Increased height to prevent overflow
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (idx) => setState(() => _currentPage = idx),
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final r = reviews[index];
                return AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: _currentPage == index ? 1.0 : 0.5,
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 700),
                      child: GlassCard(
                        opacity: isDark ? 0.1 : 0.05,
                        child: SingleChildScrollView( // Added scrolling to prevent overflow
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const FaIcon(FontAwesomeIcons.quoteLeft, size: 30, color: AppColors.primary),
                              const SizedBox(height: AppSpacing.lg),
                              Text(
                                r["review"] as String,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18, 
                                  fontStyle: FontStyle.italic, 
                                  color: isDark ? Colors.white : AppColors.textMainLight, 
                                  height: 1.6
                                ),
                              ),
                              const SizedBox(height: AppSpacing.xl),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 24,
                                    backgroundColor: AppColors.primary.withOpacity(0.2),
                                    child: const Icon(Icons.person, color: AppColors.primary),
                                  ),
                                  const SizedBox(width: AppSpacing.md),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          r["name"] as String,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold, 
                                            fontSize: 18, 
                                            color: isDark ? Colors.white : AppColors.textMainLight
                                          ),
                                        ),
                                        Text(
                                          r["role"] as String,
                                          style: TextStyle(
                                            color: isDark ? AppColors.textDimDark : AppColors.textDimLight, 
                                            fontSize: 14
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: AppSpacing.md),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(5, (i) => Icon(
                                  Icons.star_rounded, 
                                  size: 20, 
                                  color: i < (r["stars"] as int) ? Colors.amber : Colors.grey.withOpacity(0.3),
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Wrap( // Changed to Wrap to handle many dots on mobile
            alignment: WrapAlignment.center,
            spacing: 6,
            runSpacing: 6,
            children: List.generate(reviews.length, (i) => GestureDetector(
              onTap: () => _pageController.animateToPage(i, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _currentPage == i ? 32 : 12,
                height: 8,
                decoration: BoxDecoration(
                  gradient: _currentPage == i 
                    ? const LinearGradient(colors: [AppColors.primary, AppColors.secondary])
                    : null,
                  color: _currentPage == i ? null : AppColors.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            )),
          ),
        ],
      ),
    ),
    );
  }
}
