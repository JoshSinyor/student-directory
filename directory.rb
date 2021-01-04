@students = [
]

def load_students
  file = File.open("students.csv", "r")

  file.readlines.each do |line|
    first_name, last_name, cohort, colour = line.chomp.split(',')
      @students << {first_name: first_name, last_name: last_name, cohort: cohort.to_sym, colour: colour}
  end

  file.close
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_welcome
  puts "Welcome to the Villains' Academy student database. How would you like to proceed?"
end

def print_menu
  puts
  puts "Main Menu:"
  puts "1. Show all students."
  puts "2. Add a new student."
  puts "3. Delete an existing student."
  puts "7. Save changes."
  puts "8. Reload last save."
  puts "9. Exit."
end

def process(selection)
  case selection
  when "1"
    print_header
    print_students
    print_footer
  when "2"
    input_students
  when "3"
    delete_students
  when "7"
    save_students
  when "8"
    reload_students
  when "9"
    exit_program
  else
    puts "","Please re-enter your selection."
  end
end

def print_header
  puts
  puts "The students of Villains' Academy"
  puts "-------------"
end

def print_students
  @students.each_with_index do |student, index|
   puts "#{index + 1} #{student[:first_name]} #{student[:last_name]} (#{student[:cohort].capitalize} cohort)"
  end
end

def print_footer
  footer = "In total, we have #{@students.count} great student"

  case @students.count
  when 0
    puts "","We have no students."
  when 1
    puts "","#{footer}."
  else
    puts "","#{footer}s."
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
      colour = gets.chomp.downcase
      break if !colour.empty?
    end

    puts "","Your student's details are:","Name: #{first_name} #{last_name}","Cohort: #{cohort.capitalize}","Favourite Colour: #{colour.capitalize}","","Are you happy with these details? [Y/N]"

    if gets.chomp.downcase == "n"
      puts "","Please re-enter the student's details.",""
      next
    end

    @students << {first_name: first_name, last_name: last_name, cohort: cohort, colour: colour}

    @students.sort_by! { |student| student[:last_name] }

    puts "","Thank you, #{first_name} #{last_name} has been added to our student body. Villains' Academy is now #{@students.count} strong!"
    break
  end
end

def delete_students
  puts

  @students.each_with_index do |student, index|
   puts "#{index + 1} #{student[:first_name]} #{student[:last_name]}"
  end

  puts "","What is the index number of the student you'd like to delete?"
  selection = gets.chomp.to_i - 1

  puts "","That's not a valid selection." if selection < 0 || selection > @students.length

  to_be_deleted = @students[selection]

  puts "","Are you sure you would like to delete student ##{selection + 1}, #{to_be_deleted[:first_name]} #{to_be_deleted[:last_name]}? [Y/N]"

  case gets.chomp.downcase
  when "y"
    puts "","Student #{to_be_deleted[:first_name]} #{to_be_deleted[:last_name]} deleted."
    @students.delete_at(selection)
  when "n"
    puts "","Student not deleted."
  end
end

def save_students
  puts "Are you sure you want to overwrite your previous save? [Y/N]"
  return if gets.chomp.downcase == "n"

  file = File.open("students.csv", "w")
  file.truncate(0)

  @students.sort_by! { |student| student[:last_name] }

  @students.each do |student|
    student_data = [student[:first_name], student[:last_name], student[:cohort], student[:colour]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end

  file.close

  puts "","Progress saved."
end

def reload_students
  puts "Are you sure you want to revert to your previous save? All progress will be lost. [Y/N]"
  return if gets.chomp.downcase == "n"

  @students = []
  load_students

  puts "","Reloaded from previous save."
end

def exit_program
  puts "","Would you like to save your work? [Y/N]"

  case gets.chomp.downcase
  when "y"
    save_students
    puts "","Goodbye!"
    exit
  when "n"
    puts "","Goodbye!"
    exit
  end
end

load_students
print_welcome
interactive_menu
