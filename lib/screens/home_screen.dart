import 'package:cours_gl_g2_2025/model/Menu.dart';
import 'package:cours_gl_g2_2025/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../model/transaction.dart';
import '../utils/image_constant.dart';

import 'search_screen.dart'; // import de la page de recherche

class HomeScreen extends StatefulWidget {  // page d'accueil de l'application
  const HomeScreen({super.key}); // constructeur de la classe HomeScreen

  @override // création de l'état de la page HomeScreen
  State<HomeScreen> createState() => _HomeScreenState(); // création de l'état de la page HomeScreen
} // classe qui gère l'état de la page HomeScreen de l'application et qui contient la logique de l'affichage de la page HomeScreen

class _HomeScreenState extends State<HomeScreen> {  // classe qui gère l'état de la page HomeScreen de l'application et qui contient la logique de l'affichage de la page HomeScreen
  bool isVisible = false;  // variable qui gère la visibilité du solde de l'utilisateur

  void isShow() {  // fonction qui gère la visibilité du solde de l'utilisateur
    setState(() {  // fonction qui gère la visibilité du solde de l'utilisateur
      isVisible = !isVisible; // inverse la valeur de la variable isVisible pour afficher ou masquer le solde de l'utilisateur
    });
  }

  @override  // fonction qui gère l'affichage de la page HomeScreen de l'application
  Widget build(BuildContext context) { // construction de l'interface utilisateur de la page HomeScreen de l'application
    return Scaffold(  // widget qui gère la structure de base de la page HomeScreen de l'application
      body: CustomScrollView(  // widget qui gère le défilement de la page HomeScreen de l'application
        slivers: [  // liste de widgets qui gèrent le défilement de la page HomeScreen de l'application
          /// APP BAR violet
          SliverAppBar(  // widget qui gère la barre d'application de la page HomeScreen de l'application
            pinned: true, // la barre d'application reste visible même lorsque l'utilisateur fait défiler la page HomeScreen de l'application
            expandedHeight: 90,  // hauteur de la barre d'application de la page HomeScreen de l'application
            backgroundColor: Colors.deepPurple, // couleur de fond de la barre d'application de la page HomeScreen de l'application
            leading: IconButton( // champ qui gère l'icône de la barre d'application de la page HomeScreen de l'application et qui permet d'accéder aux paramètres de l'application
              onPressed: () {}, // fonction qui gère l'action de l'icône de la barre d'application de la page HomeScreen de l'application
              icon: const Icon(Icons.settings, color: Colors.white),  // icône de la barre d'application de la page HomeScreen de l'application et couleur de l'icône de la barre d'application de la page HomeScreen de l'application
            ),
            flexibleSpace: FlexibleSpaceBar(// widget qui gère l'espace flexible de la barre d'application de la page HomeScreen de l'application
              centerTitle: true,  // centre le titre de la barre d'application de la page HomeScreen de l'application
              title: InkWell( // widget qui gère l'interaction de l'utilisateur avec le titre de la barre d'application de la page HomeScreen de l'application et qui permet d'afficher ou de masquer le solde de l'utilisateur
                onTap: isShow, // fonction qui gère l'action de l'utilisateur avec le titre de la barre d'application de la page HomeScreen de l'application et qui permet d'afficher ou de masquer le solde de l'utilisateur
                child: Row( // widget qui gère l'affichage du solde de l'utilisateur et de l'icône de visibilité dans la barre d'application de la page HomeScreen de l'application
                  mainAxisSize: MainAxisSize.min, // la taille de la ligne est définie par le contenu de la ligne
                  children: [ // liste de widgets qui gèrent l'affichage du solde de l'utilisateur et de l'icône de visibilité dans la barre d'application de la page HomeScreen de l'application
                    RichText( // widget qui gère l'affichage du solde de l'utilisateur dans la barre d'application de la page HomeScreen de l'application
                      text: TextSpan( // widget qui gère l'affichage du solde de l'utilisateur dans la barre d'application de la page HomeScreen de l'application
                        text: isVisible ? "10.000" : "••••••", // affiche le solde de l'utilisateur si la variable isVisible est vraie, sinon affiche des points pour masquer le solde de l'utilisateur
                        style: GoogleFonts.dmSans( // widget qui gère le style du texte du solde de l'utilisateur dans la barre d'application de la page HomeScreen de l'application
                          color: Colors.white, // couleur du texte du solde de l'utilisateur dans la barre d'application de la page HomeScreen de l'application
                          fontSize: 26,  // taille du texte du solde de l'utilisateur dans la barre d'application de la page HomeScreen de l'application et poids du texte du solde de l'utilisateur dans la barre d'application de la page HomeScreen de l'application
                          //un container est un widjet qui contient des element et qui permet de les organiser et de les styliser
                          fontWeight: FontWeight.w600,  // poids du texte du solde de l'utilisateur dans la barre d'application de la page HomeScreen de l'application
                        ),
                        children: [  // liste de widgets qui gèrent l'affichage du solde de l'utilisateur et de l'icône de visibilité dans la barre d'application de la page HomeScreen de l'application
                          TextSpan( // widget qui gère l'affichage de la lettre "F" à côté du solde de l'utilisateur dans la barre d'application de la page HomeScreen de l'application
                            text: isVisible ? "F" : "",// affiche la lettre "F" à côté du solde de l'utilisateur si la variable isVisible est vraie, sinon n'affiche rien
                            style: GoogleFonts.dmSans( // widget qui gère le style du texte de la lettre "F" à côté du solde de l'utilisateur dans la barre d'application de la page HomeScreen de l'application
                              color: Colors.white,
                              fontSize: 18, // taille du texte de la lettre "F" à côté du solde de l'utilisateur dans la barre d'application de la page HomeScreen de l'application
                              fontWeight: FontWeight.w600, // poids du texte de la lettre "F" à côté du solde de l'utilisateur dans la barre d'application de la page HomeScreen de l'application
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 10), // espace entre le solde de l'utilisateur et l'icône de visibilité dans la barre d'application de la page HomeScreen de l'application
                    Icon( // widget qui gère l'affichage de l'icône de visibilité dans la barre d'application de la page HomeScreen de l'application
                      isVisible ? Icons.visibility_off : Icons.visibility, // affiche l'icône de visibilité si la variable isVisible est fausse, sinon affiche l'icône de visibilité désactivée dans la barre d'application de la page HomeScreen de l'application
                      color: Colors.white, // couleur de l'icône de visibilité dans la barre d'application de la page HomeScreen de l'application
                    )
                  ],
                ),
              ),
            ),
          ),

          /// BODY  qui contient le QR code, les menus, les transactions et la barre de recherche
          SliverToBoxAdapter( // widget qui gère l'affichage du corps de la page HomeScreen de l'application et qui permet d'afficher le QR code, les menus, les transactions et la barre de recherche
            child: Container( // widget qui gère l'affichage du corps de la page HomeScreen de l'application et qui permet d'afficher le QR code, les menus, les transactions et la barre de recherche
              height: 2000,  // hauteur du corps de la page HomeScreen de l'application pour permettre le défilement de la page HomeScreen de l'application
              color: Colors.deepPurple, // couleur de fond du corps de la page HomeScreen de l'application
              child: Stack( // widget qui gère l'affichage du corps de la page HomeScreen de l'application et qui permet d'afficher le QR code, les menus, les transactions et la barre de recherche
                children: [ // liste de widgets qui gèrent l'affichage du corps de la page HomeScreen de l'application et qui permettent d'afficher le QR code, les menus, les transactions et la barre de recherche
                  /// fond blanc arrondi
                  Container( // widget qui gère l'affichage du fond blanc arrondi du corps de la page HomeScreen de l'application
                    margin: const EdgeInsets.only(top: 80), // marge pour laisser de l'espace entre la barre d'application et le corps de la page HomeScreen de l'application
                    decoration: const BoxDecoration( // widget qui gère l'affichage du fond blanc arrondi du corps de la page HomeScreen de l'application
                      color: Colors.white, // couleur de fond du corps de la page HomeScreen de l'application
                      borderRadius: BorderRadius.only( // widget qui gère l'arrondi des coins du fond blanc du corps de la page HomeScreen de l'application
                        topLeft: Radius.circular(25), // arrondi du coin supérieur gauche du fond blanc du corps de la page HomeScreen de l'application
                        topRight: Radius.circular(25), // arrondi du coin supérieur droit du fond blanc du corps de la page HomeScreen de l'application
                      ),
                    ),
                  ),

                  Center(
                    child: Column(
                      children: [
                        /// ================= QR CODE =================
                        Container( // widget qui gère l'affichage du QR code dans le corps de la page HomeScreen de l'application
                          height: 200,
                          width: 350,
                          decoration: BoxDecoration( // widget qui gère le style du conteneur du QR code dans le corps de la page HomeScreen de l'application
                            borderRadius: BorderRadius.circular(20), // arrondi des coins du conteneur du QR code dans le corps de la page HomeScreen de l'application
                            gradient: const LinearGradient( // widget qui gère le dégradé de couleur du conteneur du QR code dans le corps de la page HomeScreen de l'application
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
                              Center( // widget qui gère l'affichage du QR code dans le corps de la page HomeScreen de l'application
                                child: Container( // widget qui gère l'affichage du conteneur du QR code dans le corps de la page HomeScreen de l'application
                                  height: 165,
                                  width: 165,
                                  padding: const EdgeInsets.all(10), // padding pour espacer le QR code du bord du conteneur du QR code dans le corps de la page HomeScreen de l'application
                                  decoration: BoxDecoration( // widget qui gère le style du conteneur du QR code dans le corps de la page HomeScreen de l'application
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(18),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.15),
                                        blurRadius: 10,
                                      )
                                    ],
                                  ),
                                  child: Column( // widget qui gère l'affichage du QR code et du texte "Scanner" dans le corps de la page HomeScreen de l'application
                                    children: [ // liste de widgets qui gèrent l'affichage du QR code et du texte "Scanner" dans le corps de la page HomeScreen de l'application
                                      Expanded( // widget qui gère l'affichage du QR code dans le corps de la page HomeScreen de l'application et qui permet d'afficher le QR code dans le conteneur du QR code dans le corps de la page HomeScreen de l'application
                                        child: PrettyQrView.data(
                                          data: 'lorem ipsum dolor sit amet',// widget qui gère l'affichage du QR code dans le corps de la page HomeScreen de l'application
                                        ),
                                      ),
                                      const SizedBox(height: 4), // espace entre le QR code et le texte "Scanner" dans le corps de la page HomeScreen de l'application
                                      const Row( // widget qui gère l'affichage du texte "Scanner" et de l'icône de la caméra dans le corps de la page HomeScreen de l'application
                                        mainAxisSize: MainAxisSize.min, // la taille de la ligne est définie par le contenu de la ligne ET le texte "Scanner" et l'icône de la caméra sont centrés dans la ligne
                                        children: [ // liste de widgets qui gèrent l'affichage du texte "Scanner" et de l'icône de la caméra dans le corps de la page HomeScreen de l'application
                                          Icon(Icons.camera_alt, size: 18),  // widget qui gère l'affichage de l'icône de la caméra dans le corps de la page HomeScreen de l'application
                                          SizedBox(width: 5), // espace entre l'icône de la caméra et le texte "Scanner" dans le corps de la page HomeScreen de l'application
                                          Text( // widget qui gère l'affichage du texte "Scanner" dans le corps de la page HomeScreen de l'application
                                            "Scanner",
                                            style: TextStyle(fontSize: 13), // style du texte "Scanner" dans le corps de la page HomeScreen de l'application
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned( // widget qui gère l'affichage du logo dans le coin inférieur droit du conteneur du QR code dans le corps de la page HomeScreen de l'application
                                bottom: 8, // position du logo par rapport au bas du conteneur du QR code dans le corps de la page HomeScreen de l'application
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
                        GridView.builder( // widget qui gère l'affichage du menu dans le corps de la page HomeScreen de l'application
                          shrinkWrap: true, // widget qui gère l'affichage du menu dans le corps de la page HomeScreen de l'application et qui permet d'afficher les éléments du menu dans une grille
                          physics: const NeverScrollableScrollPhysics(), // empêche la grille du menu de défiler indépendamment du reste de la page HomeScreen de l'application
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount( // widget qui gère l'affichage du menu dans le corps de la page HomeScreen de l'application et qui permet d'afficher les éléments du menu dans une grille avec un nombre fixe de colonnes
                            crossAxisCount: 4, // nombre de colonnes dans la grille du menu dans le corps de la page HomeScreen de l'application
                          ),
                          itemCount: Menu.list.length, // nombre d'éléments dans le menu à afficher dans le corps de la page HomeScreen de l'application
                          itemBuilder: (context, index) { // widget qui gère l'affichage de chaque élément du menu dans le corps de la page HomeScreen de l'application
                            final m = Menu.list[index]; // widget qui gère l'affichage de chaque élément du menu dans le corps de la page HomeScreen de l'application et qui permet d'accéder aux propriétés de chaque élément du menu dans le corps de la page HomeScreen de l'application
                            return MenuWidget( // widget qui gère l'affichage de chaque élément du menu dans le corps de la page HomeScreen de l'application
                              iconData: m.iconData, // widget qui gère l'affichage de l'icône de chaque élément du menu dans le corps de la page HomeScreen de l'application
                              color: m.color, // widget qui gère l'affichage de la couleur de chaque élément du menu dans le corps de la page HomeScreen de l'application
                              title: m.title, // widget qui gère l'affichage du titre de chaque élément du menu dans le corps de la page HomeScreen de l'application
                            );
                          },
                        ),

                        /// ================= TRANSACTIONS =================
                        ListView.builder( // widget qui gère l'affichage de la liste des transactions dans le corps de la page HomeScreen de l'application
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(), // empêche la liste des transactions de défiler indépendamment du reste de la page HomeScreen de l'application
                          padding: EdgeInsets.zero,
                          itemCount: Transaction.transactionList.length > 10 // limite le nombre de transactions affichées à 10 pour éviter d'avoir une liste trop longue dans le corps de la page HomeScreen de l'application
                              ? 10
                              : Transaction.transactionList.length, // nombre de transactions à afficher dans le corps de la page HomeScreen de l'application
                          itemBuilder: (context, index) { // widget qui gère l'affichage de chaque transaction dans la liste des transactions dans le corps de la page HomeScreen de l'application
                            final t = Transaction.transactionList[index]; // widget qui gère l'affichage de chaque transaction dans la liste des transactions dans le corps de la page HomeScreen de l'application
                            return Container(  // widget qui gère l'affichage de chaque transaction dans la liste des transactions dans le corps de la page HomeScreen de l'application
                              padding: const EdgeInsets.all(8),  // padding pour espacer les éléments de chaque transaction dans la liste des transactions dans le corps de la page HomeScreen de l'application
                              child: Column(  // widget qui gère l'affichage de chaque transaction dans la liste des transactions dans le corps de la page HomeScreen de l'application et qui permet d'afficher le titre, le montant et la date de chaque transaction dans la liste des transactions dans le corps de la page HomeScreen de l'application
                                crossAxisAlignment: CrossAxisAlignment.start, // aligne les éléments de chaque transaction à gauche dans la liste des transactions dans le corps de la page HomeScreen de l'application
                                children: [ // liste de widgets qui gèrent l'affichage du titre, du montant et de la date de chaque transaction dans la liste des transactions dans le corps de la page HomeScreen de l'application
                                  Row( // widget qui gère l'affichage du titre et du montant de chaque transaction dans la liste des transactions dans le corps de la page HomeScreen de l'application
                                    mainAxisAlignment: // espace entre le titre et le montant de chaque transaction dans la liste des transactions dans le corps de la page HomeScreen de l'application
                                    MainAxisAlignment.spaceBetween, // espace entre le titre et le montant de chaque transaction dans la liste des transactions dans le corps de la page HomeScreen de l'application
                                    children: [ // liste de widgets qui gèrent l'affichage du titre et du montant de chaque transaction dans la liste des transactions dans le corps de la page HomeScreen de l'application
                                      Text( // widget qui gère l'affichage du texte du titre de la transaction dans la page HomeScreen de l'application
                                        t.title, // widget qui gère l'affichage du texte du titre de la transaction dans la page HomeScreen de l'application
                                        style: GoogleFonts.dmSans( // widget qui gère le style du texte du titre de la transaction dans la page HomeScreen de l'application
                                            color: Colors.deepPurple, // style du texte du titre de la transaction dans la page HomeScreen de l'application
                                            fontWeight: FontWeight.w600, // style du texte du titre de la transaction dans la page HomeScreen de l'application
                                            fontSize: 16), // style du texte du titre de la transaction dans la page HomeScreen de l'application
                                      ),
                                      Text(
                                        '-${t.amount} F', // widget qui gère l'affichage du texte du montant de la transaction dans la page HomeScreen de l'application
                                        style: GoogleFonts.dmSans(
                                            color: Colors.deepPurple, // style du texte du montant de la transaction dans la page HomeScreen de l'application
                                            fontWeight: FontWeight.w600,// style du texte du montant de la transaction dans la page HomeScreen de l'application
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 5), // espace entre le titre de la transaction et la date de la transaction dans la page HomeScreen de l'application
                                  Text(
                                    t.date.toString(), // widget qui gère l'affichage du texte de la date de la transaction dans la page HomeScreen de l'application
                                    style: GoogleFonts.dmSans( // widget qui gère le style du texte de la date de la transaction dans la page HomeScreen de l'application
                                        color: Colors.grey, fontSize: 12), // style du texte de la date de la transaction dans la page HomeScreen de l'application
                                  ),
                                ],
                              ),
                            );
                          },
                        ),

                        /// ================= RECHERCHE ================= // POUR LA BARRE DE RECHERCHE, ON UTILISE UN INKWELL QUI PERMET DE DETECTER LE TAP DE L'UTILISATEUR SUR LA BARRE DE RECHERCHE ET QUI PERMET D'ACCEDER A LA PAGE DE RECHERCHE DE L'APPLICATION
                        Padding( // widget qui gère l'affichage de la barre de recherche de la page HomeScreen de l'application et qui permet d'accéder à la page de recherche de l'application
                          padding: const EdgeInsets.symmetric(vertical: 20), // marge verticale pour espacer la barre de recherche des autres éléments de la page HomeScreen de l'application
                          child: InkWell( // widget qui gère l'interaction de l'utilisateur avec la barre de recherche de la page HomeScreen de l'application et qui permet d'accéder à la page de recherche de l'application
                            onTap: () {
                              Navigator.push( // fonction qui gère la navigation de l'utilisateur vers la page de recherche de l'application
                                context, // contexte de la page HomeScreen de l'application
                                MaterialPageRoute( // widget qui gère la navigation de l'utilisateur vers la page de recherche de l'application
                                    builder: (context) => // widget qui gère la navigation de l'utilisateur vers la page de recherche de l'application
                                    const SearchScreen()),
                              );
                            },
                            child: Container( // widget qui gère l'affichage de la barre de recherche de la page HomeScreen de l'application et qui permet d'accéder à la page de recherche de l'application
                              width: 230, // largeur de la barre de recherche de la page HomeScreen de l'application
                              height: 40, //
                              decoration: BoxDecoration( // widget qui gère le style de la barre de recherche de la page HomeScreen de l'application
                                color: Colors.grey.shade200, // couleur de fond de la barre de recherche de la page HomeScreen de l'application
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Row(
                                children: const [
                                  SizedBox(width: 10),
                                  Icon(Icons.search, color: Colors.grey),//  widget qui gère l'affichage de l'icône de recherche dans la barre de recherche de la page HomeScreen de l'application
                                  SizedBox(width: 5), // espace entre l'icône de recherche et le texte de la barre de recherche de la page HomeScreen de l'application
                                  Text( // widget qui gère l'affichage du texte de la barre de recherche de la page HomeScreen de l'application
                                    "Rechercher",  // texte de la barre de recherche de la page HomeScreen de l'application
                                    style: TextStyle( // style du texte de la barre de recherche de la page HomeScreen de l'application
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
