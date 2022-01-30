# frozen_string_literal: true

require 'application_system_test_case'

class SiteCommonsTest < ApplicationSystemTestCase
  test 'visit the index' do
    visit root_path
    page.has_content?('Текущий курс доллара:')
  end
end
