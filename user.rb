require "./model"
require "./ops"

puts "\n#{'=' * 20} AWESOME CLI ADDRESS BOOK #{'='*20} \n\n\n"

end_program = false

while end_program == false do
    puts "Commands: add - Add contact, all - Get all contacts, update - Update a contact, delete - Delete a contact,
    search - Search for a contact. Please type end if you want to exit \n\n\n"

    print "Please enter a command: "

    res = gets.chomp

    case res
        when 'add'
            print "Please enter 'Name' & 'Contact' seperating with a comma: "
            contact_raw = gets.chomp

            # split input
            contact = contact_raw.split(",")

            # pass name and contact to addContact fxn
            c = Contact.new(contact[0].lstrip, contact[1].lstrip)
            c.addContact

        when 'all'
            get_all_contacts

        when 'update'
           print "Please enter 'Name' of contact to update & 'New Contact' you want to update \n"
           print ": "

           contact_raw = gets.chomp

           # split input
           contact = contact_raw.split(",")

        #    update contact
           updateContact(contact[0].lstrip, contact[1].lstrip)
        
        when 'delete'
            print "Please enter 'Name' of contact to be deleted: "
            name_raw = gets.chomp
            deleteContact(name_raw.lstrip)
        when 'search'
            print "Please enter 'Name' of contact to search: "
            name_raw = gets.chomp
            search(name_raw.lstrip)
        when 'end'
            end_program = true
        else
            'You entered a wrong choice. Try again'
    end

    puts "\n\n"
end