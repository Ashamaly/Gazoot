require 'artii'

module Messages
    @a = Artii::Base.new :font => 'slant'
    def victory
        puts @a.asciify('Victory!').colorize(:yellow)
    end

    def defeat
        puts @a.asciify('Defeat!').colorize(:red)  
    end

    def welcome
        puts "            Welcome to               "
        puts @a.asciify('Gazoot!').colorize(:yellow)
    end
end