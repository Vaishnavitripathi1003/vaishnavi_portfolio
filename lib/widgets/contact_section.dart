import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import 'common_widgets.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _projectCtrl = TextEditingController();
  final _messageCtrl = TextEditingController();
  bool _sent = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _projectCtrl.dispose();
    _messageCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (_nameCtrl.text.isEmpty || _emailCtrl.text.isEmpty) return;
    setState(() => _sent = true);
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;
    final padding = isWide
        ? const EdgeInsets.symmetric(horizontal: 60, vertical: 80)
        : const EdgeInsets.symmetric(horizontal: 24, vertical: 60);

    return Container(
      padding: padding,
      child: isWide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _leftContent(context)),
                const SizedBox(width: 60),
                Expanded(child: _formContent()),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _leftContent(context),
                const SizedBox(height: 48),
                _formContent(),
              ],
            ),
    );
  }

  Widget _leftContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionLabel('Get in touch'),
        const SizedBox(height: 16),
        SectionTitle("Let's build something ", highlighted: 'great together', fontSize: 36),
        const SizedBox(height: 24),
        GestureDetector(
          onTap: () {},
          child: Text(
            'vaishnavi@email.com',
            style: GoogleFonts.fraunces(
              fontSize: 22,
              fontWeight: FontWeight.w300,
              color: AppColors.accent,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: ['LinkedIn', 'GitHub', 'Upwork', 'Fiverr']
              .map((s) => _SocialChip(label: s))
              .toList(),
        ),
        const SizedBox(height: 28),
        Text(
          'Available for freelance projects, long-term contracts, and consulting.',
          style: GoogleFonts.syne(
            fontSize: 13,
            color: AppColors.muted,
            height: 1.75,
          ),
        ),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            style: GoogleFonts.syne(fontSize: 13, color: AppColors.muted),
            children: [
              const TextSpan(text: 'Typical response time: '),
              const TextSpan(
                text: 'under 24 hours',
                style: TextStyle(color: AppColors.accent),
              ),
              const TextSpan(text: '.'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _formContent() {
    if (_sent) {
      return Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(color: AppColors.accent.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('✅', style: TextStyle(fontSize: 36)),
            const SizedBox(height: 16),
            Text(
              'Message sent!',
              style: GoogleFonts.fraunces(
                fontSize: 22,
                color: AppColors.text,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "I'll get back to you within 24 hours.",
              style: GoogleFonts.syne(
                fontSize: 13,
                color: AppColors.muted,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _FormField(label: 'Your name', hint: 'Rahul Verma', controller: _nameCtrl),
        const SizedBox(height: 14),
        _FormField(
            label: 'Email address',
            hint: 'rahul@company.com',
            controller: _emailCtrl),
        const SizedBox(height: 14),
        _FormField(
            label: 'Project type',
            hint: 'e.g. E-commerce app, SaaS dashboard...',
            controller: _projectCtrl),
        const SizedBox(height: 14),
        _FormField(
          label: 'Tell me about your project',
          hint: 'Describe your idea, timeline, and budget...',
          controller: _messageCtrl,
          maxLines: 5,
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: _submit,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.accent,
              borderRadius: BorderRadius.circular(4),
            ),
            alignment: Alignment.center,
            child: Text(
              'SEND MESSAGE →',
              style: GoogleFonts.syne(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: AppColors.bg,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _FormField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final int maxLines;

  const _FormField({
    required this.label,
    required this.hint,
    required this.controller,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: GoogleFonts.dmMono(
            fontSize: 10,
            color: AppColors.muted,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          maxLines: maxLines,
          style: GoogleFonts.syne(fontSize: 13, color: AppColors.text),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.syne(fontSize: 13, color: AppColors.muted),
            filled: true,
            fillColor: AppColors.surface,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide:
                  BorderSide(color: AppColors.accent.withOpacity(0.5)),
            ),
          ),
        ),
      ],
    );
  }
}

class _SocialChip extends StatefulWidget {
  final String label;
  const _SocialChip({required this.label});

  @override
  State<_SocialChip> createState() => _SocialChipState();
}

class _SocialChipState extends State<_SocialChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: _hovered ? AppColors.surface2 : AppColors.surface,
            border: Border.all(
              color: _hovered
                  ? AppColors.accent.withOpacity(0.3)
                  : AppColors.border,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            widget.label.toUpperCase(),
            style: GoogleFonts.dmMono(
              fontSize: 10,
              color: _hovered ? AppColors.accent : AppColors.text,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
