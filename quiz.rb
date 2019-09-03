require 'questions'

Quiz
    attr_accessor :question :answer :power

    def initialize(question, answer)
        @question = question
        @answer = answer
        @power = power
    end
end

qeasy = [
    Quiz.new(e1, "true"),
    Quiz.new(e2, "true"),
    Quiz.new(e3, "false")
]

qmedium =[
    Quiz.new(m1, "a"),
    Quiz.new(m2, "c"),
    Quiz.new(m3, "d")
]

qhard = [
    Quiz.new(h1, "sock"),
    Quiz.new(h2, "horse"),
    Quiz.new(h3, "aphasia")
]