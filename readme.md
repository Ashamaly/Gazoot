# Gazoot Ruby Application 

## Description

Gazoot is a quiz/action hybrid created using Ruby where answering questions correctly (and quickly!) allow you to attack and take down a monster! Winning the game involves answering enough questions to take the monsters health down to 0, with faster players being rewarded with a higher attack multiplier. This game was created as a way to review what was learnt in my first 2 weeks at Coder Academy and put it into practice.

Initially my first idea for an application was a workout tracker but I struggled to find motivation to complete and find a way to sufficiently meet the criteria of the assessment so the idea was scrapped in favour of Gazoot.

## Features

* Different quiz for each difficulty
* Recieve text input to select difficulty
* Display health of Player and Monster
* Victory and Defeat screens with final score
* Display time taken to finish quiz
* Reward user for completing quiz quickly
* Use of Ruby Gems colorize and artii

## User Interaction

Gazoot starts initially with a welcome screen before the player is prompted to select a difficulty, with each difficulty has a different set of questions to answer. 

<img src="img/welcome.png">

Selecting a difficulty will then bring the user to the quiz, where they can input their desired answer to each question. A message will be displayed depending on whether or not the answer is correct

<img src="img/questions.png">

After the quiz has been completed, a screen will appear with details of how many answers were correct, the attack bonus they achieved and if they were successful in defeating the monster or if they failed.

<img src="img/victory.png">

<img src="img/defeat.png">
