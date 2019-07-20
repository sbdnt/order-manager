require "application_system_test_case"

class ScalesArchivedsTest < ApplicationSystemTestCase
  setup do
    @scales_archived = scales_archiveds(:one)
  end

  test "visiting the index" do
    visit scales_archiveds_url
    assert_selector "h1", text: "Scales Archiveds"
  end

  test "creating a Scales archived" do
    visit scales_archiveds_url
    click_on "New Scales Archived"

    fill_in "Customer info", with: @scales_archived.customer_info
    fill_in "Desc info", with: @scales_archived.desc_info
    fill_in "End date", with: @scales_archived.end_date
    fill_in "Is deleted", with: @scales_archived.is_deleted
    fill_in "Percent lost", with: @scales_archived.percent_lost
    fill_in "Ship info", with: @scales_archived.ship_info
    fill_in "Start date", with: @scales_archived.start_date
    fill_in "Stock info", with: @scales_archived.stock_info
    fill_in "Total input", with: @scales_archived.total_input
    fill_in "Total output 1", with: @scales_archived.total_output_1
    fill_in "Total output 2", with: @scales_archived.total_output_2
    fill_in "Total output 3", with: @scales_archived.total_output_3
    fill_in "Total output 4", with: @scales_archived.total_output_4
    click_on "Create Scales archived"

    assert_text "Scales archived was successfully created"
    click_on "Back"
  end

  test "updating a Scales archived" do
    visit scales_archiveds_url
    click_on "Edit", match: :first

    fill_in "Customer info", with: @scales_archived.customer_info
    fill_in "Desc info", with: @scales_archived.desc_info
    fill_in "End date", with: @scales_archived.end_date
    fill_in "Is deleted", with: @scales_archived.is_deleted
    fill_in "Percent lost", with: @scales_archived.percent_lost
    fill_in "Ship info", with: @scales_archived.ship_info
    fill_in "Start date", with: @scales_archived.start_date
    fill_in "Stock info", with: @scales_archived.stock_info
    fill_in "Total input", with: @scales_archived.total_input
    fill_in "Total output 1", with: @scales_archived.total_output_1
    fill_in "Total output 2", with: @scales_archived.total_output_2
    fill_in "Total output 3", with: @scales_archived.total_output_3
    fill_in "Total output 4", with: @scales_archived.total_output_4
    click_on "Update Scales archived"

    assert_text "Scales archived was successfully updated"
    click_on "Back"
  end

  test "destroying a Scales archived" do
    visit scales_archiveds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scales archived was successfully destroyed"
  end
end
