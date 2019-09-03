require './questions'
require 'artii'
require 'colorize'
#require 'colorize_string'
include EasyQs, MediumQs, HardQs

class Quiz
    attr_accessor :question, :answer

    def initialize(question, answer)
        @question = question
        @answer = answer
    end
end

#question sets for each difficulty
#basic but works, would be better off implementing a hash with the question as a key and the answer as a value
qeasy = [
    Quiz.new(firstset[0], "true"),
    Quiz.new(firstset[1], "true"),
    Quiz.new(firstset[2], "false")
]

qmedium =[
    Quiz.new(secondset[0], "a"),
    Quiz.new(secondset[1], "c"),
    Quiz.new(secondset[2], "d")
]

qhard = [
    Quiz.new(thirdset[0], "sock"),
    Quiz.new(thirdset[1], "horse"),
    Quiz.new(thirdset[2], "aphasia")
]

#use to execute the selected quiz difficulty
def Quizstart(qdif)
    answer = ""
    score = 0

    # case qdif
    # when "qeasy"
    #     mhp = 1
    #     puts "set"
    # when "qmedium"
    #     mhp = 2
    # when "qhard"
    #     mhp = 3
    # end

    for quiz in qdif
        puts quiz.question
        answer = gets.chomp()
         if answer == quiz.answer
            score += 1
            puts "You attack the monster!".colorize(:green)
         else
            puts "The monster hits you!".colorize(:red)
         end
    end

    puts "You got #{score} out of #{qdif.length} correct!"

    # if score == maxhp
    #     puts "You just managed to kill the monster!".colorize(:blue)
    # elsif score <= maxhp
    #     puts "Unfortunately you have lost.".colorize(:red)
    # elsif score >= maxhp
    #     puts "You have destroyed the monster!".colorize(:yellow)
    # end

end

#use artii to setup a basic welcome screen and difficulty select
a = Artii::Base.new :font => 'slant'
puts "            Welcome to               "
puts a.asciify('Gazoot!')
puts "How difficult would you like your adventure to be?"
puts "Easy | Medium | Hard"          

#use loop to ask player for difficulty and only accepts the strings "Easy", "medium" or "hard"
loop do
response = gets.chomp.downcase
    case response
    when "easy"
            Quizstart(qeasy)
    when "medium"
            Quizstart(qmedium)
    when "hard"
            Quizstart(qhard)
    when "quit"
        break
        else
            puts "Type Easy, Medium or Hard to continue!"
    end
end