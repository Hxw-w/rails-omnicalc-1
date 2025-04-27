class CalculatorController < ApplicationController
  def homepage
    render({ :template => "cal_templates/homepage"})
  end
  def square
    render({ :template => "cal_templates/square"})
  end
  def square_results
    @the_num = params.fetch("number").to_f
    @the_result = @the_num ** 2
    render({ :template => "cal_templates/square_results"})
  end
  def square_root
    render({ :template => "cal_templates/sqrt"})
  end
  def square_root_results
    @the_num = params.fetch("number").to_f
    @the_result = @the_num ** (1.0/2)
    render({ :template => "cal_templates/sqrt_results"})
  end
  def payment
    render({ :template => "cal_templates/payment"})
  end
  def payment_results
    @apr = params.fetch("apr").to_f
    @years = params.fetch("years").to_f
    @principal = params.fetch("principal").to_f
  
    monthly_rate = (@apr * 0.01) / 12
    total_payments = @years * 12
  
    raw_payment = @principal * (monthly_rate * (1 + monthly_rate) ** total_payments) /
                               ((1 + monthly_rate) ** total_payments - 1)
    @payment = raw_payment.to_fs(:currency)
  
    @principal_display = @principal.to_fs(:currency)
    render({ :template => "cal_templates/payment_results"})
  end
  def random
    render({ :template => "cal_templates/random"})
  end
  def random_results
    @min = params.fetch("users_min").to_f
    @max = params.fetch("users_max").to_f
  
    @random_result = rand(@min..@max)
    render({ :template => "cal_templates/random_results"})
  end
end
