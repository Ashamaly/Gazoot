require './questions'
include EasyQs, MediumQs, HardQs

class Quiz
    attr_accessor :question, :answer, :power

    def initialize(question, answer)
        @question = question
        @answer = answer
        @power = power
    end
end

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