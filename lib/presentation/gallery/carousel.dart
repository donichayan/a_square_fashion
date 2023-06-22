import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'image.dart';

class CarouselPage extends StatefulWidget {
  const CarouselPage({Key? key}) : super(key: key);

  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: const Color(0xffe4be63),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
        automaticallyImplyLeading: true,
        title: const Text('Image view'),
      ),
      body: StreamBuilder(
        stream: _firebaseFirestore.collection("VFW FW 2017").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData == false) {
            return const CircularProgressIndicator();
          }
          return Container(
            child: mainView(context, snapshot),
          );
        },
      ),
    );
  }

  Widget mainView(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    final double height = MediaQuery.of(context).size.height;
    return CarouselSlider(
      options: CarouselOptions(
        height: height,
        viewportFraction: 1.0,
        enlargeCenterPage: true,
        // autoPlay: false,
      ),
      items: snapshot.data!.docs
          .map((item) => Center(
                  child: InkWell(
                onTap: () => _imageVidew(context, item.get('url')),
                child: CachedNetworkImage(
                  imageUrl: item.get('url'),
                  fit: BoxFit.cover,
                  height: height,
                ),
              )))
          .toList(),
    );
  }

  _imageVidew(BuildContext context, String url) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => ImagePage(
                url: url,
              )),
    );
  }
}
