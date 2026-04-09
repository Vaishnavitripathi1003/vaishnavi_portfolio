import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/navbar.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/services_section.dart';
import '../widgets/process_testimonials_section.dart';
import '../widgets/contact_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();

  // Keys for scroll-to-section
  final _heroKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _servicesKey = GlobalKey();
  final _contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      extendBodyBehindAppBar: true,
      appBar: PortfolioNavbar(
        onAbout: () => _scrollTo(_aboutKey),
        onWork: () => _scrollTo(_projectsKey),
        onServices: () => _scrollTo(_servicesKey),
        onContact: () => _scrollTo(_contactKey),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Hero
            KeyedSubtree(
              key: _heroKey,
              child: HeroSection(
                onViewWork: () => _scrollTo(_projectsKey),
                onContact: () => _scrollTo(_contactKey),
              ),
            ),
            // About
            KeyedSubtree(
              key: _aboutKey,
              child: const AboutSection(),
            ),
            // Projects
            KeyedSubtree(
              key: _projectsKey,
              child: const ProjectsSection(),
            ),
            // Services
            KeyedSubtree(
              key: _servicesKey,
              child: const ServicesSection(),
            ),
            // Process
            const ProcessSection(),
            // Testimonials
            const TestimonialsSection(),
            // Contact
            KeyedSubtree(
              key: _contactKey,
              child: const ContactSection(),
            ),
            // Footer
            _footer(),
          ],
        ),
      ),
    );
  }

  Widget _footer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 24),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          Text(
            '© 2025 Vaishnavi — Flutter Developer',
            style: GoogleFonts.dmMono(
              fontSize: 11,
              color: AppColors.muted,
              letterSpacing: 0.5,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => _scrollTo(_heroKey),
            child: Text(
              'BACK TO TOP ↑',
              style: GoogleFonts.dmMono(
                fontSize: 11,
                color: AppColors.muted,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
