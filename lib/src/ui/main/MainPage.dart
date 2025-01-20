import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notifydoc_b1/src/res/constants.dart';
import 'package:notifydoc_b1/src/res/enum.dart';
import 'package:notifydoc_b1/src/ui/regisdoc/registdoc.dart';
import 'package:notifydoc_b1/src/utils/size_config.dart';


class MainPaige extends StatefulWidget {
  static String routeName = '/mainPage';
  const MainPaige({super.key});

  @override
  State<MainPaige> createState() => _MainPaigeState();
}

class _MainPaigeState extends State<MainPaige> {
  int _index = 2;  
  @override
  Widget build(BuildContext context) {    
    SizeConfig().init(context);
    final cor = Theme.of(context).colorScheme;
    return Scaffold(
      body: screen[_index],
      extendBody: true,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, RegisterDoc.routeName),
        backgroundColor: kSecondaryColor,
        shape: const OvalBorder(),
        child: const Icon(
          CupertinoIcons.add,
          color: Colors.black,
          size: 40,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        padding: EdgeInsets.symmetric(vertical: 20),
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => setState(() => _index = 2),
              child: SvgPicture.asset(
                'assets/icons/Shop Icon.svg',
                color: _index == 2 ? kSecondaryColor : Colors.grey,
              ),
            ),
            GestureDetector(
              onTap: () => setState(() => _index = 3),
             child: SvgPicture.asset(
                'assets/icons/Cash.svg',
                color: _index == 3 ? kSecondaryColor : Colors.grey,              
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
