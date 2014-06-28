require 'spec_helper'
describe 'cardiff' do

  context 'with defaults for all parameters' do
    it { should contain_class('cardiff') }
  end
end
