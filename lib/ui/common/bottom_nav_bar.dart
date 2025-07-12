
import 'package:flutter/material.dart';
import 'package:oz_task/ui/common/app_colors.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  
  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });
  
  final List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.percent),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.receipt_long),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: '',
    ),
  ];
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(
          items: widget.items,
          currentIndex: widget.selectedIndex,
          selectedItemColor: eazyBlue,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.shifting,
          onTap: widget.onItemTapped,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.normal,
          ),
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}