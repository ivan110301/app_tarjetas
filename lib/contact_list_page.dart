import 'package:app_tarjetas/contact.dart';
import 'package:app_tarjetas/contact_detail_screen.dart';
import 'package:app_tarjetas/home_page.dart';
import 'package:app_tarjetas/perspective_list_view.dart';
import 'package:flutter/material.dart';

class ContactListPage extends StatefulWidget {
  const ContactListPage({super.key});

  @override
  ContactListPageState createState() => ContactListPageState();
}

class ContactListPageState extends State<ContactListPage> {
  int? _visibleItems;
  double? _itemExtent;

  @override
  void initState() {
    _visibleItems = 8;
    _itemExtent = 270.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text('Fichas de contacto'),
      ),
      body: PerspectiveListView(
        visualizedItems: _visibleItems,
        itemExtent: _itemExtent,
        initialIndex: 7,
        enableBackItemsShadow: true,
        backItemsShadowColor: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.all(10),
        onTapFrontItem: (index) {
          final color = Colors.accents[index! % Colors.accents.length];
          Navigator.push(
            context,
            MaterialPageRoute<dynamic>(
              builder: (_) => ContactDetailScreen(
                contact: Contact.contacts[index],
                color: color,
              ),
            ),
          );
        },
        children: List.generate(Contact.contacts.length, (index) {
          final borderColor = Colors.accents[index % Colors.accents.length];
          final contact = Contact.contacts[index];
          return ContactCard(
            borderColor: borderColor,
            contact: contact,
          );
        }),
      ),
      //---------------------------------------
      // Drawer
      //---------------------------------------
      drawer: Drawer(
        child: Material(
          textStyle: const TextStyle(color: Colors.white, fontSize: 16),
          child: Container(
            color: const Color(0xFF5B4382),
            padding: const EdgeInsets.all(20),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //----------------------------
                  // Drawer title
                  //----------------------------
                  Row(
                    children: const [
                      Icon(
                        Icons.settings_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                      Text(
                        ' Configuraciones',
                        style: TextStyle(
                          fontSize: 26,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 40),
                  //----------------------------
                  // Items de visibilidad
                  //----------------------------
                  Row(
                    children: [
                      const Icon(
                        Icons.visibility_rounded,
                        color: Colors.white,
                        size: 16,
                      ),
                      const Text(
                        ' Elementos visibles',
                        style: TextStyle(),
                      ),
                      Expanded(
                        child: Slider(
                          value: _visibleItems!.toDouble(),
                          min: 1,
                          max: 15,
                          divisions: 15,
                          label: '$_visibleItems',
                          activeColor: Colors.deepPurple[200],
                          inactiveColor: Colors.deepPurple[400],
                          onChanged: (value) {
                            setState(() {
                              _visibleItems = value.toInt();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  const Divider(height: 40),
                  //----------------------------
                  // Item de extension
                  //----------------------------
                  Row(
                    children: [
                      const Icon(
                        Icons.widgets,
                        color: Colors.white,
                        size: 16,
                      ),
                      const Text(
                        ' Extensión',
                        style: TextStyle(),
                      ),
                      Expanded(
                        child: Slider(
                          value: _itemExtent!,
                          min: 270,
                          max: MediaQuery.of(context).size.height * .8,
                          label: '$_itemExtent',
                          activeColor: Colors.deepPurple[200],
                          inactiveColor: Colors.deepPurple[400],
                          onChanged: (value) {
                            setState(() {
                              _itemExtent = value;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  const Divider(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
