class GalleryController < ApplicationController
  def index
    @instrument = Store.all
  end

  def query
    puts "-----------------------------///////////////////////////////////////////"
    keyword="%"+params[:search].to_s+"%"
    @instrument = Store.find_by_sql ["Select * from stores WHERE name like ? or category like ? or price like ? or model like ? or description like ?",keyword,keyword,keyword,keyword,keyword] 
    
  end
  def purchase_complete

  end
  def checkout

    require 'active_merchant'

  # Use the TrustCommerce test servers
  ActiveMerchant::Billing::Base.mode = :test

  gateway = ActiveMerchant::Billing::TrustCommerceGateway.new(
              :login => 'TestMerchant',
              :password => 'password')

  # ActiveMerchant accepts all amounts as Integer values in cents
  amount = session[:amount].to_i  # $10.00

  # The card verification value is also known as CVV2, CVC2, or CID
  credit_card = ActiveMerchant::Billing::CreditCard.new(
                  :first_name         => params[:first_name],
                    :last_name          => params[:last_name],
                    :number             => params[:number],
                    :month              => params[:month],
                    :year               => params[:year],
                    :verification_value => params[:verification_value])

  # Validating the card automatically detects the card type
  if credit_card.valid?
    response = gateway.purchase(amount, credit_card)

    if response.success?
      #mailer
      # session[:user_id] = @current_user.id
      # @current_user = User.find(session[:user_id])
      EmailerMailer.payment_details(amount,params).deliver
      session[:amount]=nil;
      puts "Successfully charged Rs. #{amount} to the credit card #{credit_card.display_number}"
      flash[:notice]="Successfully charged Rs. #{amount} to the credit card #{credit_card.display_number}"
      
      redirect_to gallery_purchase_complete_path 
    else
      raise StandardError, response.message
      flash[:notice]=response.message
      render gallery_checkout_path
    end
  else
    # response = gateway.purchase(amount, credit_card)
    # raise  response.message
      
       flash[:notice]="Enter valid creds"
      
       render gallery_checkout_path
  end

  end
end