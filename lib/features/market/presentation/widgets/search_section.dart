import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../cubit/search_cubit.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({
    super.key,
    required this.searchTextController,
  });

  final TextEditingController searchTextController;

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.90,
        child: TextField(
          controller: widget.searchTextController,
          onChanged: (value) => context.read<SearchCubit>().search(value),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Search...',
            hintStyle: const TextStyle(color: Color(0xff8F8F8F)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            prefixIcon: SvgPicture.asset(
              'assets/icons/search_icon.svg',
              height: 18,
              width: 18,
              fit: BoxFit.scaleDown,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                // filter action
              },
              icon: SvgPicture.asset(
                'assets/icons/filters.svg',
                height: 18,
                width: 18,
                fit: BoxFit.scaleDown,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
          ),
        ),
      ),
    );
  }
}
