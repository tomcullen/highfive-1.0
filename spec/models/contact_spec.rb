require 'spec_helper'

describe Contact do
  it "requires a first_name" do
    contact = Fabricate(:contact)
    contact = Contact.new
    contact.should_not be_valid
    contact.errors.should include(:firstname)
  end
  
  it "limits names to 50 characters" do
    name = "hello" * 15
    contact = Contact.new(:firstname => name)
    contact.should_not be_valid
    contact.errors.should include(:firstname)
  end
end