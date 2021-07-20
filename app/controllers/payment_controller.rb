class PaymentController < ApplicationController
  def create 
    # fetch the listing
    @listing = Listing.find(params[:listing_id])

    # fetch the root path
    if ENV['RAILS_ENV'] == "development"
      root_path = "http://localhost:3000"
    else
      root_path = ENV['ROOT_PATH']
    end 
    
    # implement stripe code
    Stripe.api_key = Rails.application.credentials.dig(:stripe_api_key)
    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'aud',
          product_data: {
            name: @listing.title,
          },
          unit_amount: @listing.price.to_i * 100,
        },
        quantity: 1,
      }],
      mode: 'payment',
      
      # upon succes, redirect to listing show page, maybe get buyer to leave review?
      success_url: "http://localhost:3000/listings/#{@listing.id}?checkout=success",
      # if payment is cancelled, show cancel msg
      cancel_url: 'http://localhost:3000/payment/cancel',
    })
    redirect_to session.url
  end
  def cancel
    render file: 'public/404.html', layout: false, status: :not_found
  end 
end
