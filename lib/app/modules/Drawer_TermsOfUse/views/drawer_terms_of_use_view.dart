import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/drawer_terms_of_use_controller.dart';

/**
 * | Created By: ANSHI KUMARI
 */


class DrawerTermsOfUseView extends GetView<DrawerTermsOfUseController> {
  const DrawerTermsOfUseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TERMS OF USE'),
      elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExpandableSection(
              title: 'User Account',
              content: """The user has to create an account by providing  their mobile no. and create an account by providing necessary details of the citizen that needs  to be  provided at the time of the registration.""",
            ),
            ExpandableSection(
              title: 'Password',
              content: """The password created by the user helps the citizen to keep their private data safe. It creates a safe and secure interaction online. The users are requested to build their password with maximum strength and make it unique by using symbols. """,
            ),
            ExpandableSection(
              title: 'Security',
              content: """Security: Securities provided to users are authenticated; only registered users may be able to gain access to customer information. This app uses data security measures such as encryption to maximize data security of both businesses and app users.""",
            ),
            ExpandableSection(
              title: 'Services Provided',
              content: """Services Provided: Services offered to the users are subjected to terms and conditions for the use of the platform and updated from time to time.Users can use these services to apply to generate Property Tax, Water Tax and Trade Tax.Through this app they can upload documents in this platform for the purpose of enabling the services provided.  """,
            ),
            ExpandableSection(
              title: 'Platform',
              content: """Platform: We control and operate the platform from India, the materials and content available on this are appropriate and can only be used in India only. This app can be used in different operating systems like Android and IOS.""",
            ),
            ExpandableSection(
              title: 'Payment',
              content: """Payment: The user can make payment in through UPI, Debit Card and Credit Card.""",
            ),
            SizedBox(height: 50,)
          ],
        ),
      )
    );
  }
}



class ExpandableSection extends StatefulWidget {
  final String title;
  final String content;

  ExpandableSection({required this.title, required this.content});

  @override
  _ExpandableSectionState createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          trailing: Icon(
            _isExpanded ? Icons.expand_less : Icons.expand_more,
          ),
        ),
        if (_isExpanded)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(widget.content),
          ),
      ],
    );
  }
}