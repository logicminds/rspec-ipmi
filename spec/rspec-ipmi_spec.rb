require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "RspecIpmi" do
  it 'works' do
    expect('hostname').to run_command('chassis.power.status')
  end
end
