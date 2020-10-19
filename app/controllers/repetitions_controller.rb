class RepetitionsController < ApplicationController
    def new
        byebug
        @repetition = Repetition.new
        byebug
    end
end