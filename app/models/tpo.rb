class Tpo < ActiveHash::Base
  self.data = [
    {id: 1, name: '---'},
    {id: 2, name: 'カジュアル'},
    {id: 3, name: 'フォーマル'},
    {id: 4, name: 'セミフォーマル'},
    {id: 5, name: 'フォーマル・カジュアル'},
    {id: 6, name: 'その他'}
  ]

  include ActiveHash::Associations
  has_many :kimonos
end
