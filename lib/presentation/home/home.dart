import 'package:coffebeans_assignments/data/dummyData.dart';
import 'package:coffebeans_assignments/graphics/custom_text_field.dart';
import 'package:coffebeans_assignments/infrastructure/navigation/navigation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top + 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 2.0)],
                  ),
                  child: CustomTextField(
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu),
                    ),
                    hintText: 'Search',
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Primary',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          ...List.generate(
            items.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                onTap: (){
                  Routes.of(context).toLocationMailContent(index);
                },
                minLeadingWidth: 45,
                leading: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.amberAccent),
                    child: Text(
                      items[index].leadingText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                title: Text(
                  items[index].sender,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                subtitle: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(items[index].titleText, maxLines: 1),
                    const SizedBox(height: 5),
                    Text(
                      items[index].subTitleText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


