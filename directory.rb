# This array contains Villains' Academy's students.

students_array = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates",
]

# These methods print the student list.

def print_header
  puts "The students of Villains' Academy"
  puts "-------------"
end

def print(array)
  array.each do |element|
    puts element
  end
end

def print_footer(array)
  puts "In total, we have #{array.count} great students."
end

print_header
print(students_array)
print_footer(students_array)
