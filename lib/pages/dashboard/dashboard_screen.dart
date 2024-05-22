import 'package:flutter_startup/pages/dashboard/components/my_fields.dart';
import 'package:flutter_startup/widgets/responsive.w.dart';
import 'package:flutter/material.dart';
import 'package:flutter_startup/theme/dimensions.dart';
import 'components/header.dart';

import 'components/recent_files.dart';
import 'components/storage_details.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: DefaultPadding,
        child: Column(
          children: [
            Header(),
            SizedBox(height: DefaultPaddingValue),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      MyFiles(),
                      SizedBox(height: DefaultPaddingValue),
                      RecentFiles(),
                      if (Responsive.isMobile(context))
                        SizedBox(height: DefaultPaddingValue),
                      if (Responsive.isMobile(context)) StorageDetails(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: DefaultPaddingValue),
                // On Mobile means if the screen is less than 850 we don't want to show it
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: StorageDetails(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
