class Record

  attr_accessor :email, :_saved

  def save
    @_saved = true
  end

  def saved?
    !!@_saved
  end

end