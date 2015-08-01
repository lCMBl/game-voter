require 'rails_helper'

describe SessionsController do
  let!(:user){User.create!(email: "t@t.t", name: "test", password: "test")}
  let!(:correct_login){{email: "t@t.t", name: "test", password: "test"}}

  it "logs the user in when given correct credentials" do
    visit(root_path)
    fill_in('user_email', with: correct_login[:email])
    fill_in('user_password', with: correct_login[:password])
    click_on("Log in")
    expect(page).to have_content("test's Dashboard")
    expect(page).to have_path(dashboard_path)
  end
end
