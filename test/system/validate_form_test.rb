# frozen_string_literal: true

require 'application_system_test_case'

class ValidateFormTest < ApplicationSystemTestCase
  test 'validate_form_ok' do
    visit admin_path
    fill_in 'force_end_datetime', with: (DateTime.now + 1.hour)
    fill_in 'force_rate', with: '200'
    click_on 'Применить'

    page.has_content? 'Форсированное значение курса установлено на 200.0'
  end

  test 'validate_form_date_fail' do
    visit admin_path
    fill_in 'force_end_datetime', with: (DateTime.now - 1.hour)
    fill_in 'force_rate', with: '200'
    click_on 'Применить'

    page.has_content? 'Выбранная дата должна быть больше текущей.'
  end

  test 'validate_form_rate_value_fail' do
    visit admin_path
    fill_in 'force_end_datetime', with: (DateTime.now - 1.hour)
    fill_in 'force_rate', with: '200'
    click_on 'Применить'

    page.has_content? 'Значение курса должно быть числовым.'
  end
end
