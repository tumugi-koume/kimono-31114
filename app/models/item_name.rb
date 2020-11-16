class ItemName < ActiveHash::Base
  self.data = [
    {id: 1, name: '---'},
    {id: 2, name: '長襦袢'},
    {id: 3, name: '半襟'},
    {id: 4, name: '帯揚'},
    {id: 5, name: '帯締'},
    {id: 6, name: '帯留'},
    {id: 7, name: '足袋'},
    {id: 8, name: '草履・履物'},
    {id: 9, name: '羽織紐'},
    {id: 10, name: '根付'},
    {id: 11, name: 'バック'},
    {id: 12, name: '袴'},
    {id: 13, name: 'その他'},
  ]

  include ActiveHash::Associations
  has_many :items
end
