import 'package:flutter/material.dart';

void main() {
  runApp(const DikoGNApp());
}

class DikoGNApp extends StatelessWidget {
  const DikoGNApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diko GN',
      theme: ThemeData(
        primaryColor: const Color(0xFF1F8F4E),
        scaffoldBackgroundColor: const Color(0xFFF3F3F3),
      ),
      home: const AuthScreen(), 
      debugShowCheckedModeBanner: false,
    );
  }
}

// ---- ÉCRAN 1 : ACCUEIL ET NAVIGATION PRINCIPALE ----
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ChatScreen(),
    const VendeurDashboardScreen(),
    const PaymentScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F8F4E),
        title: const Column(
          children: [
            Text('Diko GN', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            Text('Le marché à portée de main', style: TextStyle(fontSize: 11, color: Colors.white70)),
          ],
        ),
        centerTitle: true,
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF1F8F4E),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.storefront), label: 'Boutique'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.business_center_outlined), label: 'Vendeur'),
          BottomNavigationBarItem(icon: Icon(Icons.payment_outlined), label: 'Caisse'),
        ],
      ),
    );
  }
}

// ---- ÉCRAN 2 : AUTHENTIFICATION (CONNEXION) ----
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Diko GN', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF1F8F4E))),
                  const SizedBox(height: 24),
                  const TextField(decoration: InputDecoration(labelText: 'Adresse e-mail', border: OutlineInputBorder())),
                  const SizedBox(height: 16),
                  const TextField(obscureText: true, decoration: InputDecoration(labelText: 'Mot de passe', border: OutlineInputBorder())),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1F8F4E), minimumSize: const Size.fromHeight(50)),
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainNavigation()));
                    },
                    child: const Text('Se connecter', style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ---- ÉCRAN 3 : BOUTIQUE ----
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  final List<Map<String, dynamic>> produits = const [
    {'nom': '📱 Smartphone Premium', 'prix': '299 €'},
    {'nom': '👟 Chaussures Sport', 'prix': '49 €'},
    {'nom': '💻 Ordinateur portable', 'prix': '550 €'},
    {'nom': '👶 Produits Bébé', 'prix': '19 €'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF1F8F4E), Color(0xFF2EAF65)]),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(child: Text('PROMO : -30% sur l\'électronique !', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8, crossAxisSpacing: 12, mainAxisSpacing: 12),
              itemCount: produits.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Expanded(child: Container(color: Colors.grey[200], child: const Center(child: Icon(Icons.image, color: Colors.grey)))),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(produits[index]['nom'], style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 1),
                            Text(produits[index]['prix'], style: const TextStyle(color: Color(0xFF1F8F4E))),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ---- ÉCRAN 4 : MESSAGERIE ----
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Aucune discussion en cours')));
  }
}

// ---- ÉCRAN 5 : DASHBOARD VENDEUR ----
class VendeurDashboardScreen extends StatelessWidget {
  const VendeurDashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Card(color: Color(0xFF1F8F4E), child: ListTile(title: Text('Revenus totaux', style: TextStyle(color: Colors.white70)), trailing: Text('6 338 €', style: TextStyle(color: Colors.white, fontSize: 20)))),
            const SizedBox(height: 16),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1F8F4E)), onPressed: () {}, child: const Text('Ajouter un produit', style: TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }
}

// ---- ÉCRAN 6 : CAISSE ----
class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(child: ListTile(leading: Icon(Icons.phone_android, color: Colors.orange), title: Text('Orange Money'))),
          Card(child: ListTile(leading: Icon(Icons.waves, color: Colors.blue), title: Text('Wave'))),
          Card(child: ListTile(leading: Icon(Icons.star, color: Colors.yellow), title: Text('MTN MoMo'))),
        ],
      ),
    );
  }
}
