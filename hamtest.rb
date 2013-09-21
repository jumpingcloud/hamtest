#
#
# this will be a complete rewrite of hamtestprep in ruby
#
require "readline"

class Array
  def find_each_index find
    found, index, q = -1, -1, []
    while found
      found = self[index+1..-1].index(find)
      if found
        index = index + found + 1
        q << index
      end
    end
    q
  end
end

class Test
  attr_accessor :questions, :clean_pool, :question_array

  def initialize
    @questions = []
    @questions = IO.readlines('questionpool.txt')

  end

  def get_questions
    # Get the questions into an array,
    # Separate array for each question section
    @question_array = [""]
    @pool = []
    @question_num = 0
    @section_num = 0
    @sections = []
    @position = 0
    # @question = 

    @questions.each do |line|
      
      if ( line =~ /T{1}\d[A-Z]\s/ )
        # This is always ONE line so there's something
        # "section#{@section_num}"
        @section = line[0..2]
        @sections << @section
        @section_num += 1
        # puts line
        # newarr("@section_#{@section_num}", Array.new)
        #@index << @section

      elsif ( line =~ /T{1}\d[A-Z]\d\d/ )
        @question_id = line
      
      elsif ( line =~ /~~/ )
        # 
        # @question_array = @question_array.join("\n")
        @full_question = @question_array
        @full_question.unshift(@question_id)
        # @section << @full_question        
        @pool[@position] = @full_question
        # puts @pool[@position]
        @position += 1
        @question_array = [""]
        # if @position == 3 
        #   break
        # end 

      elsif ( line !~ /^$/ )
        @question_array[0] << line.to_s 
        
      end
    end

    def build_test
      @secnum = 0
      3.times do
        # This will give me every indexes in a particular section.
        puts @secnum
        p @pool.each_index.select{|i| @pool[i] =~ /T1A/ }
        # a = @pool.each_index.select{|i| @pool[i] =~ /#{Regexp.escape(@sections[@secnum])}/}

        # p @pool
        puts @pool[1]
        # puts a
        puts @sections[@secnum]
        @secnum += 1
      end     
    end  

    def ask_questions
      @qid = 0
      puts "I'll ask the questions around here!"
      5.times do 
        puts @pool[@qid][1]
        # puts @pool[1]
        print "> "
        @user_answer = gets
        @answer = @pool[@qid][0].scan(/\([A-D]\)/)
        @answer = @answer.to_s.gsub!(/\W+/, '')
        if @user_answer = @answer
          @score += 1
          puts "Correct!"
        
        else
          puts "No, that's wrong."
        end  
        @qid += 1
      end 
    end
  end
end
  hamtest = Test.new
  hamtest.get_questions
  hamtest.build_test

  # @questions.delete_if do |line|
  #   if ( line =~ /T{1}\d[A-Z]\s/ )
  #     do_something_with(line)
  #     true # Make sure the if statement returns true, so it gets marked for deletion

  # IO.foreach( 'questionpool.txt' ) do |line|
  # 	if ( line =~ /T{1}\d[A-Z]\s/ )
  # 	  until
  # 	end

  # 	if ( line =~ /^$/ )
  # 	  puts
  # 	end

# move to the next position in the array
        # # puts @question_array

        # # @clean_pool[@section_num][@question_num] << @question_array
        # # @clean_pool["#{@section_num}".to_i] = @question_array
        # # puts @question_array
        # @section_num += 1
        # @question_array.join('/n')
        # @question_array.unshift( @question_id )
        # @question_clean = @question_array
        # @clean_pool[@section_num] = @question_clean
        # @question_num += 1
        # # @question_array = []
        # @question_clean = []
        # @question_array = []