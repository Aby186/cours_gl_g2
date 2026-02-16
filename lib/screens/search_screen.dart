import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/transaction.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    final filteredList = Transaction.transactionList
        .where((t) => t.title.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Recherche"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Rechercher une transaction...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  final t = filteredList[index];
                  return ListTile(
                    title: Text(
                      t.title,
                      style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w600,
                          color: Colors.deepPurple),
                    ),
                    subtitle: Text(t.date.toString(),
                        style: GoogleFonts.dmSans(color: Colors.grey)),
                    trailing: Text(
                      '-${t.amount} F',
                      style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w600,
                          color: Colors.deepPurple),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// TODO Implement this library.