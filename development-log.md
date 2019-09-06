# Development log

## Project start

Basic design has been drawn out, detailing the basic structure of the app. Using the colorize and artii gems message screens will be created for use throughout the app namely a "Welcome" screen and a "Victory" or "Defeat" screen. The app will welcome and prompt the player for a difficulty input before starting a quiz of the desired difficulty. At the quiz resolution score and time will be taken into account for a fight that will take place between the player and a monster before displaying the correct victory/defeat screen.

## Update 1

Created arrays for questions of each difficulty and a basic method that will create a quiz based on user input. The quiz displays wrong/right for each input and increments a score for either the player or the monster based on the answer.

## Update 2

Added welcome, victory and defeat screens for each condition. Looped the quiz so that you can play a different difficulty again after completion or quit. Added timer that counted down during each question but scrapped it in favour of a timer that returns how long it took to complete the quiz. Correct or incorrect questions take a flat amount from monster or players health.

## Update 3

Changed attacks to be made at the end of the quiz with an attack multiplier being applied based on the speed it took you to complete the quiz. This applies to both the monster and the player. Added downcase to get inputs to avoid case senstivity. Additional comments added to code because I kept getting lost.