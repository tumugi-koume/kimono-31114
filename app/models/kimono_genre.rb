class KimonoGenre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---'},
    { id: 2, name: '袷'},
    { id: 3, name: '単衣'},
    { id: 4, name: '夏物'},
    { id: 5, name: '夏単衣'},
    { id: 6, name: 'その他'}
  ]

  include ActiveHash::Associations
  has_many :kimonos
  
end
