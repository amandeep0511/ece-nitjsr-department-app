import 'package:ece/widgets/routine/faculty_card.dart';
import 'package:ece/widgets/routine/routine_card.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  Widget profileSection() {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("About Us",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                )),
            background: Image.network(
                "https://img.collegepravesh.com/2016/10/NIT-Jamshedpur.jpg",
                fit: BoxFit.cover),
          ),
        ),
        SliverFillRemaining(
            child: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Column(
              children: <Widget>[
                Text(
                  "Department of Electronics and Communication Engineering was started in 1989. The department covers a host of subjects inclusive of Electronic Circuits, Microprocessor, Digital signal processing, Analog communication, Digital communication, Mobile communication, VLSI, Embedded systems, Instrumentation etc. The department has laboratories catering to all the subjects of studies. There are five research scholars working in different specializations under the groups of Communication Engineering, VLSI and Embedded systems, Signal Processing, Instrumentation and Soft computing. The Department has highly motivated faculty pool to cater our needs.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Title(
                  child: Text(
                    "All Faculties",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  color: Colors.black,
                ),
                FacultyCardWidget(
                    'http://www.nitjsr.ac.in/images/facultyphotos/sns.jpg',
                    'Prof. Shiva Nand Singh',
                    'Professor & Head',
                    'Department of Electronics & Communication Engineering',
                    'B.Tech: BIT, Mesra(Deemed University)',
                    'M.Tech: RIT, Jamshedpur(Ranchi University)',
                    'Ph.D: NIT, Jamshedpur(Deemed University).'),
                FacultyCardWidget(
                    'http://www.nitjsr.ac.in/images/facultyphotos/arvindc.jpg',
                    'Prof. Arvind Choubey',
                    'Professor(On Deputation , Director IIIT Bhagalpur)',
                    'Department of Electronics & Communication Engineering',
                    'B. Tech, Bihar University',
                    'M.Tech, IIT BHU, Varanasi',
                    'Ph.D, Ranchi University.'),
                FacultyCardWidget(
                    'http://www.nitjsr.ac.in/images/facultyphotos/akhilesh.jpg',
                    'Dr. Akhilesh Kumar',
                    'Associate Professor',
                    'Department of Electronics & Communication Engineering',
                    'B.Tech: B.C.E. Bhagalpur',
                    'M.Tech: B.I.T. Sindri',
                    'Ph.D.'),
                FacultyCardWidget(
                    'http://www.nitjsr.ac.in/images/facultyphotos/dilipk.jpg',
                    'Mr. Dilip Kumar',
                    'Associate Professor',
                    'Department of Electronics & Communication Engineering',
                    'B.Tech: Institute of Engineering (India).',
                    'M.Tech: NIT Jamshedpur.',
                    'Ph.D: Pursuing (NIT Jamshedpur)'),
                FacultyCardWidget(
                    'http://www.nitjsr.ac.in/images/facultyphotos/bsmunda.jpg',
                    'Mr. Bhut Nath Singh Munda',
                    'Associate Professor',
                    'Department of Electronics & Communication Engineering',
                    'B.Tech: NIT Jamshedpur',
                    'M.Tech: NIT Jamshedpur.',
                    'Ph.D: Pursuing (NIT Jamshedpur)'),
                FacultyCardWidget(
                    'http://www.nitjsr.ac.in/images/facultyphotos/amitp.jpg',
                    'Mr. Amit Prakash',
                    'Associate Professor',
                    'Department of Electronics & Communication Engineering',
                    'B.Tech: CET Bijapur',
                    'M.Tech: NIT Jamshedpur.',
                    'Ph.D: Pursuing (NIT Jamshedpur)'),
                FacultyCardWidget(
                  'http://www.nitjsr.ac.in/images/facultyphotos/EC29.jpg',
                  'Dr. Ajay Kumar',
                  'Assistant Professor',
                  'Department of Electronics & Communication Engineering',
                  'B.Tech: ',
                  'M.Tech: ',
                  'Ph. D: Department of Electronics Engineering,rnIndian School of Mines, Dhanbad',
                ),
                FacultyCardWidget(
                  'http://www.nitjsr.ac.in/images/facultyphotos/EC31.jpg',
                  'Dr. Prashant Kumar',
                  'Assistant Professor',
                  'Department of Electronics & Communication Engineering',
                  'B.Sc.Engg: BCE Patna (Now NIT Patna)',
                  'M.Tech: NIT Durgapur',
                  'Ph. D: IIT Patna, 2016',
                ),
                FacultyCardWidget(
                  'http://www.nitjsr.ac.in/images/facultyphotos/EC23.jpg',
                  'Dr. Nagendra Kumar',
                  'Assistant Professor',
                  'Department of Electronics & Communication Engineering',
                  'B.Tech: ',
                  'M.Tech: ',
                  'Ph. D:  IIT Indore',
                ),
                FacultyCardWidget(
                  'http://www.nitjsr.ac.in/images/facultyphotos/EC28.jpg',
                  'Dr. Mrutyunjay Rout',
                  'Assistant Professor',
                  'Department of Electronics & Communication Engineering',
                  'B.Tech:  Berhampur University,Odisha',
                  'M.Tech: Indian Institute of Technology,Roorkee',
                  'Ph. D:  Indian Institute of Technology, Kharagpur',
                ),
                FacultyCardWidget(
                    'http://www.nitjsr.ac.in/images/facultyphotos/EC07.jpg',
                    'Dr. Jayendra Kumar',
                    'Assistant Professor',
                    'Department of Electronics & Communication Engineering',
                    'B.Tech: ',
                    'M.Tech: NIT Jamshedpur.',
                    'Ph.D: IIT Roorkee'),
                FacultyCardWidget(
                    'http://www.nitjsr.ac.in/images/facultyphotos/EC27.jpg',
                    'Dr. Basanta Bhowmik',
                    'Assistant Professor',
                    'Department of Electronics & Communication Engineering',
                    'B.Tech: West Bengal University of Technology',
                    'M.Tech: Indian Institute of Information Technology, Gwalior.',
                    'Ph.D: Indian Institute of Engineering Science and Technology, Shibpur'),
                FacultyCardWidget(
                    'http://www.nitjsr.ac.in/images/facultyphotos/EC30.jpg',
                    'Dr. Swagatadeb Sahoo',
                    'Assistant Professor',
                    'Department of Electronics & Communication Engineering',
                    'B.Tech: ',
                    'M.Tech: ',
                    'Ph.D: Jadavpur University, Kolkata, India'),
                FacultyCardWidget(
                  'http://www.nitjsr.ac.in/images/facultyphotos/EC09.png',
                  'Dr. Rashmi Sinha',
                  'Associate Professor',
                  'Department of Electronics & Communication Engineering',
                  'B.Tech: ',
                  'M.Tech: ',
                  'Ph.D: N.I.T. Jamshedpur',
                ),
              ],
            ),
          ),
        ))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return profileSection();
  }
}
