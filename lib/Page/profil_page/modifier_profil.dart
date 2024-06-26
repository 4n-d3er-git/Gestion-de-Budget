import 'package:budget_odc/theme/couleur.dart';
import 'package:budget_odc/widgets/chargement.dart';
import 'package:budget_odc/widgets/message.dart';
import 'package:budget_odc/widgets/textfield_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ModifierProfilPage extends StatefulWidget {
  const ModifierProfilPage({super.key});

  @override
  State<ModifierProfilPage> createState() => _ModifierProfilPageState();
}

class _ModifierProfilPageState extends State<ModifierProfilPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  TextEditingController _nomCompletController = TextEditingController();
  TextEditingController _telephoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool chargement = false;
  String? emailUtilisateur = FirebaseAuth.instance.currentUser!.email;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
Future<void> modifierProfil() async {
  setState(() {
    chargement = true;
  });
  try{
    User? utilisateur = _auth.currentUser;
  if(utilisateur!=null){
    await _firestore.collection('users').doc(utilisateur.uid).update(
     { 'nomComplet': _nomCompletController.text.trim(),
      'telephone': _telephoneController.text.trim(),}
    );
  }
setState(() {
  chargement = false;
  montrerSnackBar('Profil modifié avec succès', context);
  _nomCompletController.clear();
  _telephoneController.clear();
});
  } catch (e){
    setState(() {
      chargement = false;
    });
    montrerErreurSnackBar("Une erreur s'est produite, veuillez réessayer.", context);

  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blancBackground,
        appBar: AppBar(
          title: Text(
            "Modifier le Profil",
            style: TextStyle(color: noir, fontSize: 20),
          ),
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance
                .collection('users')
                .where('email', isEqualTo: emailUtilisateur)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Erreur : ${snapshot.error}");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: vert,
                  ),
                );
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Text("Aucun donnée trouvée");
              }
              final userData = snapshot.data!.docs;

              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: userData.length,
                  itemBuilder: (context, index) {
                    final userDataFields = userData[index];

                    final nomComplet =
                        userDataFields['nomComplet'] as String? ?? '';
                    final email = userDataFields['email'] as String? ?? '';
                    final telephone =
                        userDataFields['telephone'] as String? ?? '';

                    return Padding(
                      padding: EdgeInsets.only(top: 30, left: 8, right: 8),
                      child: Column(
                        children: [
                          Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  TextFiedWiget(
                                    labelText: 'Nom Complet',
                                    hintTexte: nomComplet,
                                    controlleur: _nomCompletController,
                                    validateur: (valeur) {
                                      if (valeur == null || valeur.isEmpty) {
                                        return 'Veuillez entrer votre nom complet';
                                      }
                                      return null;
                                    },
                                    mdp: false,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFiedWiget(
                                    labelText: 'Numero de Telephone',
                                    hintTexte: telephone,
                                    controlleur: _telephoneController,
                                    validateur: (valeur) {
                                      if (valeur == null || valeur.isEmpty) {
                                        return 'Veuillez entrer votre numero de telephone';
                                      }
                                      return null;
                                    },
                                    mdp: false,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  chargement
                                      ? ChargementWidget()
                                      : MaterialButton(
                                          height: 50,
                                          minWidth: 250,
                                          color: vert,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          onPressed: () {
                                            if (formKey.currentState!
                                                .validate()) {}
                                          },
                                          child: Text(
                                            "Modifier",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          )),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              )),
                          //
                        ],
                      ),
                    );
                   
                  });
            }));
  }
}
