import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:path/path.dart';
import 'package:project/model/product_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  bool _isLoading = false;

  Future<void> _submitProduct() async {
    log("----------------- SUBMIT PRODUCT-----------------------");

    if (_selectedFile == null) {
      print("Please add a main image.");
      return;
    }

    if (_nameController.text.trim().isEmpty &&
        _priceController.text.trim().isEmpty &&
        _weightController.text.trim().isEmpty &&
        _categoriesController.text.trim().isEmpty &&
        _typeController.text.trim().isEmpty) {
      log("Validation failed: Category - ${_categoriesController.text}, Name - ${_nameController.text}, Type - ${_typeController.text}");
      print("All fields must be filled.");
      return;
    }

    // Validate numeric fields
    int productPrice;
    double productWeight;

    try {
      productPrice = int.parse(_priceController.text.trim());
    } catch (e) {
      print("Invalid product price. Please enter a valid number.");
      return;
    }

    try {
      productWeight = double.parse(_weightController.text.trim());
    } catch (e) {
      print("Invalid product weight. Please enter a valid number.");
      return;
    }

    try {
      // Upload images to Firebase Storage
      final mainFileName = _selectedFile!.name;
      await _uploadImage(mainFileName, File(_selectedFile!.path));
      String mainImageUrl = await _getDownloadURL(mainFileName);

      List<String> relatedImageUrls = [];
      for (var file in _relatedFiles) {
        final relatedFileName = file.name;
        await _uploadImage(relatedFileName, File(file.path));
        relatedImageUrls.add(await _getDownloadURL(relatedFileName));
      }

      log("NAME : ${_nameController.text}");
      log("CATEGORY : ${_categoriesController.text}");
      log("TYPE : ${_typeController.text}");

      // Prepare product object
      final product = NysaProduct(
        productName: _nameController.text,
        productPrice: productPrice.toString(),
        productWeight: productWeight.toString(),
        //  productID: count++, // Not required for Firestore
        productCategories: _categoriesController.text,
        productType: _typeController.text,
        imageUrl: mainImageUrl,
        relatedImageUrls: relatedImageUrls, productId: '',
      );

      // Insert product into Firestore
      await _insertProductData(product);

      print("Product submitted successfully!");

      // Reset form
      clearTextFields();
      clearimages();
      clearDropdown();
    } catch (e) {
      print("Error submitting product: $e");
    }
  }

  Future<List<Map<String, dynamic>>> getProductData() async {
    try {
      final firestore = FirebaseFirestore.instance;
      final snapshot = await firestore.collection('products').get();

      final productData = snapshot.docs.map((doc) => doc.data()).toList();

      log("Retrieved product data: $productData");
      return productData;
    } catch (e) {
      print("Error retrieving product data: $e");
      return [];
    }
  }

  Future<void> _insertProductData(NysaProduct product) async {
    try {
      final firestore = FirebaseFirestore.instance;

      await firestore.collection('products').add({
        "productName": product.productName,
        "productPrice": product.productPrice,
        "productWeight": product.productWeight,
        "productCategories": product.productCategories,
        "productType": product.productType,
        "imageUrl": product.imageUrl,
        "relatedImageUrls": product.relatedImageUrls,
      });

      log("Product added to Firestore successfully.");
    } catch (e) {
      print("Error adding product to Firestore: $e");
    }
  }

  int count = 1000;

  List<XFile> _relatedFiles = [];
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _selectedFile;
  late Future<Database> database;

  // Text controllers
  final TextEditingController _categoriesController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();

  // Dropdown values
  final List<Map<String, String>> categories = [
    {"title": "Men", "value": "1"},
    {"title": "Women", "value": "2"},
    {"title": "Kids", "value": "3"}
  ];
  String? selectedCategoryValue;

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  Future<void> _initializeDatabase() async {
    database = openDatabase(
      join(await getDatabasesPath(), "NysaDB.db"),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE IF NOT EXISTS Product (
          productName TEXT,
          productPrice INTEGER,
          productWeight REAL,
          productID INTEGER PRIMARY KEY,
          productCategories TEXT,
          productType TEXT,
          imageUrl TEXT,
          relatedImageUrls TEXT
        )
      ''');
      },
    );
    print("Database initialized successfully.");
  }

  Future<void> _addMainImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedFile = XFile(pickedFile.path);
      });
    }
  }

  Future<void> _addRelatedImages() async {
    final pickedFiles = await _imagePicker.pickMultiImage();
    if (pickedFiles != null) {
      setState(() {
        _relatedFiles.addAll(pickedFiles);
      });
    }
  }

  Future<void> _uploadImage(String fileName, File file) async {
    await FirebaseStorage.instance.ref(fileName).putFile(file);
  }

  Future<String> _getDownloadURL(String fileName) async {
    return await FirebaseStorage.instance.ref(fileName).getDownloadURL();
  }

  void clearimages() {
    setState(() {
      _selectedFile = null; // Clear main image
      _relatedFiles = []; // Clear related images
    });
  }

  void clearTextFields() {
    _nameController.clear();
    _categoriesController.clear();
    // selectedCategoryValue = categories[0]['title'];
    _priceController.clear();
    _weightController.clear();
    _typeController.clear();
  }

  void clearDropdown() {
    setState(() {
      selectedCategoryValue = null;
      _categoriesController
          .clear(); // Clear the associated TextController as well
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(6, 40, 30, 1),
                Color.fromRGBO(12, 81, 61, 1),
              ],
            ),
          ),
        ),
        title: const Text(
          "Add Item",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.3, // Adjust this value for the fade effect
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://gjepc.org/solitaire/wp-content/uploads/2024/01/Bvlgari-named-Indian-actress-Priyanka-Chopra-as-Global-Brand-Ambassador-in-2021--800x1000.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDropdown(),
                _buildTextField(_nameController, "Product Name"),
                _buildTextField(
                    _priceController, "Product Price", TextInputType.number),
                _buildTextField(_weightController, "Product Weight in gm",
                    TextInputType.number),
                _buildTextField(_typeController, "Product Type"),
                _buildImagePickerButton("Add Main Image", _addMainImage),
                _buildImagePreview(),
                _buildImagePickerButton(
                    "Add Related Images", _addRelatedImages),
                _buildRelatedImagesPreview(),
                const SizedBox(height: 20),
                _buildSubmitButton(),
              ],
            ),
          ),
          if (_isLoading)
            Container(
              color:
                  Colors.black.withOpacity(0.5), // Semi-transparent background
              child: Center(
                child: LoadingAnimationWidget.hexagonDots(
                  color: Colors.white,
                  size: 100,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDropdown() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InputDecorator(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          contentPadding: const EdgeInsets.all(10),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            isDense: true,
            value: selectedCategoryValue,
            isExpanded: true,
            hint: const Text("Select Categories",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            items: categories.map((data) {
              return DropdownMenuItem(
                  value: data['value'], child: Text(data['title']!));
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedCategoryValue = value;
                _categoriesController.text = categories.firstWhere(
                  (category) => category['value'] == value,
                  orElse: () => {"title": "", "value": ""},
                )['title']!;

                log("SELECTED CATEGORY : ${_categoriesController.text}");
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      [TextInputType inputType = TextInputType.text]) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        ),
      ),
    );
  }

  Widget _buildImagePickerButton(String label, Future<void> Function() onTap) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: const Icon(Icons.add, size: 20),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green.shade900,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
      ),
    );
  }

  Widget _buildImagePreview() {
    return Container(
      height: 170,
      width: 170,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        image: _selectedFile != null
            ? DecorationImage(
                image: FileImage(File(_selectedFile!.path)),
                fit: BoxFit.cover,
              )
            : null,
      ),
    );
  }

  Widget _buildRelatedImagesPreview() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _relatedFiles.map((file) {
          return Container(
            height: 100,
            width: 100,
            margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: FileImage(File(file.path)),
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () async {
          setState(() {
            _isLoading = true; // Show loader
          });
          await _submitProduct();
          clearTextFields();
          clearimages();
          clearDropdown();
          setState(() {
            _isLoading = false; // Hide loader
          });
          print(await getProductData());
        },
        icon: const Icon(Icons.save, size: 20),
        label: const Text("Submit Product"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green.shade900,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
      ),
    );
  }
}
