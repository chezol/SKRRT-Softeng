import 'package:flutter/material.dart';
import 'home_page.dart';

class NewUser extends StatefulWidget {
  @override
  _NewUserState createState() => _NewUserState();
}
class _NewUserState extends State<NewUser> {
  int currentStep = 0;
  bool complete = false;

  double uniHeight(BuildContext context){
    return MediaQuery.of(context).size.height*0.1;
  }
  double uniWidth(BuildContext context){
    return MediaQuery.of(context).size.width*0.1;
  }

  /*bool _tabletSized(BuildContext context){
    return MediaQuery.of(context).size.width > 700;
  }*/

  void fieldFin(){
    complete = true;
    setState(() =>  currentStep+1);
  }

  next() {
    !complete
        ? goTo(currentStep+1)
        : fieldFin();
    if(currentStep+1 >=steps.length)
      complete = true;
  }

  goTo(int step) {
    complete = false;
    setState(() => currentStep = step);
  }

  cancel(){
    if(currentStep > 0){
      goTo(currentStep - 1);
    }
  }


  List<Step> get steps => [
    Step(
        isActive: currentStep>=0,
        state: StepState.complete,
        title: const Text(''),
        content: Padding(
          padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width * 0.07),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage("assets/userscooter.jpg"),
                height: MediaQuery.of(context).size.height * 0.40,
              ),
              SizedBox( height: MediaQuery.of(context).size.height * 0.03,),
              Text(
                  'Rent a scooter and start your ride!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: uniHeight(context)*0.25,
                    //fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    color: Colors.white,
                  )
              ),
              SizedBox( height: MediaQuery.of(context).size.height * 0.03,),
            ],
          ),
        )
    ),
    Step(
        isActive: currentStep>=1,
        state: StepState.complete,
        title: const Text(''),
        content:Padding(
          padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width * 0.07),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage("assets/navigate.jpg"),
                height: MediaQuery.of(context).size.height * 0.40,
              ),
              SizedBox( height: MediaQuery.of(context).size.height * 0.03,),
              Text(
                  'Navigate to your destination easily!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: uniHeight(context)*0.25,
                    //fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    color: Colors.white,
                  )
              ),
              SizedBox( height: MediaQuery.of(context).size.height * 0.03,),
            ],
          ),
        )
    ),
    Step(
        isActive: currentStep>=2,
        state: StepState.complete,
        title: const Text(''),
        content: Padding(
          padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width * 0.07),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage("assets/wallet.png"),
                height: MediaQuery.of(context).size.height * 0.40,
              ),
              SizedBox( height: MediaQuery.of(context).size.height * 0.03,),
              Text(
                  'Pay easily using your \n SKRRT Wallet or school ID!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: uniHeight(context)*0.25,
                    //fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    color: Colors.white,
                  )
              ),
              SizedBox( height: MediaQuery.of(context).size.height * 0.03,),
            ],
          ),
        )
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromARGB(255, 0x00, 0xA8, 0xE5),
      body: LayoutBuilder(
          builder: (context, constraints) {//still testing this portion, will change the
            if (constraints.maxWidth > 600) {
              return _buildWideContainers();
            } else {
              return _buildNormalContainer();
            }
          }

      ),
    );

  }

  Widget _buildWideContainers() {
    return Center(
        child: Padding(
            padding:EdgeInsets.symmetric(horizontal: 10),
            child: Theme(
              data: ThemeData(
                canvasColor: Color.fromARGB(255, 0x00, 0xA8, 0xE5),
                primaryColor: Colors.black,
                backgroundColor: Colors.white,
                shadowColor: Colors.transparent, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Image(
                    image: AssetImage("assets/skrrt_logo.png"),
                    height: 75,
                    width: 75,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      'Your on-campus scooter on the go',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16.0,
                        //fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        color: Colors.white,
                      )
                  ),
                  complete ? Expanded(
                    child: Stepper(
                        steps: steps,
                        type: StepperType.horizontal,
                        currentStep: currentStep,
                        onStepCancel: cancel,
                        onStepTapped: (step) => goTo(step),
                        controlsBuilder: (BuildContext context, ControlsDetails controls) =>
                            Container(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(12.0),
                                    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(50.0)),
                                    onPrimary: Color(0xff00A8E5),
                                    primary: Colors.white,),
                                  child: Text(''
                                      'RIDE NOW',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color:Color(0xff00A8E5),
                                      fontSize: 16,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home()),
                                    );
                                  }
                              ),
                            )
                    ),
                  ):
                  Expanded(
                    child: Stepper(
                        steps: steps,
                        type: StepperType.horizontal,
                        currentStep: currentStep,
                        onStepCancel: cancel,
                        onStepTapped: (step) => goTo(step),
                        controlsBuilder: (BuildContext context, ControlsDetails controls) =>
                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(padding: EdgeInsets.all(12.0),
                                shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(50.0)),
                                onPrimary: Color(0xff00A8E5),
                                primary: Colors.white,),
                                onPressed: next,
                                child: Text(''
                                    'NEXT',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color:Color(0xff00A8E5),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            )
                    ),
                  ),
                ],),
            )
        )
    );
  }
  Widget _buildNormalContainer() {
    return Center(
        child: Container(
            child: Theme(
              data: ThemeData(
                canvasColor: Color.fromARGB(255, 0x00, 0xA8, 0xE5),
                primaryColor: Color.fromARGB(255, 0x1E, 0x1E, 0x1E),
                backgroundColor: Colors.white,
                shadowColor: Colors.transparent, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Image(
                    image: AssetImage("assets/skrrt_logo.png"),
                    height: 75,
                    width: 75,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                        'Your on-campus scooter on the go',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 14.0,
                          //fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                          color: Colors.white,
                        )
                    ),
                  ),
                  complete ? Expanded(
                    child: Stepper(
                        steps: steps,
                        type: StepperType.horizontal,
                        currentStep: currentStep,
                        onStepCancel: cancel,
                        onStepTapped: goTo,
                        controlsBuilder: (BuildContext context, ControlsDetails controls) =>
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width * 0.07),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(12.0),
                                    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(50.0)),
                                    onPrimary: Color(0xff00A8E5),
                                    primary: Colors.white,),
                                  child: Text(''
                                      'RIDE NOW',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color:Color(0xff00A8E5),
                                      fontSize: 16,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Home()),
                                    );
                                  }
                              ),
                            )
                    ),
                  ):
                  Expanded(
                    child: Stepper(
                        steps: steps,
                        type: StepperType.horizontal,
                        currentStep: currentStep,
                        onStepCancel: cancel,
                        onStepTapped: (step) => goTo(step),

                        controlsBuilder: (BuildContext context, ControlsDetails controls) =>
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width * 0.07),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(padding: EdgeInsets.all(12.0),
                                shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(50.0)),
                                onPrimary: Color(0xff00A8E5),
                                primary: Colors.white,),
                                onPressed: next,
                                child: Text(''
                                    'NEXT',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color:Color(0xff00A8E5),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            )
                    ),
                  ),
                ],),
            )
        )
    );
  }


}
