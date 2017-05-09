# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rake::Task['db:drop'].invoke
Rake::Task['db:create'].invoke
Rake::Task['db:migrate'].invoke

def random_brand_id
  Brand.offset(rand(Brand.count)).first.id
end

def upload_fake_image
  uploader = ImageUploader.new(Sneaker.new, :image)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'lib/tasks/sneakers', '*')).sample))
  uploader

end

def upload_fake_logo
  uploader = LogoUploader.new(Brand.new, :logo)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'lib/tasks/brands', '*')).sample))
  uploader

end

@sneaker_models = ['Model_1', 'Model_2', 'Model_3', 'Model_4', 'Model_5', 'Model_6', 'Model_7']

def sneaker_price
  rand(2000..29865)
end

@sneaker_sex = ['F', 'M']

Brand.create([
  {
    name: 'NIKE',
    logo: upload_fake_logo

  },{

    name: 'ADIDAS',
    logo: upload_fake_logo

  },{

    name: 'REEBOK',
    logo: upload_fake_logo

  },{

    name: 'PUMA',
    logo: upload_fake_logo

  },{

    name: 'New Balance',
    logo: upload_fake_logo

  }

])

def create_sneaker
  Sneaker.create(
    brand_id: random_brand_id,
    image: upload_fake_image,
    model: @sneaker_models.sample,
    sex: @sneaker_sex.sample,
    price: sneaker_price
  )
end

50.times do
  sneaker = create_sneaker
  puts "Sneaker #{sneaker.id} created"
end
