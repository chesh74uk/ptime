Given("a web browser is at the test page") do
  FactoryBot.create(:customer,
                    customer_name: "Customer ABC")
  FactoryBot.create(:scenario,
                    scenario_name: "Scenario 123")
    visit tests_path
end

When("the Add test button is clicked") do
  click_button "Add test"
end

When("the test form has been filled in and submitted") do
  expect(page).to have_content("Create test")
  page.select 'Customer ABC',  from: 'test_test_customer'
  page.select 'Scenario 123',  from: 'test_test_scenario'
  click_button "Create Test"
end

Then("a new test should be created") do
  expect(page).to have_content("Test was successfully created.")
end

When("the Manage tests link is clicked") do
    
    FactoryBot.create(:test,
                    test_customer: "Customer 123",
                    test_scenario: "Scenario ABC")
  click_link "Manage tests"
end

Then("show me a list of existing tests") do
  expect(page).to have_content("Manage tests")
  expect(page).to have_content("Customer 123")
  expect(page).to have_content("Scenario ABC")
end

Given("a test has been created") do
  FactoryBot.create(:customer,
                    customer_name: "Customer ABC")
  FactoryBot.create(:scenario,
                    scenario_name: "Scenario 123")
  FactoryBot.create(:test,
                    test_customer: "Customer XYZ",
                    test_scenario: "Scenario 123")
end

When("the edit test link is clicked") do
  click_on(class: 'test-edit')
end

When("the test edit form has been filled in and submitted") do
  expect(page).to have_content("Edit test")
  fill_in "Test customer", with: "Customer zzz"
  fill_in "test_test_scenario", with: "Scenario xxx"
  click_button "Update Test"
end

Then("the new test details should be shown") do
     expect(page).to have_content("Customer zzz")
     expect(page).to have_content("Scenario xxx")
end

When("the delete test link is clicked") do
  click_on(class: 'test-delete')
end

Then("the test should be deleted") do
  expect(page).to have_content("Test was successfully deleted.")
end

When("the test link is clicked") do
  click_on(class: 'test-link')
end

Then("show the details of the test") do
  expect(page).to have_content("Test details")
  expect(page).to have_button("Add event")
end