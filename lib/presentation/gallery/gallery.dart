import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
//import 'package:carousel_images/carousel_images.dart';
import 'package:vie_fashion_week/presentation/gallery/carousel.dart';
import 'package:vie_fashion_week/presentation/gallery/image.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final List<String> cachedFileList = [];
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    cachedFileList.clear();
    return Scaffold(
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(8),
        child: StreamBuilder<QuerySnapshot>(
          stream: _firebaseFirestore.collection("VFW FW 2017").snapshots(),
          builder: (context, snapshot) {
            return snapshot.hasError
                ? const Center(
                    child: Text("There is some problem loading your images"),
                  )
                : snapshot.hasData
                    ? GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 1,
                        children: snapshot.data!.docs
                            .map((e) => CachedNetworkImage(
                                  imageBuilder: (context, imageProvider) {
                                    return InkWell(
                                      onTap: () => _buildCarousel(
                                          context, cachedFileList),
                                      onDoubleTap: () =>
                                          _picView(context, e.get("url")),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                      Colors.transparent,
                                                      BlendMode.colorBurn)),
                                        ),
                                      ),
                                    );
                                  },
                                  imageUrl: e.get("url"),
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) {
                                    return SizedBox(
                                      height: 1,
                                      width: 1,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                            color: Colors.amber,
                                            backgroundColor: Colors.black,
                                            value: downloadProgress.progress),
                                      ),
                                    );
                                  },
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ))
                            .toList(),
                      )
                    : Container();
          },
        ),
      ),
    );
  }

  Future<String> _findPath(String imageUrl) async {
    //final cacheObject = await cachedFileList;
    //final cache = await CacheManager.getInstance();
    final file = await DefaultCacheManager().getSingleFile(imageUrl);
    print("File Path >>>>>>>>>" + file.path);
    return file.path;
  }

  _buildCarousel(BuildContext context, List<String> cachedFileList) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const CarouselPage()),
    );
  }

  _picView(BuildContext context, String url) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => ImagePage(
                url: url,
              )),
    );
  }
}
/*
Image.network(e.get("url"),
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                })
 */