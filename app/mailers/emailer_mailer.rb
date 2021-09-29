class EmailerMailer < ApplicationMailer
	
	default from: 'notifications@example.com'
  def payment_details(amount,user)
    puts "--------------====================----------------------------------"
    @amt= number_to_indian_currency(amount.to_f)
    @name=user[:first_name]
    
    mail(to: $em1, subject: 'Payment details')
  end


  def number_to_indian_currency(number)
    if number.present?
      string = number.to_s.split('.')
      number = string[0].gsub(/(\d+)(\d{3})$/){ p = $2;"#{$1.reverse.gsub(/(\d{2})/,'\1,').reverse},#{p}"}
      number = number.gsub(/^,/, '') + '.' + string[1] if string[1] # remove leading comma
      number = number[1..-1] if number[0] == 44
    end
    "₹. #{number}"
  end
end
