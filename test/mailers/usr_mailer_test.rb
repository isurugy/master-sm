require 'test_helper'

class UsrMailerTest < ActionMailer::TestCase
  test "usr_additional_signup" do
    mail = UsrMailer.usr_additional_signup
    assert_equal "Usr additional signup", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
