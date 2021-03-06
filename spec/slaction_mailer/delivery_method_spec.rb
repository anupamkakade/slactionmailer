require 'spec_helper'

describe SlactionMailer::DeliveryMethod do
  before do

    Mail.defaults do
      delivery_method SlactionMailer::DeliveryMethod, 
        :webhook => "https://hooks.slack.com/services/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", 
        :channel => "#bottesting", 
        :username => "SlactionMailer"
    end
  end

  it 'raises an error if initalized wrong' do
    expect { SlactionMailer::DeliveryMethod.new }.to raise_exception(SlactionMailer::DeliveryMethod::InvalidOption) 
  end

  context 'integration' do
    it 'sends a message successfully' do
      pending "Need to spec out an actionmailer message"
    end

    it 'sends a message with a template' do
      Mail.defaults do
        delivery_method SlactionMailer::DeliveryMethod, 
          :webhook => "https://hooks.slack.com/services/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", 
          :channel => "#bottesting", 
          :username => "SlactionMailer",
          :template => File.read('spec/examples/template.text.erb')
      end
      expect { 
        Mail.deliver do
          from "Feaux feaux@example.com"
          to "Bar bar@example.com"
          subject "Hello World!"
          body "I'm a message body!"
        end
      }.not_to raise_error
    end
  end
end
