import 'package:flutter/cupertino.dart';

import '../../../../../config/app_colors/app_colors.dart';

class MyLoadingWidget extends StatelessWidget {
  const MyLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(
        color: AppColors.loading,
        radius: 14.0,
      ),
    );
  }
}
