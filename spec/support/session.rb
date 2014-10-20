def login
  visit root_url
  first(:link, "GitHub").click
  expect(page).to have_content("Nicolás Hock Isaza")
end

def logout
  visit root_url
  element = first(:link, I18n.t('application.header.logout'))
  element.click if element
end
