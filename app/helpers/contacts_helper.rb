module ContactsHelper
  def name(contact)
       "#{contact.firstname} #{contact.secondname}"
  end
end
