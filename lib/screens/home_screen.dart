import 'package:cours_gl_g2_2025/model/Menu.dart';
import 'package:cours_gl_g2_2025/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../model/transaction.dart';
import '../utils/image_constant.dart';

import 'search_screen.dart'; // import de la page de recherche

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isVisible = false;

  void isShow() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          /// APP BAR violet
          SliverAppBar(
            pinned: true,
            expandedHeight: 90,
            backgroundColor: Colors.deepPurple,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings, color: Colors.white),
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: InkWell(
                onTap: isShow,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: isVisible ? "10.000" : "••••••",
                        style: GoogleFonts.dmSans(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: isVisible ? "F" : "",
                            style: GoogleFonts.dmSans(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Icon(
                      isVisible ? Icons.visibility_off : Icons.visibility,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),

          /// BODY
          SliverToBoxAdapter(
            child: Container(
              height: 2000,
              color: Colors.deepPurple,
              child: Stack(
                children: [
                  /// fond blanc arrondi
                  Container(
                    margin: const EdgeInsets.only(top: 80),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                  ),

                  Center(
                    child: Column(
                      children: [
                        /// ================= QR CODE =================
                        Container(
                          height: 200,
                          width: 350,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                              colors: [Color(0xFF2BC0E4), Color(0xFF1DA1F2)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Opacity(
                                  opacity: 0.08,
                                  child: Image.asset(
                                    ImageConstant.imgBg,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  height: 165,
                                  width: 165,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(18),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.15),
                                        blurRadius: 10,
                                      )
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: PrettyQrView.data(
                                          data: 'lorem ipsum dolor sit amet',
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      const Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.camera_alt, size: 18),
                                          SizedBox(width: 5),
                                          Text(
                                            "Scanner",
                                            style: TextStyle(fontSize: 13),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                right: 10,
                                child: Image.asset(
                                  ImageConstant.imgLogo,
                                  width: 55,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),
                        Divider(
                          thickness: 5,
                          color: Colors.grey.withOpacity(0.2),
                        ),

                        /// ================= MENU =================
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                          ),
                          itemCount: Menu.list.length,
                          itemBuilder: (context, index) {
                            final m = Menu.list[index];
                            return MenuWidget(
                              iconData: m.iconData,
                              color: m.color,
                              title: m.title,
                            );
                          },
                        ),

                        /// ================= TRANSACTIONS =================
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: Transaction.transactionList.length > 10
                              ? 10
                              : Transaction.transactionList.length,
                          itemBuilder: (context, index) {
                            final t = Transaction.transactionList[index];
                            return Container(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        t.title,
                                        style: GoogleFonts.dmSans(
                                            color: Colors.deepPurple,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        '-${t.amount} F',
                                        style: GoogleFonts.dmSans(
                                            color: Colors.deepPurple,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    t.date.toString(),
                                    style: GoogleFonts.dmSans(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),

                        /// ================= RECHERCHE =================
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const SearchScreen()),
                              );
                            },
                            child: Container(
                              width: 230,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Row(
                                children: const [
                                  SizedBox(width: 10),
                                  Icon(Icons.search, color: Colors.grey),
                                  SizedBox(width: 5),
                                  Text(
                                    "Rechercher",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
