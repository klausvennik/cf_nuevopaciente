require "application_system_test_case"

class StudentsTest < ApplicationSystemTestCase
  setup do
    @student = students(:one)
  end

  test "visiting the index" do
    visit students_url
    assert_selector "h1", text: "Students"
  end

  test "should create student" do
    visit students_url
    click_on "New student"

    fill_in "Career", with: @student.career
    fill_in "Commune", with: @student.commune
    fill_in "Country", with: @student.country
    fill_in "Cover photo", with: @student.cover_photo
    fill_in "Description", with: @student.description
    fill_in "Lastname", with: @student.lastname
    fill_in "Name", with: @student.name
    fill_in "Phono", with: @student.phono
    fill_in "Profile image", with: @student.profile_image
    fill_in "Region", with: @student.region
    fill_in "State", with: @student.state
    fill_in "University", with: @student.university
    fill_in "Year", with: @student.year
    click_on "Create Student"

    assert_text "Student was successfully created"
    click_on "Back"
  end

  test "should update Student" do
    visit student_url(@student)
    click_on "Edit this student", match: :first

    fill_in "Career", with: @student.career
    fill_in "Commune", with: @student.commune
    fill_in "Country", with: @student.country
    fill_in "Cover photo", with: @student.cover_photo
    fill_in "Description", with: @student.description
    fill_in "Lastname", with: @student.lastname
    fill_in "Name", with: @student.name
    fill_in "Phono", with: @student.phono
    fill_in "Profile image", with: @student.profile_image
    fill_in "Region", with: @student.region
    fill_in "State", with: @student.state
    fill_in "University", with: @student.university
    fill_in "Year", with: @student.year
    click_on "Update Student"

    assert_text "Student was successfully updated"
    click_on "Back"
  end

  test "should destroy Student" do
    visit student_url(@student)
    click_on "Destroy this student", match: :first

    assert_text "Student was successfully destroyed"
  end
end
