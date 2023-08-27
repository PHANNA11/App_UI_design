import 'package:design_ex/view/profile/model/icon_model.dart';
import 'package:design_ex/view/profile/model/item_model.dart';
import 'package:design_ex/view/profile/widget/custom_icon.dart';
import 'package:design_ex/view/profile/widget/item_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'User Setting',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),
                    child: Column(
                      children: [
                        const ListTile(
                          leading: CircleAvatar(
                            maxRadius: 25,
                            backgroundImage: NetworkImage(
                                'https://yt3.ggpht.com/yti/AOXPAcX8ZptWhdcH2DKMJwL1LvoVtStkn_6uE7MzJf88=s88-c-k-c0x00ffffff-no-rj'),
                          ),
                          title: Text('Mr.Phanna'),
                          subtitle: Text('Flutte Dev'),
                        ),
                        Expanded(
                          child: SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text('445'),
                                    Text('445'),
                                    Text('445'),
                                    Text('445'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text('ffff'),
                                    Text('jjjj'),
                                    Text('dfgh'),
                                    Text('lllll'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listIcons.length,
                    itemBuilder: (context, index) =>
                        CustomIcon(iconModel: listIcons[index]),
                  ),
                ),
                Column(
                  children: List.generate(
                      listItems.length,
                      (index) => ItemMenuCustom(
                            itemMenuCustom: listItems[index],
                          )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
