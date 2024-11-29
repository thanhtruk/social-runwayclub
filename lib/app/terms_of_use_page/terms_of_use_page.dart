import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: TermsOfUsePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class TermsOfUsePage extends StatelessWidget {
  const TermsOfUsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Use'),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Web Site Terms and Conditions of Use',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              '1. Terms',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'By accessing this web site, you are agreeing to be bound by these web site Terms and Conditions of Use, our Privacy Policy, all applicable laws and regulations, and agree that you are responsible for compliance with any applicable local laws. If you do not agree with any of these terms, you are prohibited from using or accessing this site. The materials contained in this web site are protected by applicable copyright and trademark law.',
              style: TextStyle(
                fontSize: 16, // Cỡ chữ
                height: 1.4,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '2. Use License',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              '2.1 Permission is granted to temporarily download one copy of the materials (information or software) on Runway Club\'s web site for personal, non-commercial transitory viewing only. This is the grant of a license, not a transfer of title, and under this license you may not:',
              style: TextStyle(
                fontSize: 16, // Cỡ chữ
                height: 1.4,
              ),
            ),
            ListTile(
              title: Text('a. Modify or copy the materials.'),
            ),
            ListTile(
              title: Text(
                  'b. Use the materials for any commercial purpose, or for any public display (commercial or non-commercial).'),
            ),
            ListTile(
              title: Text(
                  'c. Attempt to decompile or reverse engineer any software contained on Runway Club\'s web site.'),
            ),
            ListTile(
              title: Text(
                  'd. Remove any copyright or other proprietary notations from the materials.'),
            ),
            ListTile(
              title: Text(
                  'e. Transfer the materials to another person or "mirror" the materials on any other server.'),
            ),
            SizedBox(height: 6),
            Text(
              '2.2 This license shall automatically terminate if you violate any of these restrictions and may be terminated by Runway Club at any time. Upon terminating your viewing of these materials or upon the termination of this license, you must destroy any downloaded materials in your possession whether in electronic or printed format.',
              style: TextStyle(
                fontSize: 16, // Cỡ chữ
                height: 1.4,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '3. Disclaimer',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'The materials on Runway Club\'s web site are provided "as is". Runway Club makes no warranties, expressed or implied, and hereby disclaims and negates all other warranties, including without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights. Further, Runway Club does not warrant or make any representations concerning the accuracy, likely results, or reliability of the use of the materials on its Internet web site or otherwise relating to such materials or on any sites linked to this site.',
              style: TextStyle(
                fontSize: 16, // Cỡ chữ
                height: 1.4,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '4. Limitations',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'In no event shall Runway Club or its suppliers be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption,) arising out of the use or inability to use the materials on Runway Club\'s Internet site, even if Runway Club or an authorized representative has been notified orally or in writing of the possibility of such damage. Because some jurisdictions do not allow limitations on implied warranties, or limitations of liability for consequential or incidental damages, these limitations may not apply to you.',
              style: TextStyle(
                fontSize: 16, // Cỡ chữ
                height: 1.4,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '5. Revisions and Errata',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'The materials appearing on Runway Club\'s web site could include technical, typographical, or photographic errors. Runway Club does not warrant that any of the materials on its web site are accurate, complete, or current. Runway Club may make changes to the materials contained on its web site at any time without notice. Runway Club does not, however, make any commitment to update the materials.',
              style: TextStyle(
                fontSize: 16, // Cỡ chữ
                height: 1.4,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '6. Links',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'Runway Club has not reviewed all of the sites linked to its Internet web site and is not responsible for the contents of any such linked site. The inclusion of any link does not imply endorsement by Runway Club of the site. Use of any such linked web site is at the user\'s own risk.',
              style: TextStyle(
                fontSize: 16, // Cỡ chữ
                height: 1.4,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '7. Copyright / Takedown',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'Users agree and certify that they have rights to share all content that they post on Runway Club — including, but not limited to, information posted in articles, discussions, and comments. This rule applies to prose, code snippets, collections of links, etc. Regardless of citation, users may not post copy and pasted content that does not belong to them. Users assume all risk for the content they post, including someone else\'s reliance on its accuracy, claims relating to intellectual property, or other legal rights. If you believe that a user has plagiarized content, misrepresented their identity, misappropriated work, or otherwise run afoul of DMCA regulations, please email runway@itss.edu.vn. Runway Club may remove any content users post for any reason.',
              style: TextStyle(
                fontSize: 16, // Cỡ chữ
                height: 1.4,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '8. Site Terms of Use Modifications',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'Runway Club may revise these terms of use for its web site at any time without notice. By using this web site you are agreeing to be bound by the then current version of these Terms and Conditions of Use.',
              style: TextStyle(
                fontSize: 16, // Cỡ chữ
                height: 1.4,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '9. Runway Club Trademarks and Logos Policy',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'All uses of the Runway Club logo, Runway Club badges, brand slogans, iconography, and the like, may only be used with express permission from Runway Club. Runway Club reserves all rights, even if certain assets are included in Runway Club open source projects. Please contact runway@itss.edu.vn with any questions or to request permission.',
              style: TextStyle(
                fontSize: 16, // Cỡ chữ
                height: 1.4,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '10. Reserved Names',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'Runway Club has the right to maintain a list of reserved names which will not be made publicly available. These reserved names may be set aside for purposes of proactive trademark protection, avoiding user confusion, security measures, or any other reason (or no reason). \n\n Additionally, Runway Club reserves the right to change any already-claimed name at its sole discretion. In such cases, Runway Club will make reasonable effort to find a suitable alternative and assist with any transition-related concerns.',
              style: TextStyle(
                fontSize: 16, // Cỡ chữ
                height: 1.4,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '11. Content Policy',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'The following policy applies to comments, articles, and all other works shared on the Runway Club platform:',
              style: TextStyle(
                fontSize: 16, // Cỡ chữ
                height: 1.4,
              ),
            ),
            ListTile(
              title: Text(
                  '- Users must make a good-faith effort to share content that is on-topic, of high-quality, and is not designed primarily for the purposes of promotion or creating backlinks.'),
            ),
            ListTile(
              title: Text(
                  '- Posts must contain substantial content — they may not merely reference an external link that contains the full post.'),
            ),
            ListTile(
              title: Text(
                  '- If a post contains affiliate links, that fact must be clearly disclosed. For instance, with language such as: “This post includes affiliate links; I may receive compensation if you purchase products or services from the different links provided in this article.”'),
            ),
            Text(
              'Runway Club reserves the right to remove any content that it deems to be in violation of this policy at its sole discretion. Additionally, Runway Club reserves the right to restrict any user’s ability to participate on the platform at its sole discretion.',
              style: TextStyle(
                fontSize: 16, // Cỡ chữ
                height: 1.4,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '12. Governing Law',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'Any claim relating to Runway Club\'s web site shall be governed by the laws of the State of New York without regard to its conflict of law provisions. \n\nGeneral Terms and Conditions applicable to Use of a Web Site.',
              style: TextStyle(
                fontSize: 16, // Cỡ chữ
                height: 1.4,
              ),
            ),
            // Add more sections as needed.
          ],
        ),
      ),
    );
  }
}
