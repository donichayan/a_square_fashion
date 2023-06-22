import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vie_fashion_week/bloc/designer_bloc/designer_bloc.dart';

import '../common_widgets/widgets.dart';
import '../gallery/gallery.dart';

class DesignerPage extends StatefulWidget {
  const DesignerPage({Key? key}) : super(key: key);

  @override
  State<DesignerPage> createState() => _DesignerPageState();
}

class _DesignerPageState extends State<DesignerPage> {
  @override
  Widget build(BuildContext context) {
    return _bodyDesigner();
  }
}

Widget _bodyDesigner() {
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
          VieWidgets.vieAppBar('All', 'Designers'),
          //const SizedBox(height: 8),
          BlocListener<DesignerBloc, DesignerState>(listener: (context, state) {
            if (state is DesignerDatabaseError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
            if (state is DesignerCallDetailPage) {}
            /*  if (state is DatabaseSuccess) {
          _listBuilder(state);
          } */
          }, child: BlocBuilder<DesignerBloc, DesignerState>(
              builder: (context, state) {
            if (state is DesignerDatabaseSucceeded) {
              context.read<DesignerBloc>().add(DesignerDatabaseFetched());
            }
            if (state is DesignerInitial) {
              context.read<DesignerBloc>().add(DesignerDatabaseFetched());
              return const Center(
                  child: LinearProgressIndicator(
                color: Colors.blueGrey,
              ));
            }

            /* SingleChildScrollView(
                child: ,
              ) */

            if (state is DesignerDatabaseSucceeded) {
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

_upEventBuilder(DesignerDatabaseSucceeded state) {
  return Center(
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: state.listOfDesigner.length,
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
                    state.listOfDesigner[index].url.trim(),
                    state.listOfDesigner[index].name.trim(),
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
