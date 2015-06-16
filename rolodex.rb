require_relative('contact.rb')

class Rolodex
  @@id = 1000

  def initialize
    @contacts = []
  end

  def add_contact(first_name, last_name, email, note)
    contact = Contact.new(@@id, first_name, last_name, email, note)
    @@id += 1

    @contacts << contact
  end

  def all
    @contacts
  end

  def single(target_id)
    @contacts.find do |contact|
      contact.id == target_id
    puts "#{contact.id} - #{contact.first_name}, #{contact.last_name}"
    end
  end

  def find(target_id)
    @contacts.find do |contact|
      contact.id == target_id
    end
  end

  def delete(target_id)
    @contacts.delete(find(target_id))
  end

  def edit(id, first_name, last_name, email, notes)
    contact = find(id)

    contact.first_name = first_name
    contact.last_name = last_name
    contact.email = email
    contact.notes = notes
  end

end


