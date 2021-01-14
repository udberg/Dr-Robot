require 'twitter'
require_relative 'spec_helper'
require_relative '../lib/twitter_acc'

RSpec.describe TwitterAcc do
  let(:bot) { TwitterAcc.new }

  describe '#initialize' do
    it 'should set the @client' do
      expect(bot.instance_variable_get(:@client)).to be_a(Twitter::REST::Client)
    end
  end
end
