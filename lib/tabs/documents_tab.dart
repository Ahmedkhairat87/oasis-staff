import 'package:flutter/material.dart';
import 'document_class.dart';

class DocumentsTab extends StatelessWidget {
  DocumentsTab({super.key});

  final List<Document> documents = [
    Document(
      docIcon: const Icon(Icons.insert_drive_file, color: Colors.blue),
      docName: "Contract",
      downloadIcon: const Icon(Icons.download),
    ),
    Document(
      docIcon: const Icon(Icons.picture_as_pdf, color: Colors.red),
      docName: "Salary Slip",
      downloadIcon: const Icon(Icons.download),
    ),
    Document(
      docIcon: const Icon(Icons.description, color: Colors.green),
      docName: "Policy Document",
      downloadIcon: const Icon(Icons.download),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: documents.map((doc) {
        return ListTile(
          leading: doc.docIcon,
          title: Text(doc.docName),
          trailing: doc.downloadIcon,
          onTap: () {

          },
        );
      }).toList(),
    );
  }
}