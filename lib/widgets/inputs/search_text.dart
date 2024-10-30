import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:stadium/pages/fillter_page.dart';

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
          suffixIcon: IconButton(
              icon: Icon(IconlyLight.filter),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FilterScreen()));
              }),
          hintText: 'Search',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
        ),
      ),
    );
  }
}
