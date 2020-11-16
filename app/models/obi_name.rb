class ObiName < ActiveHash::Base
  self.data = [
    {id: 1, name: '---'},
    {id: 2, name: '袋帯'},
    {id: 3, name: '名古屋帯'},
    {id: 4, name: '袋名古屋帯'},
    {id: 5, name: '半幅帯'},
    {id: 6, name: '半幅帯（浴衣用）'},
    {id: 7, name: '兵児帯'},
    {id: 8, name: '丸帯'},
    {id: 9, name: 'その他'}
  ]

  include ActiveHash::Associations
  has_many :obis
end
