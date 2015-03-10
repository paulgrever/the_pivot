require 'rails_helper'

describe "the order view", type: :feature do
  let(:order) do 
    Order.create(user_id: 3, status_id: 2)
  end


	it "displays all the orders on the index page" do
  	order
    visit orders_path
    expect(page).to have_content("Orders")    
  end

  it "displays links for each indivdual order" do
  	order
    visit orders_path
    expect(page).to have_content("click here")    
  end

  it "shows each orders indivdual information" do
  	order
  	visit orders_path
  	click_link_or_button( 'click here')

  	expect(page).to have_content("Details for Order ID:")
  end

 	xit "displays a total number of orders by status type" do


  end

  xit "filters orders to display by status type" do

  end

 	xit "link to transition to a different status " do
 		

  end

  xit "displays total for the order" do
  	order
    visit orders_path
  	expect(page).to have_content("Cost")
  end

  it "displays the order status" do
  	order
    visit orders_path
    expect(page).to have_content(order.status_id)    
  end

  it "displays order date and time" do
		order
    visit orders_path
    click_link_or_button( 'click here')
    expect(page).to have_content("Date") 
  end  

end
