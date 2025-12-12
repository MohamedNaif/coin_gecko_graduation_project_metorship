import 'package:coin_gecko_graduation_project_metorship/features/setting/presentation/constant/general_section_data.dart';
import 'package:coin_gecko_graduation_project_metorship/features/setting/presentation/widgets/build_section_list.dart';
import 'package:flutter/material.dart';

class GeneralSection extends StatelessWidget {
  const GeneralSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildSectionList(items: GeneralSectionData.items(context));
  }
}
