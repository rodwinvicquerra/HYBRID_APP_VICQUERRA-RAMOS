import 'scene.dart';

class StoryBrain {
  int _currentScene = 0;

  static final List<Scene> _scenes = [
    // Scene 0 — Start (Decision Point 1)
    Scene(
      storyText:
          '📱 Oh no! It\'s 4:30 PM and your final IT project is due at 5:00 PM.\n\n'
          'You reach into your bag... YOUR FLASH DRIVE IS GONE! 😱\n\n'
          'You start to panic. You had it this morning but now it\'s nowhere to be found.\n\n'
          'Where will you look first?',
      imagePath: 'assets/images/scene_0.png',
      choices: ['🏫 Go to the Library', '🍜 Go to the Cafeteria'],
      nextScenes: [1, 2],
    ),

    // Scene 1 — Library (Decision Point 2)
    Scene(
      storyText:
          '📚 You rush into the quiet library. The librarian looks up and whispers,\n'
          '"Looking for something? I saw a student near the dark hallway earlier..."\n\n'
          'You notice the hallway she pointed to — it\'s dark and eerie.\n'
          'But you also see the table where you studied yesterday morning!\n\n'
          'What do you do?',
      imagePath: 'assets/images/scene_1.png',
      choices: [
        '🔦 Walk into the dark hallway',
        '🪑 Check the table where I sat',
      ],
      nextScenes: [3, 4],
    ),

    // Scene 2 — Cafeteria (Decision Point 3)
    Scene(
      storyText:
          '🍽️ The cafeteria is loud and packed with students.\n\n'
          'You spot your classmate MARK sitting alone, eating pancit canton.\n'
          'He was your project partner yesterday — he might know something!\n\n'
          'But you\'re also really hungry and the arroz caldo smells amazing...\n\n'
          'What will you do?',
      imagePath: 'assets/images/scene_2.png',
      choices: ['🙋 Ask Mark for help', '🍚 Ignore Mark and buy a snack'],
      nextScenes: [5, 6],
    ),

    // Scene 3 — Dark Hallway (Decision Point 4)
    Scene(
      storyText:
          '😰 The hallway is dark and cold. Your footsteps echo with every step.\n\n'
          'Suddenly, at the end of the hallway, you see a GLOWING PORTAL!\n'
          'It pulses with blue and purple light, humming softly.\n\n'
          'A whisper in the air says: "Your destiny lies beyond..."\n\n'
          'Do you dare enter? Or run back to safety?',
      imagePath: 'assets/images/scene_3.png',
      choices: ['✨ Enter the glowing portal', '🏃 Run back to safety'],
      nextScenes: [7, 8],
    ),

    // Scene 4 — Found under table (Ending: Good 1)
    Scene(
      storyText:
          '🎉 You crawl under the table and — THERE IT IS!\n\n'
          'Your flash drive was stuck between the chair leg and the floor!\n\n'
          'You grab it, shove it in your laptop, and SPRINT to your professor\'s room.\n\n'
          '"Submitted with 3 minutes to spare!" your professor smiles.\n\n'
          'You did it! You saved your grade! 🏆',
      imagePath: 'assets/images/scene_4.png',
      isEnding: true,
      endingType: 'good',
      endingTitle: 'Submitted On Time!',
      endingMessage:
          'You found your flash drive under the library table and submitted your project with 3 minutes to spare. Your hard work paid off!',
    ),

    // Scene 5 — Mark returns it (Ending: Good 2)
    Scene(
      storyText:
          '😅 Mark looks embarrassed.\n\n'
          '"Oh... about that," he says, reaching into his bag.\n'
          '"I accidentally grabbed it yesterday when we were packing up. Sorry!"\n\n'
          'He hands you the flash drive.\n\n'
          'You forgive him immediately, plug it into your laptop, and submit with\n'
          '5 minutes to spare!\n\n'
          '"We\'re still best friends," you tell him. 🤝',
      imagePath: 'assets/images/scene_5.png',
      isEnding: true,
      endingType: 'good',
      endingTitle: 'Mark Saved the Day!',
      endingMessage:
          'Your classmate Mark had accidentally taken your flash drive. He returned it and you submitted your project just in time!',
    ),

    // Scene 6 — Wasted time (Ending: Bad)
    Scene(
      storyText:
          '🍚 The arroz caldo is warm and delicious...\n\n'
          'You lose track of time eating and chatting with strangers.\n\n'
          'You check your phone — 5:01 PM. 😱\n\n'
          '"DEADLINE MISSED!" flashes on the school portal.\n\n'
          'Your professor shakes his head sadly.\n'
          '"You\'ll have to retake the subject next semester."\n\n'
          'The snack was NOT worth it. 💀',
      imagePath: 'assets/images/scene_6.png',
      isEnding: true,
      endingType: 'bad',
      endingTitle: 'You Missed the Deadline!',
      endingMessage:
          'You wasted too much time buying snacks and missed the 5:00 PM deadline. The project was not accepted.',
    ),

    // Scene 7 — Enter portal (Ending: Weird/Bad)
    Scene(
      storyText:
          '⚡ You take a deep breath and STEP INTO THE PORTAL!\n\n'
          'FLASH! You\'re now wearing armor in a magical kingdom.\n'
          'A fairy appears: "Welcome, Chosen One! You must defeat the Dragon of Deadlines!"\n\n'
          'You look at your hands — you\'re holding a sword, not a laptop.\n\n'
          '"Wait, what about my IT project?!"\n\n'
          'The fairy shrugs. "What\'s an IT project?"\n\n'
          'You failed IT class but became a legendary warrior. ⚔️',
      imagePath: 'assets/images/scene_7.png',
      isEnding: true,
      endingType: 'weird',
      endingTitle: 'Transported to Another Dimension!',
      endingMessage:
          'You stepped through the portal and got transported to a fantasy kingdom. You became a warrior... but failed IT class.',
    ),

    // Scene 8 — Run away (Ending: Neutral)
    Scene(
      storyText:
          '😤 Nope. Portals are NOT part of your plans today.\n\n'
          'You sprint back to the library entrance, heart pounding.\n\n'
          'You search everywhere — every classroom, every hallway — but the flash drive is gone.\n\n'
          'With no other option, you email your professor:\n'
          '"Sir, I lost my flash drive. I\'m very sorry."\n\n'
          'He replies: "Okay. Retake the subject next term."\n\n'
          'At least you\'re still in this dimension. 🤷',
      imagePath: 'assets/images/scene_8.png',
      isEnding: true,
      endingType: 'neutral',
      endingTitle: 'Lost Forever...',
      endingMessage:
          'You escaped the portal but never found your flash drive. You\'ll have to retake the IT subject next semester.',
    ),
  ];

  // Public methods
  String getStoryText() => _scenes[_currentScene].storyText;

  List<String> getChoices() => _scenes[_currentScene].choices;

  String getImagePath() => _scenes[_currentScene].imagePath;

  bool isGameOver() => _scenes[_currentScene].isEnding;

  String getEndingType() => _scenes[_currentScene].endingType;

  String getEndingTitle() => _scenes[_currentScene].endingTitle;

  String getEndingMessage() => _scenes[_currentScene].endingMessage;

  int getCurrentSceneIndex() => _currentScene;

  void nextScene(int choiceIndex) {
    final choices = _scenes[_currentScene].nextScenes;
    if (choiceIndex < choices.length) {
      _currentScene = choices[choiceIndex];
    }
  }

  void restart() {
    _currentScene = 0;
  }
}
