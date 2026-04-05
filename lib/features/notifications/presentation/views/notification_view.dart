import 'package:diska_app/core/utils/custom_empty_card.dart';
import 'package:diska_app/core/utils/footer.dart';
import 'package:diska_app/core/utils/top_bar.dart';
import 'package:diska_app/features/notifications/presentation/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopBar(),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: Header()),
                SliverToBoxAdapter(
                  child: CustomEmptyCard(
                    icon: Icons.notifications_none_outlined,
                    title: 'لا توجد اشعارات جديدة',
                    subtitle: 'سنخبرك فور وصول اي تحديثات هامه',
                    isHaveButton: false,
                    buttonText: '',
                    onButtonPressed: () {
                      return;
                    },
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 32)),
                SliverToBoxAdapter(child: FooterSection()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
