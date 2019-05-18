Given("a web browser is at the test details page") do
    FactoryBot.create(:test,
                    test_customer: "Customer XYZ",
                    test_scenario: "Scenario 123")
    test = Test.first
    visit test_path(test)
end

When("the Add event button is clicked") do
  click_button "Add event"
end

When("the event form has been filled in and submitted") do
  fill_in "event_event_name", with: "Event 1"
  page.select Date.current.strftime("%Y"),  from: 'event_event_date_1i'
  page.select Date.current.strftime("%b"),  from: 'event_event_date_2i'
  page.select Date.current.strftime("%d"),  from: 'event_event_date_3i'
  fill_in "event_event_outcome", with: "A very expected outcome!"
  click_button "Create Event"
end

Then("a new event should be created") do
  expect(page).to have_content("Event was successfully created.")
end

Given("an event has been created") do
  FactoryBot.create(:test,
                    test_customer: "Customer XYZ",
                    test_scenario: "Scenario 123")
    test = Test.first
    FactoryBot.create(:event,
                    event_name: "Event XYZ",
                    event_date: Date.current,
                    event_outcome: "Success",
                    test_id: test.id)
end

Then("show me a list of existing events") do
  expect(page).to have_content("Event XYZ")
  expect(page).to have_content(Date.current.strftime("%d/%m/%Y"))
end

When("the edit event link is clicked") do
  click_on(class: 'event-edit')
end

When("the event edit form has been filled in and submitted") do
  expect(page).to have_content("Edit Event")
  page.select Date.tomorrow.strftime("%Y"),  from: 'event_event_date_1i'
  page.select Date.tomorrow.strftime("%b"),  from: 'event_event_date_2i'
  page.select Date.tomorrow.strftime("%d"),  from: 'event_event_date_3i'
  click_button "Update Event"
end

Then("the new event details should be shown") do
  expect(page).to have_content(Date.tomorrow.strftime("%d/%m/%Y"))
  expect(page).to have_content("Event was successfully updated.")
end

When("the delete event link is clicked") do
  click_on(class: 'event-delete')
end

Then("the event should be deleted") do
  expect(page).to have_content("Event was successfully deleted.")
end