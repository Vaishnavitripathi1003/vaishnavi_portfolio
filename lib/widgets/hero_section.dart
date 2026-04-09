import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import 'common_widgets.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback onViewWork;
  final VoidCallback onContact;

  const HeroSection({
    required this.onViewWork,
    required this.onContact,
    super.key,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _dotController;

  @override
  void initState() {
    super.initState();
    _dotController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _dotController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;

    if (isWide) {
      return _buildWide(context);
    } else {
      return _buildNarrow(context);
    }
  }

  Widget _buildWide(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 600),
      padding: const EdgeInsets.fromLTRB(60, 100, 60, 60),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: _leftContent()),
          const SizedBox(width: 60),
          Expanded(child: _rightStats()),
        ],
      ),
    );
  }

  Widget _buildNarrow(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 90, 24, 48),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _leftContent(),
          const SizedBox(height: 40),
          _rightStats(),
        ],
      ),
    );
  }

  Widget _leftContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Available tag
        Row(
          children: [
            AnimatedBuilder(
              animation: _dotController,
              builder: (_, __) => Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  color: AppColors.accent
                      .withOpacity(0.4 + 0.6 * _dotController.value),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'AVAILABLE FOR FREELANCE',
              style: GoogleFonts.dmMono(
                fontSize: 10,
                color: AppColors.accent,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        // Headline
        RichText(
          text: TextSpan(
            style: GoogleFonts.fraunces(
              fontSize: 56,
              fontWeight: FontWeight.w300,
              color: AppColors.text,
              height: 1.05,
              letterSpacing: -1.5,
            ),
            children: const [
              TextSpan(text: 'Flutter\n'),
              TextSpan(
                text: 'Developer',
                style: TextStyle(
                  color: AppColors.accent,
                  fontStyle: FontStyle.italic,
                ),
              ),
              TextSpan(text: '\n& App Designer'),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          "I'm Vaishnavi — I build high-performance mobile apps & SaaS products with Flutter, Firebase, and clean architecture. Based in India, working globally.",
          style: GoogleFonts.syne(
            fontSize: 15,
            color: AppColors.muted,
            height: 1.75,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            AccentButton(label: 'VIEW MY WORK', onTap: widget.onViewWork),
            OutlineBtn(label: "LET'S TALK", onTap: widget.onContact),
          ],
        ),
      ],
    );
  }

  Widget _rightStats() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: StatCard(number: '20+', label: 'Apps Delivered')),
            const SizedBox(width: 12),
            Expanded(child: StatCard(number: '3+', label: 'Years Experience')),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: StatCard(number: '15+', label: 'Happy Clients')),
            const SizedBox(width: 12),
            Expanded(child: StatCard(number: '100%', label: 'On-time Delivery')),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            border: Border.all(color: AppColors.accent.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              AnimatedBuilder(
                animation: _dotController,
                builder: (_, __) => Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: AppColors.accent
                        .withOpacity(0.4 + 0.6 * _dotController.value),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Currently accepting new projects',
                    style: GoogleFonts.syne(
                      fontSize: 13,
                      color: AppColors.text,
                    ),
                  ),
                  Text(
                    'Response within 24 hours',
                    style: GoogleFonts.dmMono(
                      fontSize: 10,
                      color: AppColors.muted,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
