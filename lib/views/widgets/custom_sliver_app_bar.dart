import 'package:flutter/material.dart';
import 'package:my_note/views/search_view.dart';


class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 220,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.settings,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const SearchView();
            }));
          },
          icon: const Icon(
              Icons.search,
            size: 30,
          ),
        ),
      ],
      centerTitle: true,
      pinned: true,
      backgroundColor: Colors.purple,
      flexibleSpace: const FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          'NOTES',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
