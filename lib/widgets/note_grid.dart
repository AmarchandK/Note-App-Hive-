// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notex/database/db_functions.dart';

class NoteGrid extends StatelessWidget {
  final myController = Get.put(NoteDb());
  NoteGrid({
    Key? key,
    required this.title,
    required this.content,
    required this.id,
  }) : super(key: key);
  String title;
  String content;
  String id;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: const Color.fromARGB(255, 8, 42, 58),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GridTile(
            footer: GridTileBar(
              title: Text(
                title,
                style: GoogleFonts.quicksand(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  myController.deleteNote(id);
                },
                icon: const Icon(
                  Icons.delete,                                                                                   
                ),
              ),
              backgroundColor: const Color.fromARGB(255, 8, 42, 58),
            ),
            child: ColoredBox(
              color: const Color.fromARGB(255, 0, 230, 246),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                ),
                child: Text(content),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
 
