import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vie_fashion_week/bloc/gallery_bloc/gallery_bloc.dart';

import '../common_widgets/widgets.dart';
import '../gallery/gallery.dart';

class AwardPage extends StatefulWidget {
  const AwardPage({Key? key}) : super(key: key);

  @override
  State<AwardPage> createState() => _AwardPageState();
}

class _AwardPageState extends State<AwardPage> {
  @override
  Widget build(BuildContext context) {
    return _bodyAwards();
  }
}

Widget _bodyAwards() {
  // final user = FirebaseAuth.instance.currentUser;
  return Scaffold(
    body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-0.761, -0.835),
          end: Alignment(0.126, 0.084),
          colors: [Color(0xfff3e091), Color(0xffe4be63)],
          stops: [0.0, 1.0],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 32,
          ),
          VieWidgets.vieAppBar('Vie International Awards', 'The Golden Lady'),
          //const SizedBox(height: 8),
          BlocListener<GalleryBloc, GalleryState>(listener: (context, state) {
            if (state is GalleryDatabaseError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
            if (state is GalleryCallDetailPage) {}
            /*  if (state is DatabaseSuccess) {
          _listBuilder(state);
          } */
          }, child:
              BlocBuilder<GalleryBloc, GalleryState>(builder: (context, state) {
            if (state is GalleryDatabaseSucceeded) {
              context.read<GalleryBloc>().add(GalleryDatabaseFetched());
            }
            if (state is GalleryInitial) {
              context.read<GalleryBloc>().add(GalleryDatabaseFetched());
              return const Center(
                  child: LinearProgressIndicator(
                color: Colors.blueGrey,
              ));
            }

            /* SingleChildScrollView(
                child: ,
              ) */

            if (state is GalleryDatabaseSucceeded) {
              return Expanded(child: Container(child: _upEventBuilder(state)));
            }
            return const Center(child: CircularProgressIndicator());

            // return const Center(child: Text("Nothing to Display"));
          }))
          /* SingleChildScrollView(
                child: ,
              ) */
        ],
      ),
    ),
  );
}

_upEventBuilder(GalleryDatabaseSucceeded state) {
  return Center(
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: state.listOfGallery.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            SizedBox(
              height: 220,
              width: 330,
              child: InkWell(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GalleryScreen()))
                },
                child: VieWidgets.designerTile(
                    context,
                    state.listOfGallery[index].url.trim(),
                    state.listOfGallery[index].name.trim(),
                    'state',
                    'date',
                    "Details"),
              ),
            ),
            const SizedBox(height: 5)
          ],
        );
      },
    ),
  );
}
