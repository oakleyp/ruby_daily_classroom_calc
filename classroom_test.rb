require 'minitest/autorun'
require_relative 'classroom'

DATA = {
  indiana: [94, 82, 59, 95, 55, 98, 93, 84, 81, 75],
  nevada: [53, 84, 98, 58, 75, 61, 67, 62, 60, 89],
  drew: [88, 55, 76, 66, 57, 57, 62, 89, 67, 76],
  dorian: [54, 58, 71, 63, 51, 72, 89, 93, 82, 76],
  chase: [59, 72, 52, 76, 45, 54, 63, 57, 68, 37],
  riley: [79, 92, 54, 71, 94, 77, 61, 57, 60, 75],
  kelly: [76, 92, 94, 89, 99, 66, 75, 93, 73, 96],
  allison: [87, 74, 77, 99, 58, 76, 55, 50, 89, 58],
  ryan: [89, 55, 57, 84, 57, 78, 69, 96, 82, 84],
  remy: [93, 96, 91, 99, 89, 97, 94, 77, 95, 82]
}

class ClassroomTest < Minitest::Test
  def test_averages
    assert_equal 91, averages(DATA)[:remy]
    assert_equal 70, averages(DATA)[:dorian]
  end

  def test_assignment_score
    assert_equal 55, assignment_score(DATA, :ryan, 2)
    assert_equal 75, assignment_score(DATA, :indiana, 10)
  end

  def test_assignment_scores
    assert_equal [82, 84, 55, 58, 72, 92, 92, 74, 55, 96], assignment_scores(DATA, 2)
    assert_equal [81, 60, 67, 82, 68, 60, 73, 89, 82, 95], assignment_scores(DATA, 9)
  end

  def test_assignment_average_score
    assert_equal 80, assignment_average_score(DATA, 4)
    assert_equal 75, assignment_average_score(DATA, 8)
  end

  def test_letter_grade
    assert_equal "A", letter_grade(1000)
    assert_equal "A", letter_grade(92)
    assert_equal "B", letter_grade(84)
    assert_equal "C", letter_grade(70)
    assert_equal "D", letter_grade(69)
    assert_equal "F", letter_grade(2)
  end

  def test_final_letter_grades
    assert_equal "A", final_letter_grades(DATA)[:remy]
    assert_equal "B", final_letter_grades(DATA)[:kelly]
    assert_equal "B", final_letter_grades(DATA)[:indiana]
    assert_equal "F", final_letter_grades(DATA)[:chase]
  end

  def test_class_average
    assert_equal 74, class_average(DATA)
  end

  def test_top_students
    assert_equal [:remy, :kelly, :indiana], top_students(DATA, 3)
    assert_equal [:remy, :kelly, :indiana, :ryan, :riley, :allison, :nevada, :dorian, :drew, :chase], top_students(DATA, 10)
  end
end
