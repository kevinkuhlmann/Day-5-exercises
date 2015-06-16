require_relative('rolodex.rb')

class CRM
  attr_reader :name

  def self.run(name)
    my_crm = CRM.new(name)
    my_crm.main_menu
  end

  def initialize(name)
    @name = name
    @rolodex = Rolodex.new
  end

  def print_main_menu
    puts "[1] Add a contact"
    puts "[2] Modify a contact"
    puts "[3] Display all contacts"
    puts "[4] Find a contact"
    puts "[5] Delete a contact"
    puts "[6] Exit"
  end

  def choose_option(choice)
    case choice
    when 1 then add_contact
    when 2 then edit_contact
    when 3 then display_contacts
    when 4 then find_contact
    when 5 then delete_contact
    when 6
      puts "Goodbye"
      exit
    else
      puts "I'm sorry Dave, I'm afraid I can't do that."
    end
  end

  def main_menu
    puts "Welcome to #{@name}"
    while true
      print_main_menu

      print "Select an option:"
      input = gets.chomp.to_i

      # return if input == 6

      choose_option(input)
    end
  end

  def add_contact
    puts "Adding a contact"

    print "First name: "
    first_name = gets.chomp

    print "Last name: "
    last_name = gets.chomp

    print "Email: "
    email = gets.chomp

    print "Notes: "
    notes = gets.chomp

    @rolodex.add_contact(first_name, last_name, email, notes)
  end

  def edit_contact
    puts "Please type the contact id number found in contact display:"
    id = gets.chomp.to_i

    puts "Type the new first name"
    first_name = gets.chomp.capitalize

    puts "Please type the change you want made last name"
    last_name = gets.chomp.capitalize

    puts "Please type the change you want made to the email"
    email = gets.chomp.downcase

    puts "Please type the change you want made to notes"
    notes = gets.chomp.downcase

    # contact = @rolodex.find(id)
    # contact.first_name = first_name
    # contact.last_name = last_name
    # contact.email = email
    # contact.notes = notes

    @rolodex.edit(id, first_name, last_name, email, notes)
  end


  def display_contacts
    @rolodex.all.each do |contact|
      puts "#{contact.id} - #{contact.first_name} #{contact.last_name}"
    end
  end

  def find_contact
    print "Please type the contact id number found in contact display: "
    id = gets.chomp.to_i
    @rolodex.single(id)
  end


  def delete_contact
    print "Please type the contact id number found in contact display: "
    id = gets.chomp.to_i


    @rolodex.attribute(id)
  end

end






CRM.run("Bitmaker CRM")

# CRM.run

# bitmaker_crm = CRM.new("Bitmaker CRM")
# personal_crm = CRM.new("Personal CRM")

# bm_name = bitmaker_crm.name
# bitmaker_crm.name = "Something new"

