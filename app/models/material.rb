class Material < ActiveHash::Base
  self.data = [
    {id: 1, name: '---'},
    {id: 2, name: '絹'},
    {id: 3, name: '木綿'},
    {id: 4, name: '麻'},
    {id: 5, name: 'ウール'},
    {id: 6, name: 'ポリエステル'},
    {id: 7, name: 'その他'},
  ]

  include ActiveHash::Associations
  has_many :kimonos
end
