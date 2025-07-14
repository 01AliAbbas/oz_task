import 'package:flutter/material.dart';
import 'package:oz_task/ui/common/app_colors.dart';
import 'package:oz_task/ui/common/app_text_styles.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: eazyBlue,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 40,
                        ),
                        title: Text(
                          'Bahrain Finanical Harbour',
                          style: AppTextStyles.body.white,
                        ),
                        subtitle: Text(
                          'Oz Muhhraqaq',
                          style: AppTextStyles.caption.grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // card
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: ListTile(
                                  leading: ImageIcon(
                                     const AssetImage("assets/Medal.png"),
                                    color: Colors.orange[700],
                                  ),
                                  title: Text(
                                    'Oz Loyalty',
                                    style: AppTextStyles.title1.black,
                                  ),
                                  subtitle: Text(
                                    "Bronze",
                                    style: AppTextStyles.title2.withColor(eazyBlue),
                                  ),
                                  contentPadding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  dense: true,
                                ),
                              ),
                              Container(
                                color: Colors.grey,
                                width: 1,
                                height: 40,
                              ),
                              Expanded(
                                child: ListTile(
                                  leading: const ImageIcon( AssetImage("assets/coffe.png"), color: Color.fromARGB(255, 220, 205, 177),size: 30,),
                                  title: Text(
                                    'Oz Points',
                                    style: AppTextStyles.title2.black,
                                  ),
                                  subtitle: Text(
                                    '2000 pts',
                                    style: AppTextStyles.title2.black,
                                  ),
                                  contentPadding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  dense: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      actions: [
        SafeArea(
          child: IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
        SafeArea(
          child: IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        140 +
            (WidgetsBinding.instance.window.padding.top /
                WidgetsBinding.instance.window.devicePixelRatio),
      );
}
