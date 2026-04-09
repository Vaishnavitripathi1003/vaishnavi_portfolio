import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class PortfolioNavbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onAbout;
  final VoidCallback onWork;
  final VoidCallback onServices;
  final VoidCallback onContact;

  const PortfolioNavbar({
    required this.onAbout,
    required this.onWork,
    required this.onServices,
    required this.onContact,
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 700;

    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: AppColors.bg.withOpacity(0.9),
        border: const Border(bottom: BorderSide(color: AppColors.border)),
      ),
      padding: EdgeInsets.symmetric(horizontal: isWide ? 60 : 24),
      child: Row(
        children: [
          // Logo
          Text(
            'V.',
            style: GoogleFonts.fraunces(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.accent,
            ),
          ),
          const Spacer(),
          // Nav links (only on wide)
          if (isWide) ...[
            _NavLink('About', onAbout),
            const SizedBox(width: 28),
            _NavLink('Work', onWork),
            const SizedBox(width: 28),
            _NavLink('Services', onServices),
            const SizedBox(width: 28),
          ],
          // CTA
          GestureDetector(
            onTap: onContact,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(2),
              ),
              child: Text(
                'HIRE ME',
                style: GoogleFonts.syne(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: AppColors.bg,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _NavLink(this.label, this.onTap);

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.label.toUpperCase(),
          style: GoogleFonts.syne(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: _hovered ? AppColors.text : AppColors.muted,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}
