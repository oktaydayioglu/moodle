@core @core_course
Feature: Test category management actions
  As a moodle admin
  Test we can create a category
  Test we can create a sub category
  Test we can edit a category
  Test we can delete a category
  Test we can assign roles within a category
  Test we can set permissions on a category
  Test we can manage cohorts within a category
  Test we can manage filters for a category

  Scenario: Test editing a category through the management interface.
    Given the following "categories" exists:
      | name | category | idnumber |
      | Cat 1 | 0 | CAT1 |
    And the following "courses" exists:
      | category | fullname | shortname | idnumber |
      | CAT1 | Course 1 | Course 1 | C1 |

    And I log in as "admin"
    And I go to the courses management page
    And I should see the "Course categories" management page
    And I click on "edit" action for "Cat 1" in management category listing
    # Redirect
    And I should see "Edit category settings"
    And I should see "Cat 1"
    And I press "Cancel"
    # Redirect
    And I should see the "Course categories and courses" management page
    And I click on "edit" action for "Cat 1" in management category listing
    # Redirect
    And I should see "Edit category settings"
    And I should see "Cat 1"
    And I fill the moodle form with:
      | Category name | Category 1 (edited) |
      | Category ID number | CAT1e |
    And I press "Save changes"
    # Redirect
    And I should see the "Course categories and courses" management page
    And I should see "Category 1 (edited)" in the "#category-listing" "css_element"
    And I should see "Category 1 (edited)" in the "#course-listing h3" "css_element"

  Scenario: Test deleting a categories through the management interface.
    Given the following "categories" exists:
      | name | category | idnumber |
      | Cat 1 | 0 | CAT1 |
      | Cat 2 | 0 | CAT2 |
      | Cat 3 | 0 | CAT3 |

    And the following "courses" exists:
      | category | fullname | shortname | idnumber |
      | CAT3 | Course 1 | Course 1 | C1 |

    And I log in as "admin"
    And I go to the courses management page
    And I should see the "Course categories" management page
    And I should see "Cat 1" in the "#category-listing ul.ml" "css_element"
    And I should see "Cat 2" in the "#category-listing ul.ml" "css_element"
    And I should see "Cat 3" in the "#category-listing ul.ml" "css_element"
    And I click on "delete" action for "Cat 2" in management category listing
    # Redirect
    And I should see "Delete category: Cat 2"
    And I should see "Contents of Cat 2"
    And I should see "This category is empty"
    And I press "Cancel"
    # Redirect
    And I should see the "Course categories and courses" management page
    And I should see "Cat 1" in the "#category-listing ul.ml" "css_element"
    And I should see "Cat 2" in the "#category-listing ul.ml" "css_element"
    And I should see "Cat 3" in the "#category-listing ul.ml" "css_element"
    And I click on "delete" action for "Cat 2" in management category listing
    # Redirect
    And I should see "Delete category: Cat 2"
    And I should see "Contents of Cat 2"
    And I should see "This category is empty"
    And I press "Delete"
    # Redirect
    And I should see "Delete category: Cat 2"
    And I should see "Deleted course category Cat 2"
    And I press "Continue"
    # Redirect
    And I should see the "Course categories" management page
    And I should see "Cat 1" in the "#category-listing ul.ml" "css_element"
    And I should not see "Cat 2" in the "#category-listing ul.ml" "css_element"
    And I should see "Cat 3" in the "#category-listing ul.ml" "css_element"
    And I click on "delete" action for "Cat 3" in management category listing
    # Redirect
    And I should see "Delete category: Cat 3"
    And I fill the moodle form with:
      | What to do | Move contents to another category |
      | Move into  | Cat 1                             |
    And I press "Delete"
    # Redirect
    And I should see "Delete category: Cat 3"
    And I should see "Deleted course category Cat 3"
    And I press "Continue"
    # Redirect
    And I should see the "Course categories and courses" management page
    And I should see "Cat 1" in the "#category-listing ul.ml" "css_element"
    And I should not see "Cat 2" in the "#category-listing ul.ml" "css_element"
    And I should not see "Cat 3" in the "#category-listing ul.ml" "css_element"
    And I should see "Course 1" in the "#course-listing ul.ml" "css_element"

  Scenario: Test I can assign roles for a category through the management interface.
    Given the following "categories" exists:
      | name | category | idnumber |
      | Cat 1 | 0 | CAT1 |
    And the following "courses" exists:
      | category | fullname | shortname | idnumber |
      | CAT1 | Course 1 | Course 1 | C1 |

    And I log in as "admin"
    And I go to the courses management page
    And I should see the "Course categories" management page
    And I click on "assignroles" action for "Cat 1" in management category listing
    # Redirect
    And I should see "Assign roles in Category: Cat 1"
    And I should see "Please choose a role to assign"
    And I click on "Back to Category: Cat 1" "link"
    # Redirect
    And I should see the "Course categories and courses" management page
    And I should see "Cat 1" in the "#course-listing h3" "css_element"

  Scenario: Test I can set access permissions for a category through the management interface.
    Given the following "categories" exists:
      | name | category | idnumber |
      | Cat 1 | 0 | CAT1 |
    And the following "courses" exists:
      | category | fullname | shortname | idnumber |
      | CAT1 | Course 1 | Course 1 | C1 |

    And I log in as "admin"
    And I go to the courses management page
    And I should see the "Course categories" management page
    And I click on "permissions" action for "Cat 1" in management category listing
    # Redirect
    And I should see "Permissions in Category: Cat 1"
    And I click on "Back to Category: Cat 1" "link"
    # Redirect
    And I should see the "Course categories and courses" management page
    And I should see "Cat 1" in the "#course-listing h3" "css_element"

  Scenario: Test clicking to manage cohorts for a category through the management interface.
    Given the following "categories" exists:
      | name | category | idnumber |
      | Cat 1 | 0 | CAT1 |
    And the following "courses" exists:
      | category | fullname | shortname | idnumber |
      | CAT1 | Course 1 | Course 1 | C1 |

    And I log in as "admin"
    And I go to the courses management page
    And I should see the "Course categories" management page
    And I click on "cohorts" action for "Cat 1" in management category listing
    # Redirect
    And I should see "Category: Cat 1: available cohorts"

  Scenario: Test configuring filters for a category
    Given the following "categories" exists:
      | name | category | idnumber |
      | Cat 1 | 0 | CAT1 |
    And the following "courses" exists:
      | category | fullname | shortname | idnumber |
      | CAT1 | Course 1 | Course 1 | C1 |

    And I log in as "admin"
    And I go to the courses management page
    And I should see the "Course categories" management page
    And I click on "filters" action for "Cat 1" in management category listing
    # Redirect
    And I should see "Filter settings in Category: Cat 1"
    And I click on "Back to Category: Cat 1" "link"
    # Redirect
    And I should see the "Course categories and courses" management page
    And I should see "Cat 1" in the "#course-listing h3" "css_element"

  @javascript
  Scenario: Test that I can create a category and view it in the management interface
    Given the following "categories" exists:
      | name | category | idnumber |
      | Cat 1 | 0 | CAT1 |
    And I log in as "admin"
    And I go to the courses management page
    And I should see the "Course categories" management page
    And I click on "Create new" "link" in the ".category-listing-actions" "css_element"
    And I click on "Top level category" "link" in the ".category-listing-actions" "css_element"
    # Redirect.
    And I should see "Add new category"
    And I fill the moodle form with:
      | Category name | Test category 2 |
      | Category ID number | TC2 |
    And I press "Create category"
    # Redirect
    And I should see the "Course categories and courses" management page
    And I should see "Test category 2" in the "#course-listing h3" "css_element"
    And I should see category listing "Cat 1" before "Test category 2"
    And I should see "No courses in this category"
    And I click on "Create new" "link" in the ".category-listing-actions" "css_element"
    And I click on "Sub category" "link" in the ".category-listing-actions" "css_element"
    # Redirect
    And I should see "Add new category"
    And I fill the moodle form with:
      | Category name | Test category 3 |
      | Category ID number | TC3 |
    And I press "Create category"
    # Redirect
    And I should see the "Course categories and courses" management page
    And I should see "Test category 3" in the "#course-listing h3" "css_element"
    And I should see category listing "Cat 1" before "Test category 2"
    And I should see "No courses in this category"

