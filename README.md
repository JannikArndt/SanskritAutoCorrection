# Sanskrit Auto-Correction for iOS

This app lets you add all the Sanskrit terms that a yoga teacher might need to the user dictionary of your iOS device.

Turn this:

<img src="images/before.png" alt="before" width="200px">

into this:

<img src="images/after.png" alt="after" width="200px">

Download on the App Store now:

<a href="https://apps.apple.com/us/app/sanskrit-auto-correction/id6463236136" target="_blank"><img src="https://developer.apple.com/app-store/marketing/guidelines/images/badge-example-preferred_2x.png" alt="after" width="200px"></a>

### How to use

To prevent apps from flooding your dictionary, the terms don't immediately appear as suggestions. At first, the words are simply not marked as _wrong_ anymore.

After you type a word ~2 times, it will appear as a suggestion as well.

### Technical details

The code uses `UITextChecker.learnWord()` and `UITextChecker.unlearnWord()`.
Find more details in Apple's documentation: https://developer.apple.com/documentation/uikit/uitextchecker/1621028-learnword

### Contributing

The terms/words are defined in [`Sanskrit Auto-Correction/terms`](https://github.com/JannikArndt/SanskritAutoCorrection/tree/main/Sanskrit%20Auto-Correction/terms). You can create a pull request to add words to existing categories or add whole categories.
I will review the words, so if they aren't easily findable on Google, please provide references.