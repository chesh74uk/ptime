When("a web browser is at the home page") do
  visit root_path
end

Then("show a manage customers link") do
  expect(page).to have_link("Manage customers")
end

Then("a manage scenarios link") do
  expect(page).to have_link("Manage scenarios")
end

Then("a manage tests link") do
  expect(page).to have_link("Manage tests")
end