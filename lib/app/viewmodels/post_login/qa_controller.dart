import 'package:get/get.dart';
import 'package:o_woman/app/models/post_signup_model.dart';
import 'package:o_woman/constants/images_url.dart';

class QAController extends GetxController {
  var questions = <Question>[].obs;

  var selectedAnswers =
      <int, String>{}.obs; // Map to store selected answers for each question

  void selectAnswer(int questionId, String answerIndex) {
    if (selectedAnswers[questionId] == answerIndex) {
      selectedAnswers[questionId] = "";
      return;
    }
    selectedAnswers[questionId] = answerIndex;
    print("The reasponse data we are sending is$answerIndex");
  }

  var currentIndex = 0.obs;
  var JSONData = {
    "message": "Fetch success",
    "data": [
      {
        "question":
            "How would you describe the flow of your menstrual periods (choose one):",
        "questionOption": [
          {"answer": "Light", "aid": 1},
          {"answer": "Moderate", "aid": 2},
          {"answer": "Heavy", "aid": 3}
        ],
        "qid": 1,
        "imageUrl": ImagesUrl.menstrualFastImages,
      },
      {
        "question":
            "Have you ever experienced irregularities in your menstrual cycle, such as missed periods or unpredictable timing (choose one):",
        "questionOption": [
          {"answer": "Yes", "aid": 4},
          {"answer": "No", "aid": 5}
        ],
        "qid": 2,
        "imageUrl": ImagesUrl.menstrualSecondImages,
      },
      {
        "question":
            "Do you have any known medical conditions that may affect your menstrual cycle (choose one):",
        "questionOption": [
          {"answer": "Yes", "aid": 6},
          {"answer": "No", "aid": 7}
        ],
        "qid": 3,
        "imageUrl": ImagesUrl.menstrualThird,
      },
      {
        "question":
            "Are you currently using any form of hormonal birth control? If so, which method (choose one):",
        "questionOption": [
          {"answer": "Birth Control Pills", "aid": 8},
          {"answer": "Patch", "aid": 9},
          {"answer": "Injection", "aid": 10},
          {"answer": "Implant", "aid": 11},
          {"answer": "IUD", "aid": 12},
          {
            "answer": "Other (please specify) - Text Box (MIN 3- MAX 50)",
            "aid": 13
          }
        ],
        "qid": 4,
        "imageUrl": ImagesUrl.menstrualFastImages,
      },
      {
        "question":
            "Have you experienced any side effects or changes in your menstrual cycle since starting hormonal birth control (choose one):",
        "questionOption": [
          {"answer": "Yes", "aid": 14},
          {"answer": "No", "aid": 15}
        ],
        "qid": 5,
        "imageUrl": ImagesUrl.menstrualSecondImages,
      },
      {
        "question": "what contraception method are you currently using?",
        "questionOption": [
          {"answer": "Birth Control Pills", "aid": 16},
          {"answer": "Condoms", "aid": 17},
          {"answer": "IUD", "aid": 18},
          {"answer": "Patch", "aid": 19},
          {"answer": "Injection", "aid": 20},
          {"answer": "Implant", "aid": 21}
        ],
        "qid": 6,
        "imageUrl": ImagesUrl.menstrualThird,
      },
      {
        "question": "How often do you monitor your fertility awareness?",
        "questionOption": [
          {"answer": "Daily", "aid": 22},
          {"answer": "Weekly", "aid": 23},
          {"answer": "Monthly", "aid": 24},
          {"answer": "Rarely", "aid": 25},
          {"answer": "Never", "aid": 26}
        ],
        "qid": 7,
        "imageUrl": ImagesUrl.menstrualFastImages,
      },
      {
        "question":
            "How confident are you in identifying your ovulation period?",
        "questionOption": [
          {"answer": "Very Confident", "aid": 27},
          {"answer": "Somewhat Confident", "aid": 28},
          {"answer": "Not Very Confident", "aid": 29},
          {"answer": "Not at all Confident", "aid": 30}
        ],
        "qid": 8,
        "imageUrl": ImagesUrl.menstrualSecondImages,
      },
      {
        "question":
            "How informed do you feel about fertility, and have you used any educational resources to enhance your knowledge",
        "questionOption": [
          {"answer": "Very Informed", "aid": 36},
          {"answer": "Moderately Informed", "aid": 37},
          {"answer": "Slightly Informed", "aid": 38},
          {"answer": "Not Informed at all", "aid": 39}
        ],
        "qid": 10,
        "imageUrl": ImagesUrl.menstrualThird,
      },
      {
        "question": "How would you rate your overall health? ",
        "questionOption": [
          {"answer": "Poor", "aid": 40},
          {"answer": "Fair", "aid": 41},
          {"answer": "Good", "aid": 42},
          {"answer": "Excellent", "aid": 43}
        ],
        "qid": 11,
        "imageUrl": ImagesUrl.menstrualFastImages,
      },
      {
        "question": "Do you have any chronic health conditions?",
        "questionOption": [
          {"answer": "If yes, please specify.", "aid": 44}
        ],
        "qid": 12,
        "imageUrl": ImagesUrl.menstrualSecondImages,
      },
      {
        "question": "Are you currently taking any medications or supplements? ",
        "questionOption": [
          {"answer": "If yes, please list them.", "aid": 45}
        ],
        "qid": 13,
        "imageUrl": ImagesUrl.menstrualSecondImages,
      },
      {
        "question": "Have you undergone any surgeries in the past?",
        "questionOption": [
          {"answer": "If yes, please provide details.", "aid": 46}
        ],
        "qid": 14,
        "imageUrl": ImagesUrl.menstrualFastImages,
      },
      {
        "question": "How often do you consume alcoholic beverages?",
        "questionOption": [
          {"answer": "Regularly", "aid": 47},
          {"answer": "Occasionally", "aid": 48},
          {"answer": "Rarely", "aid": 49},
          {"answer": "Never", "aid": 50}
        ],
        "qid": 15,
        "imageUrl": ImagesUrl.menstrualSecondImages,
      },
      {
        "question":
            "Do you incorporate smoothies or protein shakes into your diet?",
        "questionOption": [
          {"answer": "Regularly", "aid": 51},
          {"answer": "Occasionally", "aid": 52},
          {"answer": "Rarely", "aid": 53}
        ],
        "qid": 16,
        "imageUrl": ImagesUrl.menstrualThird,
      },
      {
        "question":
            "Do you consume hydrating foods (e.g., fruits with high water content) as part of your snacking habits?",
        "questionOption": [
          {"answer": "Regularly", "aid": 54},
          {"answer": "Occasionally", "aid": 55},
          {"answer": "Rarely", "aid": 56}
        ],
        "qid": 17,
        "imageUrl": ImagesUrl.menstrualFastImages,
      },
      {
        "question": "Do you track your daily water intake, and if so, how?",
        "questionOption": [
          {"answer": "Through a Mobile App", "aid": 57},
          {"answer": "Using a Water Bottle with Markings", "aid": 58},
          {"answer": "Not Actively Tracking", "aid": 59}
        ],
        "qid": 18,
        "imageUrl": ImagesUrl.menstrualSecondImages,
      },
      {
        "question":
            "If you've used ovulation prediction kits or fertility tracking apps, how satisfied are you with your experience?",
        "questionOption": [
          {"answer": "Very Satisfied", "aid": 31},
          {"answer": "Satisfied", "aid": 32},
          {"answer": "Neutral", "aid": 33},
          {"answer": "Dissatisfied", "aid": 34},
          {"answer": "Very Dissatisfied", "aid": 35}
        ],
        "qid": 9,
        "imageUrl": ImagesUrl.menstrualThird,
      }
    ],
    "status": "OK",
    "statusCode": 200,
    "timeStamp": null
  }; // Replace with your actual JSON data

  var mapData = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // Parse the JSON data and populate the questions list
    questions.addAll((JSONData['data'] as List<dynamic>).map((item) => Question(
          question: item['question'],
          questionOption: (item['questionOption'] as List<dynamic>)
              .map((option) => QuestionOption(
                    answer: option['answer'],
                    aid: option['aid'],
                  ))
              .toList(),
          qid: item['qid'],
          imageUrl: item['imageUrl'],
        )));
  }

  Question getCurrentQuestion() {
    print(
        "Print current index value pppppppppppppppppp${questions[currentIndex.value].toString()}");
    return questions[currentIndex.value];
  }

  void nextQuestion() {
    // if (currentIndex < questions.length) {
    currentIndex.value ;
    // }
  }

  void previousQuestion() {
    if (currentIndex >= 0) {
      currentIndex.value = currentIndex.value - 1;
      print("Print previous index value lllllllllllll ${currentIndex--}");
    }
  }
}
