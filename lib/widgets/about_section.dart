import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import 'common_widgets.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;
    final padding = isWide
        ? const EdgeInsets.symmetric(horizontal: 60, vertical: 80)
        : const EdgeInsets.symmetric(horizontal: 24, vertical: 60);

    return Container(
      padding: padding,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: isWide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _leftContent()),
                const SizedBox(width: 60),
                Expanded(child: _skillsGrid()),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _leftContent(),
                const SizedBox(height: 40),
                _skillsGrid(),
              ],
            ),
    );
  }

  Widget _leftContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionLabel('About me'),
        const SizedBox(height: 16),
        SectionTitle('Building apps that ', highlighted: 'actually work', fontSize: 36),
        const SizedBox(height: 24),
        Text(
          "I'm a Flutter developer with a strong eye for UI/UX and a love for clean, maintainable code. I specialise in turning ideas into polished cross-platform apps — iOS, Android, and web — from scratch.",
          style: GoogleFonts.syne(
            fontSize: 14,
            color: AppColors.muted,
            height: 1.85,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'My stack is centered around Flutter & Dart, backed by Firebase for real-time databases, authentication, and cloud functions. I work with REST APIs, payment gateways, maps, and push notifications daily.',
          style: GoogleFonts.syne(
            fontSize: 14,
            color: AppColors.muted,
            height: 1.85,
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface2,
            border: Border(
              left: BorderSide(color: AppColors.accent, width: 3),
            ),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(4),
              bottomRight: Radius.circular(4),
            ),
          ),
          child: Text(
            '"I don\'t just write code — I build products that solve real problems and delight users."',
            style: GoogleFonts.fraunces(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: AppColors.text,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }

  Widget _skillsGrid() {
    return Column(
      children: skills
          .map((s) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _SkillItem(skill: s),
              ))
          .toList(),
    );
  }
}

class _SkillItem extends StatefulWidget {
  final SkillModel skill;
  const _SkillItem({required this.skill});

  @override
  State<_SkillItem> createState() => _SkillItemState();
}

class _SkillItemState extends State<_SkillItem>
    with SingleTickerProviderStateMixin {
  bool _hovered = false;
  late AnimationController _barController;
  late Animation<double> _barAnim;

  @override
  void initState() {
    super.initState();
    _barController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _barAnim = Tween<double>(begin: 0, end: widget.skill.level)
        .animate(CurvedAnimation(parent: _barController, curve: Curves.easeOut));

    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _barController.forward();
    });
  }

  @override
  void dispose() {
    _barController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: _hovered ? AppColors.surface2 : AppColors.surface,
          border: Border.all(
            color: _hovered
                ? AppColors.accent.withOpacity(0.25)
                : AppColors.border,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            Text(widget.skill.emoji, style: const TextStyle(fontSize: 18)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.skill.name,
                    style: GoogleFonts.syne(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppColors.text,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.skill.detail,
                    style: GoogleFonts.dmMono(
                      fontSize: 10,
                      color: AppColors.muted,
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: 70,
              height: 3,
              child: AnimatedBuilder(
                animation: _barAnim,
                builder: (_, __) => ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: LinearProgressIndicator(
                    value: _barAnim.value,
                    backgroundColor: AppColors.surface2,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(AppColors.accent),
                    minHeight: 3,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
