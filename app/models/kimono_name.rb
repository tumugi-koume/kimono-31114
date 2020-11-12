class KimonoName < ActiveHash::Base
  self.data = [
    {id: 1, name: '---'},
    {id: 2, name: '小紋'},
    {id: 3, name: '紬'},
    {id: 4, name: '色無地'},
    {id: 5, name: '付下げ'},
    {id: 6, name: '訪問着'},
    {id: 7, name: '留袖'},
    {id: 8, name: '振袖'},
    {id: 9, name: '喪服'},
    {id: 10, name: '浴衣'},
    {id: 11, name: 'その他'}
  ]

  include ActiveHash::Associations
  has_many :kimonos
  
end
