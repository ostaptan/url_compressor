require 'spec_helper'

describe UrlStore do

  it 'should create url' do
    mocked_options3 = {generic_url: 'http://mail.ru', remote_ip: '1123123'}

    expect(UrlStore.new.save_with_alias(mocked_options3)).should_not raise_error
  end

  it 'should have correct alias' do
    mocked_options3 = {generic_url: 'http://mail.ru', remote_ip: '1123123'}
    url = UrlStore.new.save_with_alias(mocked_options3)

    expect(url.alias.size).should <= 6
  end

end
