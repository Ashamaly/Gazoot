require './questions'
require './messages'
require 'artii'
require 'colorize'
include EasyQs, MediumQs, HardQs, Messages

#test
#class to set each question, refactor this shit
class Quiz
    attr_accessor :question, :answer

    def initialize(question, answer)
        @question = question
        @answer = answer
    end
end


#question sets for each difficulty
#basic but works, would be better off implementing a hash with the question as a key and the answer as a value
#modularize this
@qeasy = [
    Quiz.new(firstset[0], "true"),
    Quiz.new(firstset[1], "true"),
    Quiz.new(firstset[2], "false")
]

@qmedium =[
    Quiz.new(secondset[0], "a"),
    Quiz.new(secondset[1], "c"),
    Quiz.new(secondset[2], "d")
]

@qhard = [
    Quiz.new(thirdset[0], "sock"),
    Quiz.new(thirdset[1], "horse"),
    Quiz.new(thirdset[2], "aphasia")
]

    
#use to execute the selected quiz difficulty
def Quizstart(qdif)
    answer = ""
    score = 0
    mscore = 0
    mhp = qdif.length * 10
    php = qdif.length * 10
    num = 1
    t1 = Time.now #set time the quiz started
    for quiz in qdif
        #display the question number
        puts "\n Question #{num} \n"
        num += 1 
        puts quiz.question
        answer = gets.chomp.downcase() #downcase so that True and true or false and False come out correct
        status = "You have #{php}hp and the monster has #{mhp}hp!"
         if answer == quiz.answer
            score += 1
            puts "You attack the monster!".colorize(:green)
         else
            puts "The monster hits you!".colorize(:red)
            mscore += 1
         end

    end

    t2 = Time.now #set the time that the quiz was completed
    t3 = t2 - t1 #take the start time from the end time to find time elapsed

    #based on speed of quiz completion, set attack modifier
    if t3 <= 10
        dmg = 20
    elsif t3 <= 15
        dmg = 10
    else
        dmg = 5
    end

    #attack the monster
    mhp = mhp - (dmg * score)
    #monster fights back
    php = php - (dmg * mscore)

    #display victory if monsters hp depleted and defeat if the monster survives
    if mhp < 1
        Messages.victory()
    elsif php <= 0
        Messages.defeat()  
    else
        puts "\n The monster got away...".colorize(:red)
        Messages.defeat()
    end
    
    #Display the score of the quiz, time elapsed and the attack bonus they got
    puts "You got #{score} out of #{qdif.length} correct and finished in #{t3.round} seconds!"
    puts "That means you made #{score} attacks and dealt #{dmg} damage with each one and the monster hit you #{mscore} times!"

    #ask if player wants to play again, clearing terminal and restarting if y and aborting with goodbye message if n
    puts "Play again? [Y/N]"

    loop do
        repeat = gets.chomp.downcase
        case repeat 
        when "n", "no"
            abort "Thanks for playing!"
        when "y", "yes"
            system "clear"
            Difficulty()
        else
            puts "Type Y or N"
        end
    end

end 

#use loop to ask player for difficulty and only accepts the strings "Easy", "medium" or "hard"

def Difficulty()
    puts "Choose your difficulty or type 'quit' to exit!"
puts "Easy | Medium | Hard"
loop do
    response = gets.chomp.downcase
        case response
        when "easy", "e"
                Quizstart(@qeasy)
        when "medium", "med", "m"
                Quizstart(@qmedium)
        when "hard", "h"
                Quizstart(@qhard)
        when "quit", "q"
            abort "Thanks for playing!"
            else
                puts "Type Easy, Medium or Hard to continue or Quit to exit!"
        end
    end
end

#use artii to setup a basic welcome screen and difficulty select
Messages.welcome
Difficulty()