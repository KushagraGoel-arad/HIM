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
                  return SurveyKit(
                    onResult: (SurveyResult result) {
                      print(result.finishReason);
                      Navigator.pushNamed(context, '/');
                    },
                    task: task,
                    showProgress: true,
                    localizations: {
                      'cancel': 'Cancel',
                      'next': 'Next',
                    },
                    themeData: Theme.of(context).copyWith(
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
                                return Theme.of(context)
                                    .textTheme
                                    .button
                                    ?.copyWith(
                                      color: Colors.grey,
                                    );
                              }
                              return Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(
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
                    ),
                    surveyProgressbarConfiguration: SurveyProgressConfiguration(
                      backgroundColor: Colors.white,
                    ),
                  );
                }
                return CircularProgressIndicator.adaptive();
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<Task> getSampleTask() {
    var task = NavigableTask(
      id: TaskIdentifier(),
      steps: [
        InstructionStep(
          title: 'Welcome to the\nMind Happiness\nSurvey',
          text: 'Get ready for a bunch of super random questions!',
          buttonText: 'Let\'s go!',
        ),
        QuestionStep(
          title: 'How old are you?',
          answerFormat: IntegerAnswerFormat(
            hint: 'Please enter your age',
          ),
          isOptional: true,
        ),
        QuestionStep(
          title: 'Medication?',
          text: 'Are you using any medication',
          answerFormat: BooleanAnswerFormat(
            positiveAnswer: 'Yes',
            negativeAnswer: 'No',
            result: BooleanResult.POSITIVE,
          ),
        ),
        QuestionStep(
          title: 'Tell us about you',
          text:
              'Tell us about yourself and why you want to improve your health.',
          answerFormat: TextAnswerFormat(
            maxLines: 5,
            validationRegEx: "^(?!\s*\$).+",
          ),
        ),

        //Satisfaction Type questions

        QuestionStep(
          title: '\nLife Satisfaction\n',
          text: 'Are you satisfied with your daily performance?',
          answerFormat: ScaleAnswerFormat(
            step: 1,
            minimumValue: 1,
            maximumValue: 5,
            defaultValue: 3,
            minimumValueDescription: '1',
            maximumValueDescription: '5',
          ),
        ),
        QuestionStep(
          title: '\nLife Satisfaction\n',
          text: 'How happy did you feel yesterday?',
          answerFormat: ScaleAnswerFormat(
            step: 1,
            minimumValue: 1,
            maximumValue: 5,
            defaultValue: 3,
            minimumValueDescription: '1',
            maximumValueDescription: '5',
          ),
        ),
        QuestionStep(
          title: '\nLife Satisfaction\n',
          text: 'How satisfied are you with your life?',
          answerFormat: ScaleAnswerFormat(
            step: 1,
            minimumValue: 1,
            maximumValue: 5,
            defaultValue: 3,
            minimumValueDescription: '1',
            maximumValueDescription: '5',
          ),
        ),

        QuestionStep(
          title: '\nPsychological Well Being\n',
          text: 'I lead a purposeful & meaningful life',
          isOptional: false,
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Strongly disagree', value: 'Strongly disagree'),
              TextChoice(text: 'Disagree', value: 'Disagree'),
              TextChoice(
                  text: 'Neither Agree nor  Disagree',
                  value: 'Neither Agree nor  Disagree'),
              TextChoice(text: 'Agree', value: 'Agree'),
              TextChoice(text: 'Strongly Agree', value: 'Strongly Agree'),
            ],
          ),
        ),
        QuestionStep(
          title: '\nPsychological Well Being\n',
          text: 'I am engaged and interested in my daily life',
          isOptional: false,
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Strongly disagree', value: 'Strongly disagree'),
              TextChoice(text: 'Disagree', value: 'Disagree'),
              TextChoice(
                  text: 'Neither Agree nor  Disagree',
                  value: 'Neither Agree nor  Disagree'),
              TextChoice(text: 'Agree', value: 'Agree'),
              TextChoice(text: 'Strongly Agree', value: 'Strongly Agree'),
            ],
          ),
        ),
        QuestionStep(
          title: '\nPsychological Well Being\n',
          text: 'I am optimistic about my life',
          isOptional: false,
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Strongly disagree', value: 'Strongly disagree'),
              TextChoice(text: 'Disagree', value: 'Disagree'),
              TextChoice(
                  text: 'Neither Agree nor  Disagree',
                  value: 'Neither Agree nor  Disagree'),
              TextChoice(text: 'Agree', value: 'Agree'),
              TextChoice(text: 'Strongly Agree', value: 'Strongly Agree'),
            ],
          ),
        ),
        QuestionStep(
          title: '\nPsychological Well Being\n',
          text:
              'Most days I feel a sense of accomplishment from my daily activities',
          isOptional: false,
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Strongly disagree', value: 'Strongly disagree'),
              TextChoice(text: 'Disagree', value: 'Disagree'),
              TextChoice(
                  text: 'Neither Agree nor  Disagree',
                  value: 'Neither Agree nor  Disagree'),
              TextChoice(text: 'Agree', value: 'Agree'),
              TextChoice(text: 'Strongly Agree', value: 'Strongly Agree'),
            ],
          ),
        ),
        QuestionStep(
          title: '\nPsychological Well Being\n',
          text: 'In general, I feel very optimistic about myself',
          isOptional: false,
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Strongly disagree', value: 'Strongly disagree'),
              TextChoice(text: 'Disagree', value: 'Disagree'),
              TextChoice(
                  text: 'Neither Agree nor  Disagree',
                  value: 'Neither Agree nor  Disagree'),
              TextChoice(text: 'Agree', value: 'Agree'),
              TextChoice(text: 'Strongly Agree', value: 'Strongly Agree'),
            ],
          ),
        ),
        QuestionStep(
          title: '\nPsychological Well Being\n',
          text: 'I lead a purposeful & meaningful life',
          isOptional: false,
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Strongly disagree', value: 'Strongly disagree'),
              TextChoice(text: 'Disagree', value: 'Disagree'),
              TextChoice(
                  text: 'Neither Agree nor  Disagree',
                  value: 'Neither Agree nor  Disagree'),
              TextChoice(text: 'Agree', value: 'Agree'),
              TextChoice(text: 'Strongly Agree', value: 'Strongly Agree'),
            ],
          ),
        ),

        QuestionStep(
          title: 'Done?',
          text: 'We are done, do you mind to tell us more about yourself?',
          isOptional: true,
          answerFormat: SingleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Yes', value: 'Yes'),
              TextChoice(text: 'No', value: 'No'),
            ],
            defaultSelection: TextChoice(text: 'No', value: 'No'),
          ),
        ),
        QuestionStep(
          title: '\nHealth\n',
          text: 'When did you wake up?',
          answerFormat: TimeAnswerFormat(
            defaultValue: TimeOfDay(
              hour: 12,
              minute: 0,
            ),
          ),
        ),
        QuestionStep(
          title: '\nHealth\n',
          text: 'How is your health?',
          isOptional: false,
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Poor', value: 'Poor'),
              TextChoice(text: 'Fair', value: 'Fair'),
              TextChoice(text: 'Good', value: 'Good'),
              TextChoice(text: 'Very Good', value: 'Very Good'),
              TextChoice(text: 'Excellent', value: 'Excellent'),
            ],
          ),
        ),
        QuestionStep(
          title: '\nHealth\n',
          text:
              'Please indicate how much of the time you had a lot of energy during the past week?',
          isOptional: false,
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Very rarely', value: 'Very rarely'),
              TextChoice(text: 'Rarely', value: 'Rarely'),
              TextChoice(text: 'Sometimes', value: 'Sometimes'),
              TextChoice(text: 'Often', value: 'Often'),
              TextChoice(text: 'Very Often', value: 'Very Often'),
              TextChoice(text: 'Always', value: 'Always'),
            ],
          ),
        ),
        QuestionStep(
          title: 'When was your last holiday?',
          answerFormat: DateAnswerFormat(
            minDate: DateTime.utc(1970),
            defaultDate: DateTime.now(),
            maxDate: DateTime.now(),
          ),
        ),
        QuestionStep(
          title: '\nPlease rate your level of satisfaction\n',
          text:
              'How satisfied were you with your ability to perform to perform daily living activities?',
          isOptional: false,
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Very dissatisfied', value: 'Very dissatisfied'),
              TextChoice(text: 'Dissatisfied', value: 'Dissatisfied'),
              TextChoice(text: 'Neither', value: 'Neither'),
              TextChoice(text: 'Satisfied', value: 'Satisfied'),
              TextChoice(text: 'Very Satisfied', value: 'Very Satisfied'),
            ],
          ),
        ),
        CompletionStep(
          stepIdentifier: StepIdentifier(id: '321'),
          text: 'Thanks for taking the survey, we will contact you soon!',
          title: 'Done!',
          buttonText: 'Submit survey',
        ),
      ],
    );
    task.addNavigationRule(
      forTriggerStepIdentifier: task.steps[18].stepIdentifier,
      navigationRule: ConditionalNavigationRule(
        resultToStepIdentifierMapper: (input) {
          switch (input) {
            case "Yes":
              return task.steps[0].stepIdentifier;
            case "No":
              return task.steps[18].stepIdentifier;
            default:
              return null;
          }
        },
      ),
    );
    return Future.value(task);
  }

  Future<Task> getJsonTask() async {
    final taskJson = await rootBundle.loadString('assets/Example_json.json');
    final taskMap = json.decode(taskJson);

    return Task.fromJson(taskMap);
  }
}
