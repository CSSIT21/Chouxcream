import 'package:chouxcream_app/classes/manifest.dart';
import 'package:chouxcream_app/classes/theme.dart';
import 'package:chouxcream_app/screens/more/index.dart';
import 'package:chouxcream_app/screens/progress/index.dart';
import 'package:chouxcream_app/screens/record/record_screen.dart';
import 'package:chouxcream_app/screens/today/today_screen.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

class CoreScreen extends StatefulWidget {
  const CoreScreen({Key? key}) : super(key: key);

  @override
  State<CoreScreen> createState() => _CoreScreenState();
}

class _CoreScreenState extends State<CoreScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  bool reloadChannel = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ManifestConstant.appName),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "Today",
        useSafeArea: true,
        // Apply safe area wrapper
        labels: const ["Today", "Progress", "More"],
        icons: const [
          //TODO: Change logo
          Icons.home,
          Icons.dashboard,
          Icons.people_alt,
        ],
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: TextStyle(
          fontSize: 12,
          color: ThemeConstant.swatchPrimary.shade600,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: ThemeConstant.swatchPrimary.shade400,
        tabSelectedColor: ThemeConstant.swatchPrimary.shade600,
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabIconSelectedColor: Colors.white,
        tabBarColor: const Color(0xFFFFFFFF),
        onTabItemSelected: (int value) {
          setState(() {
            _tabController.index = value;
          });
        },
      ),
      floatingActionButton: _tabController.index == 0
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddRecordScreen(
                              onFinish: () => setState(() {
                                reloadChannel = !reloadChannel;
                              }),
                            )));
              },
              child: const Icon(Icons.add),
            )
          : null,
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        // Swipe navigation handling is not supported
        controller: _tabController,
        children: [
          TodayScreen(channel: reloadChannel),
          const ProgressFragment(),
          const MoreFragment(),
        ],
      ),
    );
  }
}
