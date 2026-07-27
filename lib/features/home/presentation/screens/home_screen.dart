import 'package:flutter/material.dart';

import '../widgets/background_glow.dart';
import '../widgets/custom_bottom_navbar.dart';
import '../widgets/home_header.dart';
import '../widgets/quick_calculate_card.dart';
import '../widgets/tool_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> tools = [
    {
      "title": "Scientific",
      "subtitle": "Calculator",
      "icon": Icons.science,
      "color": const Color(0xff5C6BC0),
    },
    {
      "title": "GST",
      "subtitle": "Calculator",
      "icon": Icons.receipt_long,
      "color": const Color(0xff8D6E63),
    },
    {
      "title": "EMI",
      "subtitle": "Calculator",
      "icon": Icons.home,
      "color": const Color(0xff43A047),
    },
    {
      "title": "Loan",
      "subtitle": "Calculator",
      "icon": Icons.credit_card,
      "color": const Color(0xff7E57C2),
    },
    {
      "title": "Currency",
      "subtitle": "Converter",
      "icon": Icons.currency_exchange,
      "color": const Color(0xff26C6DA),
    },
    {
      "title": "Unit",
      "subtitle": "Converter",
      "icon": Icons.straighten,
      "color": const Color(0xff8D6E63),
    },
    {
      "title": "History",
      "subtitle": "Saved",
      "icon": Icons.history,
      "color": const Color(0xff9E9E9E),
    },
    {
      "title": "Settings",
      "subtitle": "App",
      "icon": Icons.settings,
      "color": const Color(0xffAB47BC),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavbar(
        selectedIndex: selectedIndex,
        onChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: Stack(
        children: [
          const BackgroundGlow(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeHeader(),

                  const SizedBox(height: 25),

                  const QuickCalculateCard(),

                  const SizedBox(height: 24),

                  const Text(
                    "ALL TOOLS",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Expanded(
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: tools.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: .88,
                          ),
                      itemBuilder: (_, index) {
                        final tool = tools[index];

                        return ToolCard(
                          title: tool["title"],
                          subtitle: tool["subtitle"],
                          icon: tool["icon"],
                          color: tool["color"],
                          onTap: () {},
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
}
