require "./ops"

class Contact
    attr_accessor :name, :contact

    def initialize(name="Joe", contact="0540609437")
        if name == '' || contact == ''
            raise 'Name or contact cannot be empty'
        end
        self.name = name
        self.contact = contact
    end

    # add contact
    def addContact
        checkIfDbExists
        
        contact = search(self.name)

        if contact
            puts "User already exists => #{contact}"
        else
            newContact = "#{self.name} - #{self.contact} \n"
            writeToDB(newContact, 'a+')
            puts "#{self.name} added to address Book successfully"
        end
    end
end

