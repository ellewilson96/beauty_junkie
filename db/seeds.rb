# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Brand.create(name: 'Estee Lauder')
Brand.create(name: 'NARS')
Brand.create(name: 'Too Faced')
Brand.create(name: 'La Mer')
Brand.create(name: 'Benefit')
Brand.create(name: 'MakeUp ForEver')
Brand.create(name: 'Drunk Elephant')
Brand.create(name: 'Laura Mercier')
Brand.create(name: 'Fresh')
Brand.create(name: 'Bobbi Brown')
Brand.create(name: 'Yves Saint Laurent')
Brand.create(name: 'Tom Ford')
Brand.create(name: 'Dior')
Brand.create(name: 'Chanel')
Brand.create(name: 'Huda Beauty')
Brand.create(name: 'First Aid Beauty')
Brand.create(name: 'Hourglass')

Product.create(name: "Radiant Creamy Concealer", description: "An award-winning concealer that provides medium-to-full, buildable coverage and corrects, contours, highlights, and perfects.", ingredient_list: "Aqua (Water), Dimethicone, Hydrogenated Polydecene, Propanediol, Butylene Glycol, Peg-9 Polydimethylsiloxyethyl Dimethicone, Glycerin, Disteardimonium Hectorite, Peg-10 Dimethicone, Polymethyl Methacrylate, Bis-Butyldimethicone Polyglyceryl-3, Sorbitan Sesquiisostearate, Dimethicone/Vinyl Dimethicone Crosspolymer, Phenoxyethanol, Isostearic Acid, Polysilicone-2, Aluminum Hydroxide, Maltodextrin, Trisodium Edta, Lecithin, Silica, Tin Oxide, Triethoxycaprylylsilane, Tocopheryl Acetate, Sodium Metabisulfite, Magnolia Officinalis (Magnolia Officinalis Bark Extract), Tocopherol, Vitis Vinifera; May Contain: Mica, Ci 77891 (Titanium Dioxide), Ci 77491 (Iron Oxides), Ci 77492 (Iron Oxides), Ci 77499 (Iron Oxides), Ci 77163 (Bismuth Oxychloride), Ci 42090 (Blue 1 Lake)].", brand_id: "2")
Product.create(name: "Chocolate Soleil Matte Bronzer", description: "A long-wearing, rich, matte bronzer infused with 100 percent real cocoa powder. ", ingredient_list: "Talc, Mica, Titanium Dioxide, Octyldodecyl Stearoyl Stearate, Ethylhexyl Palmitate, Boron Nitride, Zinc Stearate, Sodium Saccharin, Fragrance, Silica, Sodium Dehydroacetate, Phenoxyethanol, Benzyl Benzoate, Tocopherol, Ascorbyl Palmitate, Theobroma Cacao (Cocoa) Fruit Powder/Theobroma Cacao Fruit Powder, Benzyl Alcohol, Iron Oxides (Ci 77491, Ci 77492, Ci 77499), Manganese Violet (Ci 77742).", brand_id: "3")
Product.create(name: "They’re Real! Lengthening & Volumizing Mascara", description: "A lengthening mascara that curls, volumizes, lifts, and separates lashes for an out-of-here look—now available in two vibrant shades.", ingredient_list: "Water (Aqua), Paraffin, Polybutene, Styrene/Acrylates/Ammonium Methacrylate Copolymer, Beeswax (Cera Alba), Bis-Diglyceryl Polyacyladipate-2, C18-36 Acid Triglyceride, Palmitic Acid, Stearic Acid, Triethanolamine, VP/Eicosene Copolymer, Acacia Senegal Gum, Hydroxyethylcellulose, Phenoxyethanol, Tetrasodium EDTA, Butylene Glycol, Caprylyl Glycol, Tocopheryl Acetate, Sodium Laureth-12 Sulfate, Glycerin, Potassium Sorbate, Sericin, Calcium Chloride, Sodium Hyaluronate, Tilia Tomentosa Bud Extract, Citric Acid, BHT, Sorbic Acid, May Or May Not Contain: Iron Oxides (CI 77491, CI 77492, CI 77499), Ultramarines (CI 77007), Chromium Oxide Greens (CI 77288), Chromium Hydroxide Green (CI 77289), Titanium Dioxide ( CI 77891)", brand_id: "5")
