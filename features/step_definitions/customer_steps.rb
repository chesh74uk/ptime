When("the Manage customers link is clicked") do
    FactoryBot.create(:customer,
                    customer_name: "Customer 1")
    click_link "Manage customers"
end

Then("show me a list of existing customers") do
    expect(page).to have_content("Customer 1")
end

Given("a web browser is at the customer page") do
  visit customers_path
end

When("the Add customers button is clicked") do
  click_button "Add customer"
end

When("the customer form has been filled in and submitted") do
  expect(page).to have_content("Create customer")
  fill_in "customer_customer_name", with: "Customer 1"
  click_button "Create Customer"
end

Then("a new customer should be created") do
    expect(page).to have_content("Customer was successfully created.")
end

Given("a customer has been created") do
  FactoryBot.create(:customer,
                    customer_name: "Customer ABC")
end

When("the edit customer link is clicked") do
    click_on(class: 'customer-edit')
end

When("the edit form has been filled in and submitted") do
  expect(page).to have_content("Edit customer")
  fill_in "customer_customer_name", with: "Customer 123"
  click_button "Update Customer"
end

Then("the new customer details should be shown") do
    expect(page).to have_content("Customer was successfully updated.")
end

When("the delete customer link is clicked") do
  @customer = Customer.last
  find("a[href='#{customer_path(@customer)}']").click
end

Then("the customer should be deleted") do
  expect(page).to have_content("Customer was successfully deleted.")
end