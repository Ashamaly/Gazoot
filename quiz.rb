require './questions'
require './messages'
require 'artii'
require 'colorize'
include EasyQs, MediumQs, HardQs, Messages

#class to set each question
class Quiz
    attr_accessor :question, :answer

    def initialize(question, answer)
        @question = question
        @answer = answer
    end
end


#question sets for each difficulty
#basic but works, would be better off implementing a hash with the question as a key and the answer as a value
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
    mhp = qdif.length * 10
    php = qdif.length * 10
    num = 1
    for quiz in qdif
        #display the question number
        puts "\n Question #{num} \n"
        num += 1 
        puts quiz.question
        answer = gets.chomp.downcase() #downcase so that True and true or false and False come out correct
        status = "You have #{php}hp and the monster has #{mhp}hp!"
         if answer == quiz.answer
            score += 1
            mhp -= 10
            puts "You attack the monster for 10 damage!".colorize(:green)
            sleep 0.5
            puts status
         else
            puts "The monster hits you for 10 damage!".colorize(:red)
            php -= 10
            sleep 0.5
            puts status
         end

    end

    #display victory if monsters hp == 0 and defeat if players health == 0
    if mhp < 1
        Messages.victory()
    elsif php <= 0
        Messages.defeat()  
    else
        puts "\n The monster got away...".colorize(:red)
        Messages.defeat()
    end
    puts "You got #{score} out of #{qdif.length} correct!"

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
        when "easy"
                Quizstart(@qeasy)
        when "medium"
                Quizstart(@qmedium)
        when "hard"
                Quizstart(@qhard)
        when "quit"
            abort "Thanks for playing!"
            else
                puts "Type Easy, Medium or Hard to continue or Quit to exit!"
        end
    end
end

#use artii to setup a basic welcome screen and difficulty select
Messages.welcome
Difficulty()