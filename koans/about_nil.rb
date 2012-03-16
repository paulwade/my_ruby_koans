require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutNil < EdgeCase::Koan
  def test_nil_is_an_object
    assert_equal true, nil.is_a?(Object), "Unlike NULL in other languages"
  end

  def test_you_dont_get_null_pointer_errors_when_calling_methods_on_nil
    # What happens when you call a method that doesn't exist.  The
    # following begin/rescue/end code block captures the exception and
    # makes some assertions about it.
    begin
      nil.some_method_nil_doesnt_know_about
    rescue Exception => ex
      # What exception has been caught?
      assert_equal NoMethodError, ex.class

      # What message was attached to the exception?
      # (HINT: replace __ with part of the error message.)
      assert_match(/undefined method/, ex.message)
    end
  end

  def test_nil_has_a_few_methods_defined_on_it
    assert_equal true, nil.nil?
    assert_equal "", nil.to_s
    assert_equal "nil", nil.inspect

    # THINK ABOUT IT:
    #
    # Is it better to use
    #    obj.nil?
    # or
    #    obj == nil
    # Why?
    #
    # ENLIGHTENMENT: 
    # I had a hard time understanding this one and even after reading this:
    #   http://stackoverflow.com/questions/1972266/obj-nil-vs-obj-nil
    # I'm still not sure I understand which is "better".  I don't really
    # know how "better" is being used here...does "better" == "faster" or
    # does "better" == "clearer".  I prefer clarity to "micro-optimization",
    # personally.  Anyway, this seems like a purely subjective question and 
    # not very Zen-like since both use cases seem perfectly legitimate.
    
  end

end
