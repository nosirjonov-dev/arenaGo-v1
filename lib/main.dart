import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const ArenaGoApp());
}

class ArenaGoApp extends StatelessWidget {
  const ArenaGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ArenaGo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2DC653),
          primary: const Color(0xFF2DC653),
        ),
        fontFamily: 'Roboto',
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

// ─── Color Constants ───────────────────────────────────────────────────────────
const kGreen = Color(0xFF2DC653);
const kGreenLight = Color(0xFFE8F8ED);
const kGreenDark = Color(0xFF1A9E3F);
const kGrey = Color(0xFFF5F5F5);
const kGreyText = Color(0xFF9E9E9E);
const kTextDark = Color(0xFF1A1A1A);

// ─── Splash / Onboarding Screen ────────────────────────────────────────────────
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              // Logo
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: kGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.sports_soccer,
                  color: Colors.white,
                  size: 44,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'ArenaGo',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: kTextDark,
                ),
              ),
              const SizedBox(height: 40),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Yaqin futbol maydonini toping',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: kTextDark,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Bo'sh vaqtlarni ko'ring va tez bron qiling",
                  style: TextStyle(
                    fontSize: 15,
                    color: kGreyText,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Illustration
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kGreenLight,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: kGreen.withOpacity(0.4),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.sports_soccer,
                        size: 50,
                        color: kGreen,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Maydon topish button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SearchScreen()),
                  ),
                  icon: const SizedBox.shrink(),
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Maydon topish',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Maydon egasiman button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const OwnerDashboardScreen()),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFE0E0E0)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Maydon egasiman',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: kTextDark,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Field Model ───────────────────────────────────────────────────────────────
class Field {
  final String name;
  final String district;
  final String address;
  final String phone;
  final double rating;
  final int pricePerHour;
  final double distanceKm;
  final Color imageColor;

  const Field({
    required this.name,
    required this.district,
    required this.address,
    required this.phone,
    required this.rating,
    required this.pricePerHour,
    required this.distanceKm,
    required this.imageColor,
  });
}

final List<Field> sampleFields = [
  const Field(
    name: 'Arena Sport Complex',
    district: 'Chilonzor tumani',
    address: "Chilonzor tumani, Bunyodkor ko'chasi 12",
    phone: '+998 90 123 45 67',
    rating: 4.8,
    pricePerHour: 150000,
    distanceKm: 3.4,
    imageColor: Color(0xFF4CAF50),
  ),
  const Field(
    name: 'Green Stadium',
    district: 'Yunusobod tumani',
    address: "Yunusobod tumani, Amir Temur ko'chasi 5",
    phone: '+998 93 456 78 90',
    rating: 4.6,
    pricePerHour: 120000,
    distanceKm: 5.2,
    imageColor: Color(0xFF388E3C),
  ),
  const Field(
    name: 'Sport Plaza',
    district: 'Mirzo Ulugbek tumani',
    address: "Mirzo Ulugbek tumani, Sport ko'chasi 8",
    phone: '+998 91 234 56 78',
    rating: 4.3,
    pricePerHour: 100000,
    distanceKm: 7.8,
    imageColor: Color(0xFF66BB6A),
  ),
  const Field(
    name: 'City Arena',
    district: 'Shayxontohur tumani',
    address: "Shayxontohur tumani, Navoiy ko'chasi 3",
    phone: '+998 97 345 67 89',
    rating: 4.1,
    pricePerHour: 90000,
    distanceKm: 9.1,
    imageColor: Color(0xFF81C784),
  ),
];

// ─── Search Screen ─────────────────────────────────────────────────────────────
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final filtered = sampleFields
        .where((f) =>
    f.name.toLowerCase().contains(_query.toLowerCase()) ||
        f.district.toLowerCase().contains(_query.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('ArenaGo', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (v) => setState(() => _query = v),
                    decoration: InputDecoration(
                      hintText: "Joylashuv bo'yicha qidirish",
                      hintStyle: const TextStyle(color: kGreyText, fontSize: 14),
                      prefixIcon: const Icon(Icons.search, color: kGreyText),
                      filled: true,
                      fillColor: kGrey,
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: kGrey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.tune, color: kGreyText),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MapSearchScreen()),
              ),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: double.infinity,
                height: 46,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE0E0E0)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.map_outlined, size: 18, color: kTextDark),
                    SizedBox(width: 8),
                    Text(
                      'Xarita orqali qidirish',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${filtered.length} ta maydon topildi',
                style: const TextStyle(color: kGreyText, fontSize: 13),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filtered.length,
              itemBuilder: (ctx, i) => _FieldCard(field: filtered[i]),
            ),
          ),
        ],
      ),
    );
  }
}

class _FieldCard extends StatelessWidget {
  final Field field;
  const _FieldCard({required this.field});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => FieldDetailScreen(field: field)),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Stack(
              children: [
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    color: field.imageColor,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        field.imageColor,
                        field.imageColor.withOpacity(0.7),
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Icon(Icons.sports_soccer, size: 60, color: Colors.white54),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Color(0xFFFFC107), size: 14),
                        const SizedBox(width: 3),
                        Text(
                          field.rating.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    field.name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: kTextDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, size: 14, color: kGreyText),
                      const SizedBox(width: 4),
                      Text(
                        field.district,
                        style: const TextStyle(color: kGreyText, fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${_formatPrice(field.pricePerHour)} so'm",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: kTextDark,
                            ),
                          ),
                          const Text(
                            'soatiga',
                            style: TextStyle(color: kGreyText, fontSize: 12),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => FieldDetailScreen(field: field)),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                        ),
                        child: const Text(
                          "Jadvalni ko'rish",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatPrice(int price) {
    final s = price.toString();
    final buf = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buf.write(',');
      buf.write(s[i]);
    }
    return buf.toString();
  }
}

// ─── Field Detail Screen ───────────────────────────────────────────────────────
class FieldDetailScreen extends StatefulWidget {
  final Field field;
  const FieldDetailScreen({super.key, required this.field});

  @override
  State<FieldDetailScreen> createState() => _FieldDetailScreenState();
}

class _FieldDetailScreenState extends State<FieldDetailScreen> {
  int _selectedSlot = 0;
  final List<Map<String, dynamic>> _slots = [
    {'time': '08:00 – 09:00', 'available': true},
    {'time': '09:00 – 10:00', 'available': true},
    {'time': '10:00 – 11:00', 'available': true},
    {'time': '11:00 – 12:00', 'available': true},
    {'time': '12:00 – 13:00', 'available': true},
    {'time': '13:00 – 14:00', 'available': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image carousel
                  Stack(
                    children: [
                      Container(
                        height: 220,
                        color: widget.field.imageColor,
                        child: const Center(
                          child: Icon(Icons.sports_soccer,
                              size: 80, color: Colors.white54),
                        ),
                      ),
                      Positioned(
                        top: 44,
                        left: 12,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.arrow_back, size: 18),
                          ),
                        ),
                      ),
                      // Carousel dots
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _dot(true),
                            const SizedBox(width: 5),
                            _dot(false),
                            const SizedBox(width: 5),
                            _dot(false),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.field.name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: kTextDark,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.location_on_outlined,
                                size: 16, color: kGreyText),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                widget.field.address,
                                style: const TextStyle(
                                    color: kGreyText, fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.navigation,
                                size: 14, color: kGreen),
                            const SizedBox(width: 4),
                            Text(
                              '${widget.field.distanceKm} km uzoqlikda',
                              style: const TextStyle(
                                  color: kGreen, fontSize: 13),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.phone_outlined,
                                size: 16, color: kGreyText),
                            const SizedBox(width: 4),
                            Text(
                              widget.field.phone,
                              style: const TextStyle(
                                  color: kGreyText, fontSize: 13),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFE8E8E8)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Narxi',
                                  style: TextStyle(
                                      color: kGreyText, fontSize: 13)),
                              Text(
                                "${_formatPrice(widget.field.pricePerHour)} so'm",
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: kTextDark,
                                ),
                              ),
                              const Text('soatiga',
                                  style: TextStyle(
                                      color: kGreyText, fontSize: 12)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          "Bo'sh vaqtlar",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Bugun, 28 Fevral',
                          style: TextStyle(color: kGreyText, fontSize: 13),
                        ),
                        const SizedBox(height: 12),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _slots.length,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 3.2,
                          ),
                          itemBuilder: (ctx, i) {
                            final slot = _slots[i];
                            final selected = _selectedSlot == i;
                            final avail = slot['available'] as bool;
                            return GestureDetector(
                              onTap: avail
                                  ? () => setState(() => _selectedSlot = i)
                                  : null,
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: selected
                                      ? kGreen
                                      : avail
                                      ? Colors.white
                                      : kGrey,
                                  border: Border.all(
                                    color: selected
                                        ? kGreen
                                        : const Color(0xFFE0E0E0),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  slot['time'] as String,
                                  style: TextStyle(
                                    color: selected
                                        ? Colors.white
                                        : avail
                                        ? kTextDark
                                        : kGreyText,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom booking button
          Container(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x15000000),
                  blurRadius: 10,
                  offset: Offset(0, -4),
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Bron qilindi: ${_slots[_selectedSlot]['time']}',
                          ),
                          backgroundColor: kGreen,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Telefon orqali bron qilish',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Tanlangan vaqt: ${_slots[_selectedSlot]['time']}',
                  style: const TextStyle(color: kGreyText, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dot(bool active) => Container(
    width: active ? 20 : 8,
    height: 8,
    decoration: BoxDecoration(
      color: active ? Colors.white : Colors.white54,
      borderRadius: BorderRadius.circular(4),
    ),
  );

  String _formatPrice(int price) {
    final s = price.toString();
    final buf = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buf.write(',');
      buf.write(s[i]);
    }
    return buf.toString();
  }
}

// ─── Map Search Screen ─────────────────────────────────────────────────────────
class MapSearchScreen extends StatelessWidget {
  const MapSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Xarita orqali qidirish',
            style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Map placeholder
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                Container(
                  color: const Color(0xFFE8F4E8),
                  child: CustomPaint(
                    painter: _MapGridPainter(),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 14,
                            height: 14,
                            decoration: BoxDecoration(
                              color: kGreen,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text('Siz',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0x20000000), blurRadius: 8)
                      ],
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.navigation, size: 14, color: kGreen),
                        SizedBox(width: 6),
                        Text('Yaqin atrofda',
                            style: TextStyle(fontSize: 13)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Nearby list
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Text(
                      'Yaqin maydonlar',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: sampleFields.length,
                      itemBuilder: (ctx, i) {
                        final f = sampleFields[i];
                        return ListTile(
                          title: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  f.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.navigation,
                                      size: 13, color: kGreen),
                                  const SizedBox(width: 3),
                                  Text(
                                    '${f.distanceKm} km',
                                    style: const TextStyle(
                                        color: kGreen,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(f.district,
                                  style: const TextStyle(
                                      color: kGreyText, fontSize: 12)),
                              Text(
                                "${_formatPrice(f.pricePerHour)} so'm",
                                style: const TextStyle(
                                  color: kGreen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          onTap: () => Navigator.push(
                            ctx,
                            MaterialPageRoute(
                                builder: (_) => FieldDetailScreen(field: f)),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatPrice(int price) {
    final s = price.toString();
    final buf = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buf.write(',');
      buf.write(s[i]);
    }
    return buf.toString();
  }
}

class _MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green.withOpacity(0.15)
      ..strokeWidth = 1;
    const spacing = 40.0;
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
    // Draw some "roads"
    final roadPaint = Paint()
      ..color = Colors.white.withOpacity(0.8)
      ..strokeWidth = 6;
    canvas.drawLine(
        Offset(0, size.height * 0.4),
        Offset(size.width, size.height * 0.4),
        roadPaint);
    canvas.drawLine(
        Offset(size.width * 0.5, 0),
        Offset(size.width * 0.5, size.height),
        roadPaint);
    canvas.drawLine(
        Offset(size.width * 0.2, 0),
        Offset(size.width * 0.5, size.height * 0.4),
        roadPaint);
    canvas.drawLine(
        Offset(size.width * 0.7, size.height * 0.4),
        Offset(size.width, size.height * 0.7),
        roadPaint);
  }

  @override
  bool shouldRepaint(_) => false;
}

// ─── Owner Dashboard Screen ────────────────────────────────────────────────────
class OwnerDashboardScreen extends StatefulWidget {
  const OwnerDashboardScreen({super.key});

  @override
  State<OwnerDashboardScreen> createState() => _OwnerDashboardScreenState();
}

class _OwnerDashboardScreenState extends State<OwnerDashboardScreen> {
  int _selectedDay = 4; // Friday (Jum)
  bool _showManageModal = false;

  final _weekDays = ['Dush', 'Sesh', 'Chor', 'Pay', 'Jum', 'Shan', 'Yak'];
  final _weekNums = ['24', '25', '26', '27', '28', '29', '30'];

  final _bookings = [
    {'name': 'Javohir Alimov', 'phone': '+998 90 111 22 33', 'time': '15:00'},
    {'name': 'Sardor Karimov', 'phone': '+998 91 222 33 44', 'time': '18:00'},
    {'name': 'Aziz Rahimov', 'phone': '+998 93 333 44 55', 'time': '20:00'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('ArenaGo',
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
            Text('Arena Sport Complex',
                style: TextStyle(fontSize: 11, color: kGreyText)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => setState(() => _showManageModal = true),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Stats row
                Row(
                  children: [
                    Expanded(
                      child: _StatCard(
                        icon: Icons.calendar_today_outlined,
                        label: 'Jami bronlar',
                        value: '3',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _StatCard(
                        icon: Icons.attach_money,
                        label: 'Oylik daromad',
                        value: '2450k',
                        subValue: "so'm",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Today's bookings highlight card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: kGreen,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Bugungi bronlar',
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 13)),
                            SizedBox(height: 4),
                            Text('3',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 4),
                            Text('M03 3',
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 12)),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.trending_up,
                            color: Colors.white, size: 24),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Weekly calendar
                const Text('Haftalik kalendar',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(7, (i) {
                    final selected = _selectedDay == i;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedDay = i),
                      child: Column(
                        children: [
                          Text(
                            _weekDays[i],
                            style: TextStyle(
                              fontSize: 11,
                              color: selected ? kGreen : kGreyText,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            width: 36,
                            height: 36,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: selected ? kGreen : Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              _weekNums[i],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: selected ? Colors.white : kTextDark,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 20),
                // Today bookings list
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Bugungi bronlar',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add, size: 16, color: kGreen),
                      label: const Text("Qo'shish",
                          style: TextStyle(color: kGreen, fontSize: 13)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ..._bookings.map((b) => _BookingTile(booking: b)).toList(),
                const SizedBox(height: 40),
              ],
            ),
          ),
          // Modal overlay
          if (_showManageModal)
            GestureDetector(
              onTap: () => setState(() => _showManageModal = false),
              child: Container(color: Colors.black54),
            ),
          if (_showManageModal)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _FieldManageModal(
                onClose: () => setState(() => _showManageModal = false),
              ),
            ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String? subValue;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    this.subValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: kGreyText),
              const SizedBox(width: 6),
              Text(label,
                  style:
                  const TextStyle(color: kGreyText, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 6),
          Text(value,
              style: const TextStyle(
                  fontSize: 28, fontWeight: FontWeight.bold)),
          if (subValue != null)
            Text(subValue!,
                style:
                const TextStyle(color: kGreyText, fontSize: 12)),
        ],
      ),
    );
  }
}

class _BookingTile extends StatelessWidget {
  final Map<String, dynamic> booking;
  const _BookingTile({required this.booking});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: kGreenLight,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                (booking['name'] as String)[0],
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: kGreen),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(booking['name'] as String,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 14)),
                Text(booking['phone'] as String,
                    style: const TextStyle(
                        color: kGreyText, fontSize: 12)),
              ],
            ),
          ),
          Row(
            children: [
              const Icon(Icons.access_time, size: 14, color: kGreen),
              const SizedBox(width: 4),
              Text(
                booking['time'] as String,
                style: const TextStyle(
                    color: kGreen, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Field Manage Modal ────────────────────────────────────────────────────────
class _FieldManageModal extends StatelessWidget {
  final VoidCallback onClose;
  const _FieldManageModal({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Maydon boshqaruvi',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 2),
                    Text("Maydon ma'lumotlarini tahrirlash va boshqarish",
                        style:
                        TextStyle(color: kGreyText, fontSize: 12)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onClose,
                child: const Icon(Icons.close, color: kGreyText),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _InfoRow(icon: Icons.sports_soccer_outlined, label: 'Maydon nomi', value: 'Arena Sport Complex'),
          _InfoRow(icon: Icons.location_on_outlined, label: 'Manzil', value: "Chilonzor tumani, Bunyodkor ko'chasi 12"),
          _InfoRow(icon: Icons.phone_outlined, label: 'Telefon', value: '+998 90 123 45 67'),
          _InfoRow(icon: Icons.attach_money, label: 'Narxi', value: "150,000 so'm / soat"),
          _InfoRow(icon: Icons.access_time_outlined, label: 'Ish vaqti', value: '08:00 - 23:00'),
          const SizedBox(height: 8),
          const Text('Rasmlar',
              style: TextStyle(color: kGreyText, fontSize: 12)),
          const SizedBox(height: 8),
          Container(
            width: 80,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFF4CAF50),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.sports_soccer,
                color: Colors.white54, size: 30),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: onClose,
                  icon: const Icon(Icons.edit, size: 16, color: Colors.white),
                  label: const Text('Tahrirlash',
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kGreen,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4444),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.delete_outline,
                    color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: kGreyText),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(
                        color: kGreyText, fontSize: 11)),
                const SizedBox(height: 2),
                Text(value,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}