When("the Manage scenarios link is clicked") do
  FactoryBot.create(:scenario,
                    scenario_name: "Scenario 1")
  click_link "Manage scenarios"
end

Then("show me a list of existing scenarios") do
  expect(page).to have_content("Scenario 1")
end

Given("a web browser is at the scenario page") do
  visit scenarios_path
end

When("the Add scenario button is clicked") do
  click_button "Add scenario"
end

When("the scenario form has been filled in and submitted") do
  expect(page).to have_content("Create scenario")
  fill_in "scenario_scenario_name", with: "Scenario 1"
  click_button "Create Scenario"
end

Then("a new scenario should be created") do
  expect(page).to have_content("Scenario was successfully created.")
end

Given("a scenario has been created") do
  FactoryBot.create(:scenario,
                    scenario_name: "Scenario ABC")
end

When("the edit scenario link is clicked") do
  @scenario = Scenario.first
  click_on(class: 'scenario-edit')
end

When("the scenario edit form has been filled in and submitted") do
  expect(page).to have_content("Edit scenario")
  @name = "Scenario "+Time.now.to_s
  fill_in "scenario_scenario_name", with: @name
  click_button "Update Scenario"
end

Then("the new scenario details should be shown") do
  expect(page).to have_content(@name)
end

When("the delete scenario link is clicked") do
  @scenario = Scenario.last
  find("a[href='#{scenario_path(@scenario)}']").click
end

Then("the scenario should be deleted") do
  expect(page).to have_content("Scenario was successfully deleted.")
end
