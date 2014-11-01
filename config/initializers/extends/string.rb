require 'nkf'

class String
  HYPHEN_LOOKING_CHARS = /[\u00AD\u2011-\u2015\u2043\uFE63\u2212\u207B\u208B\uFF0D\u30FC]/

  # self を半角にした文字列を返す
  # @return [String] 半角にした文字列
  def hankaku
    NKF.nkf('-wWm0Z1', self).gsub(HYPHEN_LOOKING_CHARS, '-')
  end
end
