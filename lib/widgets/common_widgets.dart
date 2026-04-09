import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

// ── SECTION LABEL ─────────────────────────────────────────────────────────────
class SectionLabel extends StatelessWidget {
  final String text;
  const SectionLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text.toUpperCase(),
          style: GoogleFonts.dmMono(
            fontSize: 11,
            color: AppColors.accent,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(width: 12),
        Container(width: 40, height: 1, color: AppColors.border),
      ],
    );
  }
}

// ── SECTION TITLE ─────────────────────────────────────────────────────────────
class SectionTitle extends StatelessWidget {
  final String text;
  final String? highlighted;
  final double fontSize;

  const SectionTitle(
    this.text, {
    this.highlighted,
    this.fontSize = 32,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (highlighted == null) {
      return Text(
        text,
        style: GoogleFonts.fraunces(
          fontSize: fontSize,
          fontWeight: FontWeight.w300,
          color: AppColors.text,
          height: 1.1,
          letterSpacing: -0.5,
        ),
      );
    }
    return RichText(
      text: TextSpan(
        style: GoogleFonts.fraunces(
          fontSize: fontSize,
          fontWeight: FontWeight.w300,
          color: AppColors.text,
          height: 1.1,
          letterSpacing: -0.5,
        ),
        children: [
          TextSpan(text: text),
          TextSpan(
            text: highlighted,
            style: const TextStyle(
              color: AppColors.accent,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

// ── ACCENT BUTTON ─────────────────────────────────────────────────────────────
class AccentButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const AccentButton({required this.label, required this.onTap, super.key});

  @override
  State<AccentButton> createState() => _AccentButtonState();
}

class _AccentButtonState extends State<AccentButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedOpacity(
          opacity: _hovered ? 0.85 : 1.0,
          duration: const Duration(milliseconds: 150),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.accent,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Text(
              widget.label,
              style: GoogleFonts.syne(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.bg,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ── OUTLINE BUTTON ────────────────────────────────────────────────────────────
class OutlineBtn extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const OutlineBtn({required this.label, required this.onTap, super.key});

  @override
  State<OutlineBtn> createState() => _OutlineBtnState();
}

class _OutlineBtnState extends State<OutlineBtn> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            border: Border.all(
              color: _hovered
                  ? Colors.white.withOpacity(0.3)
                  : AppColors.border,
            ),
            borderRadius: BorderRadius.circular(2),
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.syne(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.text,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}

// ── TAG ───────────────────────────────────────────────────────────────────────
class TagChip extends StatelessWidget {
  final String label;
  const TagChip(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.tagBg,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        label.toUpperCase(),
        style: GoogleFonts.dmMono(
          fontSize: 9,
          color: AppColors.accent,
          letterSpacing: 1,
        ),
      ),
    );
  }
}

// ── DIVIDER ───────────────────────────────────────────────────────────────────
class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 1, color: AppColors.border);
  }
}

// ── STAT CARD ─────────────────────────────────────────────────────────────────
class StatCard extends StatelessWidget {
  final String number;
  final String label;
  const StatCard({required this.number, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: GoogleFonts.fraunces(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              color: AppColors.accent,
              height: 1,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label.toUpperCase(),
            style: GoogleFonts.dmMono(
              fontSize: 10,
              color: AppColors.muted,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
