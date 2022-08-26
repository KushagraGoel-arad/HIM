import 'package:flutter/material.dart';
import 'package:survey_kit/survey_kit.dart';

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
        text: 'Tell us about yourself and why you want to improve your health.',
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
            minute: 12,
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
            return task.steps[20].stepIdentifier;
          default:
            return null;
        }
      },
    ),
  );
  return Future.value(task);
}
