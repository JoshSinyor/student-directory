students = [
  {first_name: "Hannibal", last_name: "Lecter", cohort: :january, colour: "red"},
  {first_name: "Anakin", last_name: "Skywalker", cohort: :november, colour: "orange"},
  {first_name: "Mildred", last_name: "Ratched", cohort: :november, colour: "yellow"},
  {first_name: "Michael", last_name: "Corleone", cohort: :january, colour: "green"},
  {first_name: "Alex", last_name: "DeLarge", cohort: :november, colour: "blue"},
  {first_name: "The", last_name: "Wicked Witch of the West", cohort: :november, colour: "purple"},
  {first_name: "The", last_name: "Terminator", cohort: :november, colour: "red"},
  {first_name: "Freddy", last_name: "Krueger", cohort: :january, colour: "green"},
  {first_name: "The", last_name: "Joker", cohort: :november, colour: "blue"},
  {first_name: "Joffrey", last_name: "Baratheon", cohort: :november, colour: "yellow"},
  {first_name: "Norman", last_name: "Bates", cohort: :november, colour: "orange"},
]

def print_header
  puts "The students of Villains' Academy"
  puts "-------------"
end

def print(array)
  array.sort_by! { |student| student[:last_name] }

  array.each_with_index do |student, index|
   puts "#{index + 1} #{student[:first_name]} #{student[:last_name]} (#{student[:cohort].capitalize} cohort)"
  end
end

def print_footer(array)
  footer = "In total, we have #{array.count} great student"

  case array.count
  when 0
    puts "We have no students."
  when 1
    puts "#{footer}."
  else
    puts "#{footer}s."
  end
end

def input_students(array)
  while true do

    while true do
      puts "Please enter the first name of the student you wish to add."
      first_name = gets.chomp.capitalize

      break if !first_name.empty?
    end

    while true do
      puts "Please enter the surname of the student you wish to add."
      last_name = gets.chomp.capitalize

      break if !last_name.empty?
    end

    while true do
      puts "Please enter the student's cohort."
      cohort = gets.chomp.downcase.to_sym

      break if !cohort.empty?
    end

    while true do
      puts "Please enter the student's favourite colour."
      colour = gets.chomp.downcase
    break if !colour.empty?
    end

    puts "","Your student's details are:","Name: #{first_name} #{last_name}","Cohort: #{cohort.capitalize}","Favourite Colour: #{colour}","","Are you happy with these details? [Y/N]"
    if gets.chomp.downcase == "n"
      puts "","Please re-enter the student's details.",""
      next
    end

    array << {first_name: first_name, last_name: last_name, cohort: cohort, colour: colour}

    puts "Thank you, #{first_name} #{last_name} has been added to our student body. Villains' Academy is now #{array.count} strong!",""

    puts "Would you like to enter another student? [Y/N]"
    break if gets.chomp.downcase == "n"
  end
end

puts "Would you like to enter the details of a new student? [Y/N]"
if gets.chomp.downcase == "y"
  input_students(students)
end

print_header
print(students)
print_footer(students)

=begin
1.  We're using the each() method to iterate over an array of students. How can you modify the program to print a number before the name of each student, e.g. "1. Dr. Hannibal Lecter"? Hint: look into each_with_index()

        Change ~array.each do |element|~ to ~array.each_with_index do |element, index|~ and puts the #{index} value.

2.  Modify your program to only print the students whose name begins with a specific letter.

        Insert ~if student[:first_name][0] == "A"~ in the print method.

3.  Modify your program to only print the students whose name is shorter than 12 characters.

        Insert ~if (student[:first_name].length + student[:last_name].length) < 12~ in the print method.

4.  Rewrite the each() method that prints all students using while or until control flow methods (Loops).

        def print(array)
          iteration = 0

          while iteration < array.length
            puts "#{array[iteration][:first_name]} #{array[iteration][:last_name]} (#{array[iteration][:cohort].capitalize} cohort)"
            iteration += 1
          end
        end

5.  Our code only works with the student name and cohort. Add more information: hobbies, country of birth, height, etc.

        As above.

6.  Research how the method center() of the String class works. Use it in your code to make the output beautifully aligned.

        def print(array)
          array.sort_by! { |student| student[:last_name] }

          print_array = []

          array.each_with_index do |student, index|
           print_array.push("#{index + 1} #{student[:first_name]} #{student[:last_name]} (#{student[:cohort].capitalize} cohort)")
          end

          print_array.each do |student|
            puts student.center(print_array.sort_by { |x| x.length }[-1].size.to_i)
          end
        end

7.  In the input_students method the cohort value is hard-coded. How can you ask for both the name and the cohort?

        As above.

    What if one of the values is empty?

        while true do
          puts "Please enter the surname of the student you wish to add."
          last_name = gets.chomp.capitalize

          break if !last_name.empty?
        end

    Can you supply a default value?

        puts "Please enter the student's cohort."
        cohort = gets.chomp
        cohort = "november" if cohort.empty?
        cohort = cohort.downcase.to_sym

    The input will be given to you as a string? How will you convert it to a symbol?

        cohort = gets.chomp.downcase.to_sym

    What if the user makes a typo?

        puts "","Your student's details are:","Name: #{first_name} #{last_name}","Cohort: #{cohort.capitalize}","Favourite Colour: #{colour}","","Are you happy with these details? [Y/N]"
        if gets.chomp.downcase == "n"
          puts "","Please re-enter the student's details.",""
          next
        end

8.  Once you complete the previous exercise, change the way the users are displayed: print them grouped by cohorts. To do this, you'll need to get a list of all existing cohorts (the map() method may be useful but it's not the only option), iterate over it and only print the students from that cohort.

        array.sort_by! { |student| student[:cohort] }

9.  Right now if we have only one student, the user will see a message "Now we have 1 students", whereas it should be "Now we have 1 student". How can you fix it so that it used singular form when appropriate and plural form otherwise?

        def print_footer(array)
          footer = "In total, we have #{array.count} great student"

          case array.count
          when 0
            puts "We have no students."
          when 1
            puts "#{footer}."
          else
            puts "#{footer}s."
          end
        end

10. We've been using the chomp() method to get rid of the last return character. Find another method among those provided by the String class that could be used for the same purpose (although it will require passing some arguments).

        first_name = gets.capitalize.delete_suffix("\n")
=end
