require 'rails_helper'

describe Contact, :vcr => true do

  it "will create a new contact" do
    visit new_contact_path
    fill_in :Name, :with => 'Kev and Marge'
    fill_in :Number, :with => '9876543210'
    click_on "Create Contact"
    expect(page).to have_content("Saved")
  end

  it "will render a new contact" do
    visit new_contact_path
    fill_in :Name, :with => 'Kev and Marge'
    click_on "Create Contact"
    expect(page).to have_content(:new)
  end

  it "will show detail page for contact" do
    contact = create(:contact)
    visit contacts_path
    click_link "Kevin and Margie"
    expect(page).to have_content("0000000000")
  end

  it "will edit a contact" do
    contact = create(:contact)
    visit contacts_path
    click_link "Kevin and Margie"
    click_link "Edit"
    fill_in :Name, :with => 'Kevin and Margie'
    fill_in :Number, :with => '9876543210'
    click_on "Update Contact"
    expect(page).to have_content("Kevin and Margie")
  end

  it "will render edit a contact" do
    contact = create(:contact)
    visit contacts_path
    click_link "Kevin and Margie"
    click_link "Edit"
    fill_in :Name, :with => 'Kevin and Margie'
    click_on "Update Contact"
    expect(page).to have_content(:edit)
  end

  it "will delete a contact" do
    contact = create(:contact)
    visit contacts_path
    click_link "Kevin and Margie"
    click_link "Delete"
    expect(page).to have_content("Contact deleted.")
  end

end
