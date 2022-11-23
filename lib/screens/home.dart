import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notex/database/allinone_controller.dart';
import 'package:notex/database/db_functions.dart';
import 'package:notex/main.dart';
import 'package:notex/screens/all_in_one.dart';
import 'package:notex/styles/styles.dart';
import 'package:notex/widgets/note_grid.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final myController = Get.put(NoteDb());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: Styles().scaffoldColor()),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 11, 97, 103),
          title: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Note',
                  style: GoogleFonts.chewy(
                    fontSize: 25,
                    color: const Color.fromARGB(255, 0, 230, 246),
                  ),
                ),
                TextSpan(
                  text: 'X',
                  style: GoogleFonts.chewy(
                    fontSize: 25,
                    color: const Color.fromARGB(255, 8, 42, 58),
                  ),
                ),
              ],
            ),
          ),
          centerTitle: true,
          leading: const Icon(Icons.home_rounded),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              GetBuilder<NoteDb>(
                builder: (controller) => myController.noteModelList.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5,
                        ),
                        itemCount: myController.noteModelList.length,
                        itemBuilder: (context, index) {
                          final values = myController.noteModelList[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                title.value = values.title;
                                isViewing.value = true;
                                isEditing.value = true;
                                final allController = Get.put(AllController());

                                allController.contentController.text =
                                    values.content;
                                allController.titleController.text =
                                    values.title;

                                Get.to(
                                  () => AllInOneScreen(
                                    index: index,
                                    model: values,
                                  ),
                                );
                              },
                              child: NoteGrid(
                                content: values.content,
                                title: values.title,
                                id: values.id,
                              ),
                            ),
                          );
                        },
                      ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 12,
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: const Color.fromARGB(255, 8, 42, 58),
          onPressed: () {
            isEditing.value = false;
            isViewing.value = false;
            title.value = 'Add New Note';

            Get.to(() => AllInOneScreen());
          },
          label: const Text('Add'),
          icon: const Icon(Icons.note_alt_outlined),
        ),
      ),
    );
  }
}
