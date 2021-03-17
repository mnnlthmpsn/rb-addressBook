# search for a contact
def search(searchName)
    contacts = readFromDB
    contact = contacts.find { |contact| contact.include?(searchName) }
    puts contact
    contact
end

# delete contact
def deleteContact(name)
    contact_to_del = search(name)
    if contact_to_del

        # get all contacts
        contacts = readFromDB

        # remove particular contact and update all contacts
        contacts.delete(contact_to_del)

        # completely clear db and update with current contacts
        writeToDB('', 'w+')

        # loop through array and add each line to db.txt
        contacts.each do |contact|
            writeToDB(contact, 'a+')
        end
        
        puts "#{name} deleted successfully"
    else
        puts "#{name} does not exist"
    end
end

# update contact
def updateContact(name, phone)
    contact = search(name)
    if contact
        # get all contacts
        contacts = readFromDB

        # get index of particular contact
        contact_to_upd = contacts.find_index(contact)
        contacts[contact_to_upd] = "#{name} - #{phone} \n"

        # clear db
        writeToDB('', 'w+')


        # loop through array and add each line to db.txt
        contacts.each do |contact|
            writeToDB(contact, 'a+')
        end

        puts "#{name} updated successfully"
    else
        puts "#{name} does not exist in address Book"
    end
end

# get all contacts
def get_all_contacts
    checkIfDbExists
    contacts = readFromDB.sort
    if contacts.length > 0
        contacts.each do |contact|
            puts contact
        end
        "done"
    else
        puts "No contact in Address Book"
    end
end

# db utility
def checkIfDbExists
    if File.exists?('./db.txt')
        nil
    else
        puts 'loading...Creating db file'
        File.new('./db.txt', 'w+')
    end
end

# read data from db.txt
def readFromDB
    File.open('db.txt', 'r+') do |file|
        file.readlines
    end
end

# write to db.txt
def writeToDB(value, mode)
    File.open('db.txt', mode) do |file|
        file.write(value)
    end
end