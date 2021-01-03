@students = [
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

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input a new student."
  puts "2. Show all students."
  puts "3."
  puts "4."
  puts "5."
  puts "6."
  puts "7."
  puts "8."
  puts "9. Exit."
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    print_header
    print_students
    print_footer
  when "3"
  when "4"
  when "5"
  when "6"
  when "7"
  when "8"
  when "9"
    exit
  end
end


def print_header
  puts
  puts "The students of Villains' Academy"
  puts "-------------"
end

def print_students
  @students.sort_by! { |student| student[:last_name] }

  @students.each_with_index do |student, index|
   puts "#{index + 1} #{student[:first_name]} #{student[:last_name]} (#{student[:cohort].capitalize} cohort)"
  end
end

def print_footer
  footer = "In total, we have #{@students.count} great student"

  case @students.count
  when 0
    puts "We have no students.",""
  when 1
    puts "#{footer}.",""
  else
    puts "#{footer}s.",""
  end
end

def input_students
  puts
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
      colour = gets.chomp.capitalize
      break if !colour.empty?
    end

    puts "","Your student's details are:","Name: #{first_name} #{last_name}","Cohort: #{cohort.capitalize}","Favourite Colour: #{colour}","","Are you happy with these details? [Y/N]"

    if gets.chomp.downcase == "n"
      puts "","Please re-enter the student's details.",""
      next
    end

    @students << {first_name: first_name, last_name: last_name, cohort: cohort, colour: colour}

    puts "","Thank you, #{first_name} #{last_name} has been added to our student body. Villains' Academy is now #{@students.count} strong!","","Would you like to enter another student? [Y/N]"

    if gets.chomp.downcase == "n"
      puts
      break
    end
  end
end

interactive_menu
