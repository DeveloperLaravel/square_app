import '../domain/question.dart';

final List<Question> questions = [
  Question(
    question: 'ما هو مستوى خبرتك في Flutter؟',
    answers: [
      Answer(text: 'مبتدئ جدًا', value: 1),
      Answer(text: 'مبتدئ', value: 2),
      Answer(text: 'متوسط', value: 3),
      Answer(text: 'جيد', value: 4),
      Answer(text: 'محترف', value: 5),
    ],
  ),
   Question(
    question: 'كم تستطيع أن تكتب كود Flutter؟',
    answers: [
      Answer(text: 'لا أستطيع', value: 1),
      Answer(text: 'قليل', value: 2),
      Answer(text: 'متوسط', value: 3),
      Answer(text: 'جيد', value: 4),
      Answer(text: 'ممتاز', value: 5),
    ],
  ),
   Question(
    question: 'ما مدى فهمك لـ StatefulWidget؟',
    answers: [
      Answer(text: 'لا أعرف', value: 1),
      Answer(text: 'قليل', value: 2),
      Answer(text: 'متوسط', value: 3),
      Answer(text: 'جيد', value: 4),
      Answer(text: 'ممتاز', value: 5),
    ],
  ),
];
