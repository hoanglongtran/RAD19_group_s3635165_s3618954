require 'test_helper'
 
class ContactsMailerTest < ActionMailer::TestCase
   test "send_feedback" do
     @contact = Contact.new(name: "Karen", message: "Hi")
     mail = ContactsMailer.send_feedback(@contact)
     assert_equal "User feedback", mail.subject
     assert_equal ["rad.admin@protonmail.com"], mail.to
     assert_equal ["noreply@example.com"], mail.from
     assert_match "Hi", mail.body.encoded
   end
 
end

