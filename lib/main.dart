import 'package:flutter/material.dart';

void main() {
  runApp(SkincareApp());
}

class SkincareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skincare Management',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Color(0xFFFFF0F5),
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/home': (context) => HomeScreen(),
        '/addProduct': (context) => AddProductScreen(),
        '/notification': (context) => NotificationScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF0F5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(60),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 255, 204, 230).withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Icon(
                Icons.face_retouching_natural,
                size: 60,
                color: Color.fromARGB(255, 255, 204, 230),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'SkinCare Store Manager',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Kelola stok dan data produk skincare toko Anda',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 40),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 255, 204, 230)),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF0F5),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.face_retouching_natural,
                      size: 50,
                      color: Color.fromARGB(255, 255, 204, 230),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Masuk ke akun Anda',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email tidak boleh kosong';
                      }
                      if (!value.contains('@')) {
                        return 'Format email tidak valid';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.black87),
                      hintText: 'Masukkan email',
                      prefixIcon: Icon(Icons.email_outlined, color: Color.fromARGB(255, 255, 204, 230)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color.fromARGB(255, 255, 204, 230)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color.fromARGB(255, 255, 204, 230)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color.fromARGB(255, 255, 204, 230), width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      if (value.length < 6) {
                        return 'Password minimal 6 karakter';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.black87),
                      hintText: 'Masukkan password',
                      prefixIcon: Icon(Icons.lock_outline, color: Color.fromARGB(255, 255, 204, 230)),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                          color: Color.fromARGB(255, 255, 204, 230),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color.fromARGB(255, 255, 204, 230)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color.fromARGB(255, 255, 204, 230)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color.fromARGB(255, 255, 204, 230), width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Fitur reset password belum tersedia')),
                        );
                      },
                      child: Text(
                        'Lupa Password?',
                        style: TextStyle(color: Color.fromARGB(255, 255, 204, 230)),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacementNamed(context, '/onboarding');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 204, 230),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Belum punya akun? ',
                        style: TextStyle(color: Colors.black87),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Text(
                          'Daftar',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 204, 230),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreeToTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF0F5),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.person_add_outlined,
                      size: 50,
                      color: Color.fromARGB(255, 255, 204, 230),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Buat akun baru',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Nama Lengkap',
                      labelStyle: TextStyle(color: Colors.black87),
                      hintText: 'Masukkan nama lengkap',
                      prefixIcon: Icon(Icons.person_outline, color: Color.fromARGB(255, 255, 204, 230)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color.fromARGB(255, 255, 204, 230)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color.fromARGB(255, 255, 204, 230)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color.fromARGB(255, 255, 204, 230), width: 2),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email tidak boleh kosong';
                      }
                      if (!value.contains('@')) {
                        return 'Format email tidak valid';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.black87),
                      hintText: 'Masukkan email',
                      prefixIcon: Icon(Icons.email_outlined, color: Color.fromARGB(255, 255, 204, 230)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color.fromARGB(255, 255, 204, 230)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color.fromARGB(255, 255, 204, 230)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color.fromARGB(255, 255, 204, 230), width: 2),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      if (value.length < 6) {
                        return 'Password minimal 6 karakter';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.black87),
                      hintText: 'Masukkan password',
                      prefixIcon: Icon(Icons.lock_outline, color: Color.fromARGB(255, 255, 204, 230)),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                          color: Color.fromARGB(255, 255, 204, 230),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color.fromARGB(255, 255, 204, 230)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color.fromARGB(255, 255, 204, 230)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color.fromARGB(255, 255, 204, 230), width: 2),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: _obscureConfirmPassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Konfirmasi password tidak boleh kosong';
                      }
                      if (value != _passwordController.text) {
                        return 'Password tidak cocok';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Konfirmasi Password',
                      labelStyle: TextStyle(color: Colors.black87),
                      hintText: 'Masukkan ulang password',
                      prefixIcon: Icon(Icons.lock_outline, color: Color.fromARGB(255, 255, 204, 230)),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                          color: Color.fromARGB(255, 255, 204, 230),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color.fromARGB(255, 255, 204, 230)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color.fromARGB(255, 255, 204, 230)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color.fromARGB(255, 255, 204, 230), width: 2),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  CheckboxListTile(
                    title: Text(
                      'Saya setuju dengan syarat dan ketentuan',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    value: _agreeToTerms,
                    activeColor: Color.fromARGB(255, 255, 204, 230),
                    onChanged: (bool? value) {
                      setState(() {
                        _agreeToTerms = value ?? false;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (!_agreeToTerms) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Anda harus menyetujui syarat dan ketentuan')),
                            );
                            return;
                          }
                          Navigator.pushReplacementNamed(context, '/onboarding');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 204, 230),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Daftar',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah punya akun? ',
                        style: TextStyle(color: Colors.black87),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 204, 230),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int currentPage = 0;

  List<OnboardingContent> onboardingData = [
    OnboardingContent(
      title: "Kelola Stok Produk",
      description: "Pantau dan kelola stok barang skincare di toko Anda dengan mudah dan efisien",
      icon: Icons.inventory_2,
    ),
    OnboardingContent(
      title: "Kategorikan Berdasarkan Tipe",
      description: "Organisir produk berdasarkan kategori untuk kemudahan pencarian",
      icon: Icons.category,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFFF0F5), Colors.white],
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 60),
              Expanded(
                flex: 3,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemCount: onboardingData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(75),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 255, 204, 230).withOpacity(0.3),
                                  spreadRadius: 3,
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                            child: Icon(
                              onboardingData[index].icon,
                              size: 80,
                              color: Color.fromARGB(255, 255, 204, 230),
                            ),
                          ),
                          SizedBox(height: 40),
                          Text(
                            onboardingData[index].title,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                          Text(
                            onboardingData[index].description,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardingData.length,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    width: currentPage == index ? 20 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: currentPage == index ? Color.fromARGB(255, 255, 204, 230) : Color(0xFFFFF0F5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (currentPage > 0)
                      TextButton(
                        onPressed: () {
                          _pageController.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Text(
                          'Previous',
                          style: TextStyle(color: Color.fromARGB(255, 255, 204, 230)),
                        ),
                      )
                    else
                      SizedBox(width: 60),
                    if (currentPage < onboardingData.length - 1)
                      ElevatedButton(
                        onPressed: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 255, 204, 230),
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Text(
                          'Next',
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    else
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 255, 204, 230),
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Text(
                          'Get Started',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}

class OnboardingContent {
  String title;
  String description;
  IconData icon;

  OnboardingContent({
    required this.title,
    required this.description,
    required this.icon,
  });
}

class SkincareProduct {
  String name;
  String skinType;
  double price;
  String category;
  int stock;

  SkincareProduct({
    required this.name,
    required this.skinType,
    required this.price,
    required this.category,
    required this.stock,
  });
}

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifikasi", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Center(
        child: Text(
          "Belum ada notifikasi.",
          style: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool _isGridView = false;

  Widget _buildCurrentScreen() {
    switch (_currentIndex) {
      case 0:
        return _buildHomeContent();
      case 1:
        return _buildStokContent();
      case 2:
        return _buildProfileContent();
      default:
        return _buildHomeContent();
    }
  }

  List<SkincareProduct> products = [
    SkincareProduct(
      name: "Cetaphil Gentle Cleanser",
      skinType: "Sensitive",
      price: 85000,
      category: "Cleanser",
      stock: 10,
    ),
    SkincareProduct(
      name: "The Ordinary Niacinamide",
      skinType: "Oily",
      price: 95000,
      category: "Serum",
      stock: 15,
    ),
    SkincareProduct(
      name: "Wardah Nature Daily",
      skinType: "Normal",
      price: 45000,
      category: "Moisturizer",
      stock: 23,
    ),
    SkincareProduct(
      name: "Sunplay SPF 50",
      skinType: "All Types",
      price: 75000,
      category: "Sunscreen",
      stock: 20,
    ),
    SkincareProduct(
      name: "Pigeon Baby Oil",
      skinType: "Dry",
      price: 25000,
      category: "Oil",
      stock: 10,
    ),
    SkincareProduct(
      name: "Garnier Micellar Water",
      skinType: "All Types",
      price: 35000,
      category: "Cleanser",
      stock: 28,
    ),
  ];

  String selectedCategory = "All";
  List<String> categories = ["All", "Cleanser", "Serum", "Moisturizer", "Sunscreen", "Oil"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF0F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _getAppBarSubtitle(),
              style: TextStyle(
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              _getAppBarTitle(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          if (_currentIndex == 0)
            IconButton(
              icon: Icon(
                _isGridView ? Icons.list : Icons.grid_view,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  _isGridView = !_isGridView;
                });
              },
            ),
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications_outlined, color: Colors.black),
                onPressed: () {
                  Navigator.pushNamed(context, '/notification');
                },
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 204, 230),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Admin Toko"),
              accountEmail: Text("admin@skincare.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40, color: Color.fromARGB(255, 255, 204, 230)),
              ),
              decoration: BoxDecoration(color: Color.fromARGB(255, 255, 204, 230)),
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Color.fromARGB(255, 255, 204, 230)),
              title: Text('Pengaturan'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Fitur pengaturan akan segera hadir')),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: _buildCurrentScreen(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 255, 204, 230).withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 8,
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Color.fromARGB(255, 255, 204, 230),
          unselectedItemColor: Colors.black38,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory_outlined),
              activeIcon: Icon(Icons.inventory),
              label: 'Stok',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton(
              backgroundColor: Color.fromARGB(255, 255, 204, 230),
              onPressed: () {
                Navigator.pushNamed(context, '/addProduct');
              },
              child: Icon(Icons.add, color: Colors.black),
            )
          : null,
    );
  }

  String _getAppBarTitle() {
    switch (_currentIndex) {
      case 0:
        return 'Inventory Toko Skincare';
      case 1:
        return 'Data Stok Produk';
      case 2:
        return 'Profil Pengguna';
      default:
        return 'Inventory Toko Skincare';
    }
  }

  String _getAppBarSubtitle() {
    switch (_currentIndex) {
      case 0:
        return 'Selamat Datang!';
      case 1:
        return 'Kelola Stok';
      case 2:
        return 'Pengaturan Akun';
      default:
        return 'Selamat Datang!';
    }
  }

  Widget _buildHomeContent() {
    List<SkincareProduct> filteredProducts = selectedCategory == "All"
        ? products
        : products.where((p) => p.category == selectedCategory).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 255, 204, 230).withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 4,
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Cari produk di toko...',
              hintStyle: TextStyle(color: Colors.black38),
              prefixIcon: Icon(Icons.search, color: Color.fromARGB(255, 255, 204, 230)),
              border: InputBorder.none,
            ),
            onChanged: (value) {
              // Fungsi search bisa diimplementasikan di sini
            },
          ),
        ),
        Container(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              bool isSelected = selectedCategory == categories[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = categories[index];
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 12),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: isSelected ? Color.fromARGB(255, 255, 204, 230) : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected ? Color.fromARGB(255, 255, 204, 230) : Color(0xFFFFF0F5),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: isSelected ? Colors.black : Colors.black87,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 16),
        Expanded(
          child: _isGridView ? _buildGridView(filteredProducts) : _buildListView(filteredProducts),
        ),
      ],
    );
  }

  Widget _buildListView(List<SkincareProduct> products) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Container(
          margin: EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 255, 204, 230).withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 6,
              ),
            ],
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(0xFFFFF0F5),
              child: Icon(Icons.spa, color: Color.fromARGB(255, 255, 204, 230)),
            ),
            title: Text(
              product.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${product.category} • ${product.skinType}",
                  style: TextStyle(color: Colors.black87),
                ),
                Text(
                  "Rp ${product.price.toStringAsFixed(0)}",
                  style: TextStyle(color: Colors.black87),
                ),
              ],
            ),
            trailing: Text(
              "Stok: ${product.stock}",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildGridView(List<SkincareProduct> products) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 255, 204, 230).withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 6,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xFFFFF0F5),
                child: Icon(Icons.spa, size: 40, color: Color.fromARGB(255, 255, 204, 230)),
              ),
              SizedBox(height: 12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  product.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 4),
              Text(
                product.category,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Rp ${product.price.toStringAsFixed(0)}",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 4),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xFFFFF0F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Stok: ${product.stock}",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStokContent() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: EdgeInsets.only(bottom: 16),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(0xFFFFF0F5),
              child: Icon(Icons.inventory, color: Color.fromARGB(255, 255, 204, 230)),
            ),
            title: Text(
              product.name,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Kategori: ${product.category}", style: TextStyle(color: Colors.black87)),
                Text("Rp ${product.price.toStringAsFixed(0)}", style: TextStyle(color: Colors.black87)),
              ],
            ),
            trailing: Text(
              "Stok: ${product.stock}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildProfileContent() {
    bool _notificationsEnabled = true;

    return StatefulBuilder(
      builder: (context, setStateProfile) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFFFFF0F5),
                child: Icon(Icons.person, size: 50, color: Color.fromARGB(255, 255, 204, 230)),
              ),
              SizedBox(height: 16),
              Text(
                "Nama Pengguna",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "email@contoh.com",
                style: TextStyle(color: Colors.black87),
              ),
              SizedBox(height: 32),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 255, 204, 230).withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SwitchListTile(
                      title: Text('Notifikasi Push', style: TextStyle(color: Colors.black)),
                      subtitle: Text('Aktifkan notifikasi produk', style: TextStyle(color: Colors.black87)),
                      value: _notificationsEnabled,
                      activeColor: Color.fromARGB(255, 255, 204, 230),
                      onChanged: (bool value) {
                        setStateProfile(() {
                          _notificationsEnabled = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Logout'),
                        content: Text('Apakah Anda yakin ingin keluar?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Batal', style: TextStyle(color: Color.fromARGB(255, 255, 204, 230))),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pushReplacementNamed(context, '/login');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            child: Text('Logout', style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 204, 230),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text(
                    "Logout",
                    style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }
}

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _categoryController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();
  
  String? _selectedSkinType = 'Normal';
  List<String> _skinTypes = ['Normal', 'Oily', 'Dry', 'Sensitive', 'All Types'];

  @override
  void dispose() {
    _nameController.dispose();
    _categoryController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Tambah Produk Baru", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama produk tidak boleh kosong';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Nama Produk",
                  labelStyle: TextStyle(color: Colors.black87),
                  hintText: "Masukkan nama produk",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color.fromARGB(255, 255, 204, 230)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color.fromARGB(255, 255, 204, 230), width: 2),
                  ),
                  prefixIcon: Icon(Icons.spa, color: Color.fromARGB(255, 255, 204, 230)),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _categoryController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kategori tidak boleh kosong';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Kategori",
                  labelStyle: TextStyle(color: Colors.black87),
                  hintText: "Contoh: Cleanser, Serum",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color.fromARGB(255, 255, 204, 230)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color.fromARGB(255, 255, 204, 230), width: 2),
                  ),
                  prefixIcon: Icon(Icons.category, color: Color.fromARGB(255, 255, 204, 230)),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Tipe Kulit",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 255, 204, 230)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: _skinTypes.map((skinType) {
                    return RadioListTile<String>(
                      title: Text(skinType, style: TextStyle(color: Colors.black87)),
                      value: skinType,
                      groupValue: _selectedSkinType,
                      activeColor: Color.fromARGB(255, 255, 204, 230),
                      onChanged: (value) {
                        setState(() {
                          _selectedSkinType = value;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _priceController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harga tidak boleh kosong';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Harga harus berupa angka';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Harga",
                  labelStyle: TextStyle(color: Colors.black87),
                  hintText: "Masukkan harga produk",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color.fromARGB(255, 255, 204, 230)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color.fromARGB(255, 255, 204, 230), width: 2),
                  ),
                  prefixIcon: Icon(Icons.attach_money, color: Color.fromARGB(255, 255, 204, 230)),
                  prefixText: "Rp ",
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _stockController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Stok tidak boleh kosong';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Stok harus berupa angka';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Stok",
                  labelStyle: TextStyle(color: Colors.black87),
                  hintText: "Masukkan jumlah stok",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color.fromARGB(255, 255, 204, 230)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color.fromARGB(255, 255, 204, 230), width: 2),
                  ),
                  prefixIcon: Icon(Icons.inventory, color: Color.fromARGB(255, 255, 204, 230)),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Produk berhasil ditambahkan!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 204, 230),
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Simpan",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}