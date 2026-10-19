import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const DashboardApp());

// Konstanta breakpoint layar responsif
const double kWideBreakpoint = 700;

class DashboardApp extends StatefulWidget {
  const DashboardApp({super.key});

  @override
  State<DashboardApp> createState() => _DashboardAppState();
}

class _DashboardAppState extends State<DashboardApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.indigo,
      ),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      home: DashboardPage(
        isDark: isDark,
        onDarkChanged: (value) => setState(() => isDark = value),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({
    required this.isDark,
    required this.onDarkChanged,
    super.key,
  });

  final bool isDark;
  final ValueChanged<bool> onDarkChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Academic Overview',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Row(
            children: [
              Semantics(
                label: isDark ? 'Mode gelap aktif' : 'Mode terang aktif',
                child: Icon(
                  isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                  size: 20,
                ),
              ),
              const SizedBox(width: 8),
              Semantics(
                label: 'Tombol pengubah tema terang dan gelap',
                child: Switch.adaptive(
                  value: isDark,
                  onChanged: onDarkChanged,
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= kWideBreakpoint;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Profil Mahasiswa
                Semantics(
                  label: 'Informasi profil: Anas Maghfuri Al-Maulidi, Mahasiswa Teknologi Informaasi',
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          theme.colorScheme.primaryContainer.withOpacity(0.7),
                          theme.colorScheme.surfaceContainerHighest,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: theme.colorScheme.outlineVariant.withOpacity(0.5),
                      ),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundColor: theme.colorScheme.primary,
                          child: Text(
                            'IF',
                            style: TextStyle(
                              color: theme.colorScheme.onPrimary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Anas Maghfuri Al-Maulidi',
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Teknologi Informaasi • Semester 7',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  'Statistik Semester Ini',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Grid Kartu Informasi (Responsif Baris/Kolom)
                isWide
                    ? Column(
                        children: [
                          Row(
                            children: const [
                              Expanded(
                                child: InfoCard(
                                  title: 'IPK / GPA',
                                  value: '3.85',
                                  subtitle: 'Kumulatif sangat baik',
                                  icon: Icons.school_rounded,
                                  accessibilityLabel: 'IPK 3.85',
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: InfoCard(
                                  title: 'Assignments',
                                  value: '8',
                                  subtitle: 'Tugas perlu diselesaikan',
                                  icon: Icons.assignment_rounded,
                                  accessibilityLabel: '8 Tugas tertunda',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: const [
                              Expanded(
                                child: InfoCard(
                                  title: 'Attendance',
                                  value: '92%',
                                  subtitle: 'Kehadiran kuliah aman',
                                  icon: Icons.verified_rounded,
                                  accessibilityLabel: 'Kehadiran 92 persen',
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: InfoCard(
                                  title: 'Current Week',
                                  value: 'Week 06',
                                  subtitle: 'Minggu akademik aktif',
                                  icon: Icons.calendar_today_rounded,
                                  accessibilityLabel: 'Minggu akademik ke-6',
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Column(
                        children: const [
                          InfoCard(
                            title: 'IPK / GPA',
                            value: '3.85',
                            subtitle: 'Kumulatif sangat baik',
                            icon: Icons.school_rounded,
                            accessibilityLabel: 'IPK 3.85',
                          ),
                          SizedBox(height: 16),
                          InfoCard(
                            title: 'Assignments',
                            value: '8',
                            subtitle: 'Tugas perlu diselesaikan',
                            icon: Icons.assignment_rounded,
                            accessibilityLabel: '8 Tugas tertunda',
                          ),
                          SizedBox(height: 16),
                          InfoCard(
                            title: 'Attendance',
                            value: '92%',
                            subtitle: 'Kehadiran kuliah aman',
                            icon: Icons.verified_rounded,
                            accessibilityLabel: 'Kehadiran 92 persen',
                          ),
                          SizedBox(height: 16),
                          InfoCard(
                            title: 'Current Week',
                            value: 'Week 06',
                            subtitle: 'Minggu akademik aktif',
                            icon: Icons.calendar_today_rounded,
                            accessibilityLabel: 'Minggu akademik ke-6',
                          ),
                        ],
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Reusable InfoCard yang Dipercantik dengan Ikon dan Subtitle
class InfoCard extends StatelessWidget {
  const InfoCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.accessibilityLabel,
    super.key,
  });

  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final String accessibilityLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Semantics(
      label: accessibilityLabel,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: theme.colorScheme.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      value,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: theme.colorScheme.outline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}