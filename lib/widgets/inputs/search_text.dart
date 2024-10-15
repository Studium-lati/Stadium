import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SearchText extends StatelessWidget {
  const SearchText({super.key, required this.searchController});
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 20),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(color: Colors.black)),
          prefixIcon: Icon(IconlyLight.search),
          suffixIcon: Icon(IconlyLight.filter),
          hintText: 'Search',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
        ),
      ),
    );
  }
}
