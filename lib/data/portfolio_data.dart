class ProjectModel {
  final String emoji;
  final String title;
  final String description;
  final List<String> tags;

  const ProjectModel({
    required this.emoji,
    required this.title,
    required this.description,
    required this.tags,
  });
}

class SkillModel {
  final String emoji;
  final String name;
  final String detail;
  final double level;

  const SkillModel({
    required this.emoji,
    required this.name,
    required this.detail,
    required this.level,
  });
}

class ServiceModel {
  final String number;
  final String title;
  final String description;
  final List<String> items;

  const ServiceModel({
    required this.number,
    required this.title,
    required this.description,
    required this.items,
  });
}

class TestimonialModel {
  final String text;
  final String name;
  final String role;
  final String initials;

  const TestimonialModel({
    required this.text,
    required this.name,
    required this.role,
    required this.initials,
  });
}

class ProcessStepModel {
  final String number;
  final String title;
  final String description;

  const ProcessStepModel({
    required this.number,
    required this.title,
    required this.description,
  });
}

// ── DATA ──────────────────────────────────────────────────────────────────────

const List<ProjectModel> projects = [
  ProjectModel(
    emoji: '🛍️',
    title: 'E-Commerce App',
    description:
        'Modern shopping app with product catalogue, cart, wishlist, Razorpay payments, order tracking, and admin dashboard. Handles 500+ daily transactions.',
    tags: ['Flutter', 'Razorpay', 'Firestore'],
  ),
  ProjectModel(
    emoji: '📊',
    title: 'Analytics Dashboard',
    description:
        'SaaS admin dashboard with real-time charts, data tables, role-based auth, and export functionality. Fully responsive across all platforms.',
    tags: ['Flutter Web', 'Charts', 'REST API'],
  ),
  ProjectModel(
    emoji: '🍔',
    title: 'Food Delivery App',
    description:
        'Swiggy-style food delivery app with restaurant listing, real-time order tracking, driver assignment, and live push notifications.',
    tags: ['Flutter', 'Firebase', 'Push Notifs'],
  ),
  ProjectModel(
    emoji: '💬',
    title: 'Chat & Video App',
    description:
        'Real-time messaging with 1-on-1 and group chats, media sharing, voice/video calls via WebRTC, and end-to-end encryption.',
    tags: ['Flutter', 'Firebase', 'WebRTC'],
  ),
  ProjectModel(
    emoji: '🏥',
    title: 'Doctor Booking App',
    description:
        'Healthcare app with doctor profiles, appointment booking, video consultations, prescription management, and medical history tracking.',
    tags: ['Flutter', 'BLoC', 'REST API'],
  ),
];

const List<SkillModel> skills = [
  SkillModel(
    emoji: '📱',
    name: 'Flutter & Dart',
    detail: 'State management, animations, custom widgets',
    level: 0.95,
  ),
  SkillModel(
    emoji: '🔥',
    name: 'Firebase',
    detail: 'Firestore, Auth, Storage, Cloud Functions',
    level: 0.90,
  ),
  SkillModel(
    emoji: '🔌',
    name: 'REST APIs & Integration',
    detail: 'Payments, Maps, Push Notifications',
    level: 0.88,
  ),
  SkillModel(
    emoji: '🎨',
    name: 'UI/UX Design',
    detail: 'Figma, custom animations, responsive layouts',
    level: 0.82,
  ),
  SkillModel(
    emoji: '🏗️',
    name: 'Clean Architecture',
    detail: 'BLoC, Provider, Riverpod, MVVM',
    level: 0.85,
  ),
  SkillModel(
    emoji: '🌐',
    name: 'Flutter Web & Desktop',
    detail: 'PWA, responsive, cross-platform',
    level: 0.78,
  ),
];

const List<ServiceModel> services = [
  ServiceModel(
    number: '01',
    title: 'Mobile App Development',
    description:
        'End-to-end Flutter app development for iOS and Android — from wireframe to App Store launch.',
    items: [
      'Custom UI & animations',
      'State management (BLoC/Riverpod)',
      'API integration & offline mode',
      'Play Store & App Store submission',
    ],
  ),
  ServiceModel(
    number: '02',
    title: 'Flutter Web Apps',
    description:
        'Responsive web apps and dashboards built with Flutter Web — one codebase, all platforms.',
    items: [
      'Admin dashboards & analytics',
      'Multi-role auth systems',
      'Real-time data & charts',
      'PWA support',
    ],
  ),
  ServiceModel(
    number: '03',
    title: 'Firebase & Backend',
    description:
        'Full Firebase integration — database, authentication, storage, and serverless cloud functions.',
    items: [
      'Firestore data modelling',
      'Firebase Auth (Google, email, OTP)',
      'Cloud Functions & triggers',
      'FCM push notifications',
    ],
  ),
  ServiceModel(
    number: '04',
    title: 'App Redesign & Optimization',
    description:
        'Modernise your existing Flutter app — improve performance, refactor code, and refresh the UI.',
    items: [
      'Performance profiling & fixes',
      'UI/UX redesign in Figma',
      'Code refactoring & cleanup',
      'Upgrade to latest Flutter versions',
    ],
  ),
];

const List<TestimonialModel> testimonials = [
  TestimonialModel(
    text:
        '"Vaishnavi delivered our e-commerce app ahead of schedule with pixel-perfect UI. The Razorpay integration worked flawlessly on day one. Highly recommend!"',
    name: 'Rahul Kapoor',
    role: 'Founder, ShopEasy India',
    initials: 'RK',
  ),
  TestimonialModel(
    text:
        '"Our bus booking app needed real-time seat tracking and live maps — Vaishnavi nailed every feature. Clean code, great communication throughout."',
    name: 'Priya Sharma',
    role: 'CTO, TravelGo',
    initials: 'PS',
  ),
  TestimonialModel(
    text:
        '"The analytics dashboard she built looks amazing and handles thousands of records without a hitch. Will definitely hire again for our next project."',
    name: 'Arjun Mehta',
    role: 'Product Manager, DataPulse',
    initials: 'AM',
  ),
];

const List<ProcessStepModel> processSteps = [
  ProcessStepModel(
    number: '01',
    title: 'Discovery Call',
    description:
        'We discuss your idea, goals, timeline, and budget. I ask the right questions to understand what you truly need.',
  ),
  ProcessStepModel(
    number: '02',
    title: 'Proposal & Design',
    description:
        'I send a detailed scope, timeline, and quote. Once approved, I create Figma wireframes for your sign-off.',
  ),
  ProcessStepModel(
    number: '03',
    title: 'Build & Review',
    description:
        'Development in sprints with weekly demos. You\'re always in the loop — no surprises at the end.',
  ),
  ProcessStepModel(
    number: '04',
    title: 'Launch & Support',
    description:
        'I handle app store submission and provide 30 days of post-launch support for bug fixes and tweaks.',
  ),
];
