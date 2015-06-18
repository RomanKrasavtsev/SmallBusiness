require 'test_helper'

class ClientTest < ActiveSupport::TestCase

	test "client attributes must not be empty" do
	  client = Client.new
	  assert client.invalid?
	  assert client.errors[:description].any?
	 end
end
