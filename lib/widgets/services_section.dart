import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import 'common_widgets.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionLabel('What I offer'),
          const SizedBox(height: 12),
          SectionTitle('Services tailored for ', highlighted: 'your product', fontSize: 36),
          const SizedBox(height: 48),
          // Grid
          isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          _ServiceItem(service: services[0]),
                          const SizedBox(height: 1),
                          _ServiceItem(service: services[2]),
                        ],
                      ),
                    ),
                    Container(width: 1, color: AppColors.border, height: 500),
                    Expanded(
                      child: Column(
                        children: [
                          _ServiceItem(service: services[1]),
                          const SizedBox(height: 1),
                          _ServiceItem(service: services[3]),
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  children: services
                      .map((s) => Column(
                            children: [
                              _ServiceItem(service: s),
                              Container(
                                  height: 1, color: AppColors.border),
                            ],
                          ))
                      .toList(),
                ),
        ],
      ),
    );
  }
}

class _ServiceItem extends StatefulWidget {
  final ServiceModel service;
  const _ServiceItem({required this.service});

  @override
  State<_ServiceItem> createState() => _ServiceItemState();
}

class _ServiceItemState extends State<_ServiceItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(32),
        color: _hovered ? AppColors.surface : AppColors.bg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.service.number,
              style: GoogleFonts.dmMono(
                fontSize: 11,
                color: AppColors.accent,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.service.title,
              style: GoogleFonts.fraunces(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: AppColors.text,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.service.description,
              style: GoogleFonts.syne(
                fontSize: 13,
                color: AppColors.muted,
                height: 1.75,
              ),
            ),
            const SizedBox(height: 16),
            ...widget.service.items.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '—  ',
                      style: GoogleFonts.dmMono(
                        fontSize: 11,
                        color: AppColors.accent,
                      ),
                    ),
                    Text(
                      item,
                      style: GoogleFonts.dmMono(
                        fontSize: 11,
                        color: AppColors.muted,
                        letterSpacing: 0.3,
                      ),
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
}
