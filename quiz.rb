require './questions'
require './messages'
require 'artii'
require 'colorize'
include EasyQs, MediumQs, HardQs, Messages

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
    mhp = 30
    php = 30

    for quiz in qdif
        # 2 different timer variations, neither work, revisit later on and try curses
        # t = Time.new(0)
        #     battlecount = 10 # seconds until auto loss

        #     battlecount.downto(0) do |seconds|
        #     print (t + seconds).strftime('%M:%S') + "\r"
        #     sleep 1
        #     end
        # timer = Thread.new do
        #     5.downto(0) do |i|
        #       puts "00:#{'%02d' % i}"
        #       sleep 1
        #     end
        #     puts 'Time is up'
        #   end

        puts quiz.question
        answer = gets.chomp()
        status = "You have #{php}hp and the monster has #{mhp}hp!"
         if answer == quiz.answer
            score += 1
            mhp -= 10
            puts "You attack the monster!".colorize(:green)
            sleep 0.5
            puts status
         else
            puts "The monster hits you!".colorize(:red)
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
        when "n"
            abort "Thanks for playing!"
        when "y"
            system "clear"
            Difficulty()
        else
            puts "Type Y or N"
        end
    end

end 

#use loop to ask player for difficulty and only accepts the strings "Easy", "medium" or "hard"
def Difficulty()
    puts "How difficult would you like your fight to be?"
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
            break
            else
                puts "Type Easy, Medium or Hard to continue!"
        end
    end
end

#use artii to setup a basic welcome screen and difficulty select
Messages.welcome
Difficulty()