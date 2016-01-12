#
class String

  #
  def warningfy
    "\033[33m#{self}\033[0m"
  end

  #
  def successfy
    "\033[32m#{self}\033[0m"
  end

  #
  def failurefy
    "\033[31m#{self}\033[0m"
  end
end
