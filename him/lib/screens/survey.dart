import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_kit/survey_kit.dart';

class MySurveyForm extends StatefulWidget {
  MySurveyForm({Key? key}) : super(key: key);

  @override
  State<MySurveyForm> createState() => _MySurveyFormState();
}

class _MySurveyFormState extends State<MySurveyForm> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: Align(
            alignment: Alignment.center,
            child: FutureBuilder<Task>(
              future: getJsonTask(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData &&
                    snapshot.data != null) {
                  final task = snapshot.data!;
                  return _buildSurvey(task);
                  // return Container(
                  //   color: Colors.blue,
                  // );
                }
                return const CircularProgressIndicator.adaptive();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSurvey(Task task) {
    return Scaffold(
      body: SurveyKit(
        onResult: (SurveyResult result) {
          print(result.finishReason);
          Navigator.pushNamed(context, '/');
        },
        task: task,
        // showProgress: true,
        localizations: const {
          'cancel': 'Cancel',
          'next': 'Next',
        },
        themeData: _getThemeData(),
        // surveyProgressbarConfiguration: SurveyProgressConfiguration(
        //   backgroundColor: Colors.white,
        // ),
      ),
    );
  }

  ThemeData _getThemeData() {
    return Theme.of(context).copyWith(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.cyan,
      ).copyWith(
        onPrimary: Colors.white,
      ),
      primaryColor: Colors.cyan,
      backgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.cyan,
        ),
        titleTextStyle: TextStyle(
          color: Colors.cyan,
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.cyan,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.cyan,
        selectionColor: Colors.cyan,
        selectionHandleColor: Colors.cyan,
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        primaryColor: Colors.cyan,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
            Size(150.0, 60.0),
          ),
          side: MaterialStateProperty.resolveWith(
            (Set<MaterialState> state) {
              if (state.contains(MaterialState.disabled)) {
                return BorderSide(
                  color: Colors.grey,
                );
              }
              return BorderSide(
                color: Colors.cyan,
              );
            },
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          textStyle: MaterialStateProperty.resolveWith(
            (Set<MaterialState> state) {
              if (state.contains(MaterialState.disabled)) {
                return Theme.of(context).textTheme.button?.copyWith(
                      color: Colors.grey,
                    );
              }
              return Theme.of(context).textTheme.button?.copyWith(
                    color: Colors.cyan,
                  );
            },
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            Theme.of(context).textTheme.button?.copyWith(
                  color: Colors.cyan,
                ),
          ),
        ),
      ),
      textTheme: TextTheme(
        headline2: TextStyle(
          fontSize: 28.0,
          color: Colors.black,
        ),
        headline5: TextStyle(
          fontSize: 24.0,
          color: Colors.black,
        ),
        bodyText2: TextStyle(
          fontSize: 18.0,
          color: Colors.black,
        ),
        subtitle1: TextStyle(
          fontSize: 18.0,
          color: Colors.black,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Future<Task> getJsonTask() async {
    try {
      final taskJson = await rootBundle.loadString('assets/Example_json.json');
      final taskMap = json.decode(taskJson);

      return Task.fromJson(taskMap);
    } catch (e, s) {
      print('exception $e');
      print("stck " + s.toString());
      return Task.fromJson({});
    }
  }
}

const task_3 = {
  "id": "123",
  "type": "navigable",
  "rules": [
    {
      "type": "conditional",
      "triggerStepIdentifier": {"id": "3"},
      "values": {"Yes": "2", "No": "10"}
    },
    {
      "type": "direct",
      "triggerStepIdentifier": {"id": "1"},
      "destinationStepIdentifier": {"id": "3"}
    },
    {
      "type": "direct",
      "triggerStepIdentifier": {"id": "2"},
      "destinationStepIdentifier": {"id": "10"}
    }
  ],
  "steps": [
    {
      "stepIdentifier": {"id": "1"},
      "type": "intro",
      "title": "Welcome to the\nMind Happiness\nSurvey",
      "text": "Get ready for a bunch of super random questions!",
      "buttonText": "Let's go!"
    },
    {
      "stepIdentifier": {"id": "2"},
      "type": "question",
      "title": "How old are you?",
      "answerFormat": {"type": "integer", "hint": "Please enter your age"}
    },
    {
      "stepIdentifier": {"id": "3"},
      "type": "question",
      "title": "Medication?",
      "text": "Are you using any medication",
      "answerFormat": {
        "type": "bool",
        "positiveAnswer": "Yes",
        "negativeAnswer": "No",
        "result": "POSITIVE"
      }
    },
    {
      "stepIdentifier": {"id": "4"},
      "type": "question",
      "title": "Tell us about you",
      "text": "Tell us about yourself and why you want to improve your health.",
      "answerFormat": {"type": "text"}
    },
    {
      "stepIdentifier": {"id": "5"},
      "type": "question",
      "title": "\nLife Satisfaction\n",
      "text": "Are you satisfied with your daily performance?",
      "answerFormat": {
        "type": "scale",
        "step": 1,
        "minimumValue": 1,
        "maximumValue": 5,
        "defaultValue": 3,
        "minimumValueDescription": '1',
        "maximumValueDescription": '5'
      }
    },
    {
      "stepIdentifier": {"id": "6"},
      "type": "question",
      "title": "\nLife Satisfaction\n",
      "text": "How happy did you feel yesterday?",
      "answerFormat": {
        "type": "scale",
        "step": 1,
        "minimumValue": 1,
        "maximumValue": 5,
        "defaultValue": 3,
        "minimumValueDescription": '1',
        "maximumValueDescription": '5'
      }
    },
    {
      "stepIdentifier": {"id": "7"},
      "type": "question",
      "title": "\nLife Satisfaction\n",
      "text": "How satisfied are you with your life?",
      "answerFormat": {
        "type": "scale",
        "step": 1,
        "minimumValue": 1,
        "maximumValue": 5,
        "defaultValue": 3,
        "minimumValueDescription": '1',
        "maximumValueDescription": '5'
      }
    },
    {
      "stepIdentifier": {"id": "8"},
      "type": "question",
      "title": "\nPsychological Well Being\n",
      "text": "I lead a purposeful & meaningful life",
      "answerFormat": {
        "type": "multiple",
        "textChoices": [
          {'text': '', 'value': ''}
        ],
      }
    },
    {
      "stepIdentifier": {"id": "9"},
      "type": "question",
      "title": "\nPsychological Well Being\n",
      "text": "I am engaged and interested in my daily life",
      "answerFormat": {
        "type": "multiple",
        "textChoices": [
          {'text': '', 'value': ''}
        ],
      }
    },
    {
      "stepIdentifier": {"id": "10"},
      "type": "question",
      "title": "\nPsychological Well Being\n",
      "text": "I am optimistic about my life",
      "answerFormat": {
        "type": "multiple",
        "textChoices": [
          {'text': '', 'value': ''}
        ],
      }
    },
    {
      "stepIdentifier": {"id": "11"},
      "type": "question",
      "title": "\nPsychological Well Being\n",
      "text":
          "Most days I feel a sense of accomplishment from my daily activities",
      "answerFormat": {
        "type": "multiple",
        "textChoices": [
          {'text': '', 'value': ''}
        ],
      }
    },
    {
      "stepIdentifier": {"id": "12"},
      "type": "question",
      "title": "\nPsychological Well Being\n",
      "text": "In general, I feel very optimistic about myself",
      "answerFormat": {
        "type": "multiple",
        "textChoices": [
          {'text': '', 'value': ''}
        ],
      }
    },
    {
      "stepIdentifier": {"id": "13"},
      "type": "question",
      "title": "\nPsychological Well Being\n",
      "text": "I lead a purposeful & meaningful life",
      "answerFormat": {
        "type": "multiple",
        "textChoices": [
          {'text': '', 'value': ''}
        ],
      }
    },
    {
      "stepIdentifier": {"id": "14"},
      "type": "question",
      "title": "Done?",
      "text": "We are done, do you mind to tell us more about yourself?",
      "answerFormat": {
        "type": "single",
        "positiveAnswer": "Yes",
        "negativeAnswer": "No",
        "result": "POSITIVE",
        "textChoices": [
          {'text': '', 'value': ''}
        ],
      }
    },
    {
      "stepIdentifier": {"id": "15"},
      "type": "question",
      "title": "\nHealth\n",
      "text": "When did you wake up?",
      "answerFormat": {
        "type": "time",
        "defaultValue": {
          "hour": 12,
          "minute": 12,
        }
      }
    },
    {
      "stepIdentifier": {"id": "16"},
      "type": "question",
      "title": "\nHealth\n",
      "text": "How is your health?",
      "answerFormat": {
        "type": "multiple",
        "textChoices": [
          {'text': '', 'value': ''}
        ],
      }
    },
    {
      "stepIdentifier": {"id": "16"},
      "type": "question",
      "title": "\nHealth\n",
      "text":
          "Please indicate how much of the time you had a lot of energy during the past week?",
      "answerFormat": {
        "type": "multiple",
        "textChoices": [
          {'text': '', 'value': ''}
        ],
      }
    },
    {
      "stepIdentifier": {"id": "17"},
      "type": "question",
      "title": "When was your last holiday?",
      "answerFormat": {
        "type": "date",
        "minDate": "1970-02-27",
      }
    },
    {
      "stepIdentifier": {"id": "18"},
      "type": "question",
      "title": "\nPlease rate your level of satisfaction\n",
      "text":
          "How satisfied were you with your ability to perform to perform daily living activities?",
      "answerFormat": {
        "type": "multiple",
        "textChoices": [
          {'text': '', 'value': ''}
        ],
      }
    },
    {
      "stepIdentifier": {"id": "19"},
      "type": "completion",
      "text": "Thanks for taking the survey, we will contact you soon!",
      "title": "Done!",
      "buttonText": "Submit survey",
      'assetPath': 'some asset path'
    }
  ]
};
