export interface Sight {
  id: string
  name: string
  image: string
  description: string
  location: string
  fullDescription?: string
  address?: string
  mapLink?: string
}

export interface AnnualEvent {
  id: string
  name: string
  image: string
  description: string
  date?: string
  fullDescription?: string
}

export interface CityInfo {
  title: string
  description: string
  fullDescription?: string
}

export interface Infrastructure {
  id: string
  name: string
  type: InfrastructureType
  image?: string
  address: string
  phone?: string
  email?: string
  website?: string
  mapLink?: string
}

export type InfrastructureType = 
  | 'museum' 
  | 'theatre' 
  | 'cinema' 
  | 'library'
  | 'exhibition'
  | 'culture_palace'
  | 'restaurant'
  | 'sport'
  | 'shopping'
  | 'temple'

export interface Contact {
  organization: string
  address: string
  phone: string
  email?: string
  website?: string
}

export interface Banner {
  id: string
  image: string
  title?: string
}

export const banners: Banner[] = [
  { id: '1', image: 'https://tour.citymurmansk.ru/images/banners/banner_01.jpg' },
  { id: '2', image: 'https://tour.citymurmansk.ru/images/banners/banner_02.jpg' },
  { id: '3', image: 'https://tour.citymurmansk.ru/images/banners/banner_03-1.jpg' },
  { id: '4', image: 'https://tour.citymurmansk.ru/images/banners/banner_03-2.jpg' },
  { id: '5', image: 'https://tour.citymurmansk.ru/images/banners/banner_04.jpg' },
  { id: '6', image: 'https://tour.citymurmansk.ru/images/banners/banner_05.jpg' },
  { id: '7', image: 'https://tour.citymurmansk.ru/images/banners/banner_06.jpg' },
  { id: '8', image: 'https://tour.citymurmansk.ru/images/banners/banner_07.jpg' },
  { id: '9', image: 'https://tour.citymurmansk.ru/images/banners/banner_08.jpg' },
  { id: '10', image: 'https://tour.citymurmansk.ru/images/banners/banner_09.jpg' },
  { id: '11', image: 'https://tour.citymurmansk.ru/images/banners/banner_10.jpg' }
]

export const sightsData: Sight[] = [
  {
    id: '1',
    name: 'Memorial to Defenders of the Soviet Arctic («Alyosha»)',
    image: 'https://tour.citymurmansk.ru/img/210x157/9/alesha-d3c1841f.jpg',
    description: 'Location - Murmansk city, Green Cape Hill. From the first days of the opening of the memorial "Alyosha" became a place of worship for the heroic defenders of the Soviet Arctic.',
    location: 'Murmansk city, Green Cape Hill',
    address: 'Green Cape Hill, Murmansk',
    mapLink: 'https://yandex.ru/maps/-/CVrwNXn~'
  },
  {
    id: '2',
    name: 'Memorial «To the Seamen who died in peacetime»',
    image: 'https://tour.citymurmansk.ru/img/210x157/2/3-58ddefc1.jpg',
    description: 'Location – Murmansk city, descent between Chelyuskintsev Street and Geroev Severomortsev Avenue.',
    location: 'Chelyuskintsev Street and Geroev Severomortsev Avenue',
    address: 'Chelyuskintsev Street, Murmansk'
  },
  {
    id: '3',
    name: 'Spaso-Preobrazhensky Marine Cathedral',
    image: 'https://tour.citymurmansk.ru/img/210x157/3/1-9e5308bc.jpg',
    description: 'Location – Murmansk, descent between Chelyuskintsev Street and Geroev Severomortsev Avenue. It is the tallest Orthodox church in the world located north of the Arctic Circle.',
    location: 'Chelyuskintsev Street, Murmansk',
    address: 'Chelyuskintsev Street, Murmansk'
  },
  {
    id: '4',
    name: 'Nuclear-powered icebreaker «Lenin»',
    image: 'https://tour.citymurmansk.ru/img/210x157/4/ledokol-bded6daa.jpg',
    description: 'Location - Murmansk city, Portovy Passage, 25. The world\'s first nuclear-powered icebreaker, now a museum ship.',
    location: 'Portovy Passage, 25',
    address: 'Portovy Passage, 25, Murmansk',
    mapLink: 'https://yandex.ru/maps/-/CVrXj-3J',
    fullDescription: 'The nuclear icebreaker Lenin was built in one year and launched in 1957 at the Marti shipyard in Leningrad. It was the world\'s first surface vessel with a nuclear power plant. Today, the nuclear icebreaker Lenin is a museum and the only cultural heritage site of federal significance in Murmansk.'
  },
  {
    id: '5',
    name: 'Murmansk Regional Drama Theatre',
    image: 'https://tour.citymurmansk.ru/img/210x157/4/drama-8f3ad627.jpg',
    description: 'Location – Murmansk city, Lenin Ave, 49. The Murmansk Regional Drama Theatre was founded in 1946.',
    location: 'Lenin Ave, 49',
    address: 'Lenin Ave, 49, Murmansk'
  },
  {
    id: '6',
    name: 'The Bridge Across the Kola Bay',
    image: 'https://tour.citymurmansk.ru/img/210x157/e/f20110224135137248001027236afe-79d69d2d.jpg',
    description: 'Location – Murmansk city, the shore of the Kola Bay. One of the longest bridges in Russia.',
    location: 'Kola Bay, Murmansk',
    address: 'Kola Bay, Murmansk'
  },
  {
    id: '7',
    name: 'Naval Museum of the Northern Fleet',
    image: 'https://tour.citymurmansk.ru/img/210x157/3/29529ffad9-c92835f6.jpg',
    description: 'Location – Murmansk city, Tortsev Street, 15. Immediately after the Great Patriotic War, the museum was established.',
    location: 'Tortsev Street, 15',
    address: 'Tortsev Street, 15, Murmansk',
    mapLink: 'https://yandex.ru/maps/-/CVr1bYpq'
  },
  {
    id: '8',
    name: 'Memorial to Seamen-Submariners (cabin of «Kursk»)',
    image: 'https://tour.citymurmansk.ru/img/210x157/4/kursk-327a6008.jpg',
    description: 'Location – Murmansk city. Cabin of NPS «Kursk» memorial dedicated to the submariners who died in peacetime.',
    location: 'Chelyuskintsev Street, Murmansk',
    address: 'Chelyuskintsev Street, Murmansk'
  },
  {
    id: '9',
    name: 'Drama Theatre of the Northern Fleet',
    image: 'https://tour.citymurmansk.ru/img/210x157/3/117292e8bea-4164399a.jpg',
    description: 'Location – Murmansk city, Kolsky Avenue, 136. The first location of the theater was the House of the Red Army.',
    location: 'Kolsky Avenue, 136',
    address: 'Kolsky Avenue, 136, Murmansk'
  },
  {
    id: '10',
    name: 'Memorial Sign to Heroes of Severomorsk',
    image: 'https://tour.citymurmansk.ru/img/210x157/c/554fa1b583e646fc0c85369667515a16f8d87-56413c46.jpg',
    description: 'Location – Murmansk city, Geroev Severomortsev Street. Memorial sign "Heroes of Severomorsk who died during the Great Patriotic War".',
    location: 'Geroev Severomortsev Street, Murmansk',
    address: 'Geroev Severomortsev Street, Murmansk'
  },
  {
    id: '11',
    name: 'S.M.Kirov Murmansk Regional Palace of Culture',
    image: 'https://tour.citymurmansk.ru/img/210x157/9/kirovka702f6-a691a5c4.jpg',
    description: 'Location – Murmansk city, Pushkinskaya Street, 3. Something interesting happens in the S.M. Kirov Palace of Culture every day.',
    location: 'Pushkinskaya Street, 3',
    address: 'Pushkinskaya Street, 3, Murmansk'
  },
  {
    id: '12',
    name: 'Murmansk Regional Puppet Theatre',
    image: 'https://tour.citymurmansk.ru/img/210x157/e/puppettheatre-e9406491.jpg',
    description: 'Location - Murmansk, Lenin Avenue, 27. Murmansk Regional Puppet Theater was founded on April 13, 1933.',
    location: 'Lenin Avenue, 27',
    address: 'Lenin Avenue, 27, Murmansk'
  },
  {
    id: '13',
    name: 'Murmansk Regional Art Museum',
    image: 'https://tour.citymurmansk.ru/img/210x157/8/-485967dc.jpg',
    description: 'Location - Murmansk city, Cominterna street, 13. The Murmansk Regional Art Museum is one of the youngest art museums in Russia.',
    location: 'Cominterna street, 13',
    address: 'Cominterna street, 13, Murmansk',
    mapLink: 'https://yandex.ru/maps/-/CVrwNXn~'
  },
  {
    id: '14',
    name: 'Monument «To victims of Intervention in 1918-1920»',
    image: 'https://tour.citymurmansk.ru/img/210x157/e/2-0aea49b9.jpg',
    description: 'Location – Murmansk city, public garden near Leningradskaya Street. The first monument in Murmansk.',
    location: 'Leningradskaya Street, Murmansk',
    address: 'Leningradskaya Street, Murmansk'
  },
  {
    id: '15',
    name: 'Monument «Waiting Girl»',
    image: 'https://tour.citymurmansk.ru/img/210x157/e/zhduschaya-f7735ca9.jpg',
    description: 'Location – Murmansk city, near Chumbarov-Luchinsky Street, 40. Unveiling of the monument has been held on July 3, 2012.',
    location: 'Chumbarov-Luchinsky Street, 40',
    address: 'Chumbarov-Luchinsky Street, 40, Murmansk'
  },
  {
    id: '16',
    name: 'Monument «Anatoly Bredov»',
    image: 'https://tour.citymurmansk.ru/img/210x157/1/bredov-ee561c69.jpg',
    description: 'Location – Murmansk, crossroads of Lenin Avenue and Profsoyuzov street. On May 9, 1964, the bust of A. Bredov was solemnly opened.',
    location: 'Lenin Avenue and Profsoyuzov street',
    address: 'Lenin Avenue, Murmansk'
  },
  {
    id: '17',
    name: 'Regional Museum of Local History',
    image: 'https://tour.citymurmansk.ru/img/210x157/9/15dc3f0-62ebd0c5.jpg',
    description: 'Location - Murmansk, Lenin Avenue, 90. The oldest museum of the Murmansk region, founded in 1926.',
    location: 'Lenin Avenue, 90',
    address: 'Lenin Avenue, 90, Murmansk',
    mapLink: 'https://yandex.ru/maps/-/CCUyuDTX2A'
  },
  {
    id: '18',
    name: 'Monument to «Cat Semyon»',
    image: 'https://tour.citymurmansk.ru/img/210x157/2/5da900-ef31f73d.jpg',
    description: 'Location – Murmansk, territory of park «Semenovskoe Lake». In October 2, 2013 in Murmansk, a monument to the cat Semyon was opened.',
    location: 'Semenovskoe Lake Park',
    address: 'Semenovskoe Lake Park, Murmansk'
  },
  {
    id: '19',
    name: 'Monument to «Frontier Guards of The Arctic»',
    image: 'https://tour.citymurmansk.ru/img/210x157/2/20e342b-bf7cbba2.jpg',
    description: 'Location – Murmansk, the square near Murmansk Regional Drama Theatre.',
    location: 'Near Drama Theatre, Murmansk',
    address: 'Lenin Ave, 49, Murmansk'
  },
  {
    id: '20',
    name: 'Museum of the Murmansk Commercial Sea Port',
    image: 'https://tour.citymurmansk.ru/img/210x157/1/-4e323476.jpg',
    description: 'The Murmansk Commercial Sea Port occupies a special place in the history of the development of the Northern Sea Route.',
    location: 'Portovy Ave., 19A',
    address: 'Portovy Ave., 19A, Murmansk'
  }
]

export const annualEventsData: AnnualEvent[] = [
  {
    id: '1',
    name: '«Ski Track is calling!»',
    image: 'https://tour.citymurmansk.ru/img/200x150/1/7d772-f93e49ac.jpg',
    description: 'January-April. The contest "Ski Track is Calling" is held for the purpose of the city residents.',
    date: 'January-April'
  },
  {
    id: '2',
    name: 'The Festival of The Sun',
    image: 'https://tour.citymurmansk.ru/img/200x150/1/111e99-e2550301.jpg',
    description: 'January. "Hello, Sun!" - a holiday in honor of the polar night ending and the sun returning.',
    date: 'January'
  },
  {
    id: '3',
    name: '«Native house - the native city»',
    image: 'https://tour.citymurmansk.ru/img/200x150/a/4be9c-af7e36db.jpg',
    description: 'January-December. The project is a contest of sports records.',
    date: 'January-December'
  },
  {
    id: '4',
    name: 'Exhibition «Sea. Resources. Technology»',
    image: 'https://tour.citymurmansk.ru/img/200x150/d/025b962-861184a3.jpg',
    description: 'March. The exhibition is held with the support of Government of the Murmansk region.',
    date: 'March'
  },
  {
    id: '5',
    name: 'The Festival of The North',
    image: 'https://tour.citymurmansk.ru/img/200x150/7/29978c-794a8c67.jpg',
    description: 'March-April. Sports competitions in winter sports, held annually in early spring.',
    date: 'March-April'
  },
  {
    id: '6',
    name: '«Youth Murmansk - descendants of soldiers»',
    image: 'https://tour.citymurmansk.ru/img/200x150/8/7713a-2702ad11.jpg',
    description: 'May. Gathering-hike to places of military glory.',
    date: 'May'
  },
  {
    id: '7',
    name: 'Victory Day',
    image: 'https://tour.citymurmansk.ru/img/200x150/8/3831bd-54c9f7e5.jpg',
    description: 'May 9th. Festive events dedicated to the Victory Day in the Great Patriotic War.',
    date: 'May 9'
  },
  {
    id: '8',
    name: 'Business exhibition «Kola partnership»',
    image: 'https://tour.citymurmansk.ru/img/200x150/1/4cc9fc-c99c0e59.jpg',
    description: 'May. Biggest international universal exhibition.',
    date: 'May'
  },
  {
    id: '9',
    name: 'Day of Slavic Writing and Culture',
    image: 'https://tour.citymurmansk.ru/img/200x150/7/5a0a4c-e294151c.jpg',
    description: 'May, 24th. The origins of this holiday are inextricably linked with Saints Cyril and Methodius.',
    date: 'May 24'
  },
  {
    id: '10',
    name: 'Fisherman\'s Day',
    image: 'https://tour.citymurmansk.ru/img/200x150/4/e3265-2a1ac78b.jpg',
    description: 'July (second Sunday). Fisherman\'s Day in Murmansk always celebrated on a grand scale.',
    date: 'July (second Sunday)'
  },
  {
    id: '11',
    name: 'Youth Day',
    image: 'https://tour.citymurmansk.ru/img/200x150/e/2f488-9b42a72b.jpg',
    description: 'June. City Holiday "Youth Day" includes work of many entertainment venues.',
    date: 'June'
  },
  {
    id: '12',
    name: 'Race «Kola - Murmansk»',
    image: 'https://tour.citymurmansk.ru/img/200x150/7/1df3d95f60614c9be1-350cdbef.jpg',
    description: 'October. Race in "Kola - Murmansk" is conducted to further promotion of athletics.',
    date: 'October'
  },
  {
    id: '13',
    name: 'Festival of sport «Gulfstream»',
    image: 'https://tour.citymurmansk.ru/img/200x150/e/golfstream-a3f14fc1.jpg',
    description: 'September. The festival "Gulf stream" continues the legendary "Murmansk mile".',
    date: 'September'
  },
  {
    id: '14',
    name: 'Birthday of Murmansk',
    image: 'https://tour.citymurmansk.ru/img/200x150/0/03b9e1f-0dfb3331.jpg',
    description: 'October 4. On this day in Murmansk hosts various actions dedicated to this event.',
    date: 'October 4'
  },
  {
    id: '15',
    name: 'Mass sprint «My Murmansk»',
    image: 'https://tour.citymurmansk.ru/img/200x150/b/02cc9a9-37aa41c4.jpg',
    description: 'October. Held in celebration of the "Day of the City".',
    date: 'October'
  },
  {
    id: '16',
    name: 'Exhibition-fair «The polar Autumn»',
    image: 'https://tour.citymurmansk.ru/img/200x150/3/fe48d-af7dc859.jpg',
    description: 'October. This is Autumn Exhibition-Fair.',
    date: 'October'
  },
  {
    id: '17',
    name: 'International festival «Polar star»',
    image: 'https://tour.citymurmansk.ru/img/200x150/f/33355-fc37e44e.jpg',
    description: 'November. In the poster of festival there are drama, puppet theater, musical theater.',
    date: 'November'
  },
  {
    id: '18',
    name: 'Business week «Murmansk international business week»',
    image: 'https://tour.citymurmansk.ru/img/200x150/e/39166-c504165f.jpg',
    description: 'November. "Murmansk International Business Week" includes conferences, trade fairs.',
    date: 'November'
  },
  {
    id: '19',
    name: 'International festival «Northern character»',
    image: 'https://tour.citymurmansk.ru/img/200x150/b/kinonorthchar-2ba28fe4.jpg',
    description: 'November. International festival of documentary films and TV programs.',
    date: 'November'
  },
  {
    id: '20',
    name: 'International exhibition «SevTEK»',
    image: 'https://tour.citymurmansk.ru/img/200x150/1/a2bb8-6422edd5.jpg',
    description: 'November. "SevTEK" traditionally brings together all of the fuel and energy sector.',
    date: 'November'
  },
  {
    id: '21',
    name: 'Grand opening of Christmas Tree',
    image: 'https://tour.citymurmansk.ru/img/200x150/7/elka13e900-e7ba8db1.jpg',
    description: 'December (first Sunday). City main Christmas tree in arctic Murmansk traditionally opened earlier.',
    date: 'December (first Sunday)'
  }
]

export const museumsData: Infrastructure[] = [
  {
    id: 'm1',
    name: 'Murmansk Regional Museum of Local Lore',
    type: 'museum',
    image: 'https://tour.citymurmansk.ru/images/инфраструктура/музеи/15_dc3f0_9bf8c.jpg',
    address: 'Murmansk, Lenin Avenue, 90',
    phone: '8(8152) 99-43-80',
    email: 'mokm.51@yandex.ru',
    website: 'https://mokm51.ru/',
    mapLink: 'https://yandex.ru/maps/-/CCUyuDTX2A'
  },
  {
    id: 'm2',
    name: 'Murmansk Regional Art Museum',
    type: 'museum',
    image: 'https://tour.citymurmansk.ru/images/инфраструктура/музеи/художественный_музей.jpg',
    address: 'Murmansk, Comintern Str., 13',
    phone: '(8152) 450-385',
    email: 'info@artmmuseum.ru',
    website: 'https://artmmuseum.ru/',
    mapLink: 'https://yandex.ru/maps/-/CVrwNXn~'
  },
  {
    id: 'm3',
    name: 'Museum «Nuclear icebreaker «Lenin»',
    type: 'museum',
    image: 'https://tour.citymurmansk.ru/images/инфраструктура/музеи/ледокол_ленин_98426.jpg',
    address: 'Murmansk, Portovy Lane, 25',
    phone: '(8152) 55-35-13',
    mapLink: 'https://yandex.ru/maps/-/CVrXj-3J'
  },
  {
    id: 'm4',
    name: 'Naval Museum of the Northern Fleet',
    type: 'museum',
    image: 'https://tour.citymurmansk.ru/images/инфраструктура/музеи/29529_ffad9.jpg',
    address: 'Murmansk, Tortsev Str., 15',
    phone: '(8152) 22-14-45',
    website: 'https://vk.com/vmmsf51',
    mapLink: 'https://yandex.ru/maps/-/CVr1bYpq'
  },
  {
    id: 'm5',
    name: 'Museum of the Murmansk Seaport',
    type: 'museum',
    image: 'https://tour.citymurmansk.ru/images/инфраструктура/музеи/mmtp.jpg',
    address: 'Murmansk, Portovy Ave., 19A',
    phone: '(8152) 48-01-11'
  }
]

export const theatresData: Infrastructure[] = [
  {
    id: 't1',
    name: 'Murmansk Regional Drama Theatre',
    type: 'theatre',
    address: 'Murmansk, Lenin Ave, 49'
  },
  {
    id: 't2',
    name: 'Drama Theatre of the Northern Fleet',
    type: 'theatre',
    address: 'Murmansk, Kolsky Avenue, 136'
  },
  {
    id: 't3',
    name: 'Murmansk Regional Puppet Theatre',
    type: 'theatre',
    address: 'Murmansk, Lenin Avenue, 27',
    website: 'https://murmankukla.ru/'
  }
]

export const contactsData: Contact[] = [
  {
    organization: 'Murmansk city administration',
    address: '183006, Murmansk, Lenin Avenue, 75',
    phone: '(8152) 45-02-69',
    email: 'citymurmansk@citymurmansk.ru',
    website: 'https://citymurmansk.ru'
  },
  {
    organization: 'Reception of the Head of Murmansk city',
    address: 'Murmansk, Lenin Avenue, 75',
    phone: '(8152) 21-10-51',
    email: 'priemnaya@citymurmansk.ru'
  },
  {
    organization: 'Committee on Economic Development and Tourism',
    address: '183038, Murmansk, Lenin Ave, 87',
    phone: '(8152) 45-02-69',
    email: 'ekonomika@citymurmansk.ru',
    website: 'https://yandex.ru/maps/-/CVrL4P-Y'
  }
]

export const cityInfoData: CityInfo = {
  title: 'Welcome to Murmansk',
  description: 'Murmansk is a young, strong and very unusual city with the great potential for sustainable development. It is the largest Russian city beyond the Polar Circle, with a population of about three hundred thousand people located on the coast of the ice-free Kola Bay. Here begins the Great Northern Sea Route, which makes the city the most powerful northern port in Europe.',
  fullDescription: `The city of Murmansk is the administrative center of the Murmansk region. Founded on October 4, 1916.

Initially, the city was proclaimed as "Romanov-on-Murman", and only in April 1917 was it given its current name "Murmansk".

The city is located above the Arctic Circle, among endless hills on the shores of the ice-free Kola Bay, 56 kilometers from the mouth of the Barents Sea. Its geographic coordinates are 68°58' north latitude and 33°03' east longitude.

Murmansk is the largest city in the world north of the Arctic Circle, with a population of approximately 300,000.

Every year, from December 2nd to January 11th, polar night sets in at Murmansk's latitude for 40 days. In winter, you can observe the Northern Lights—a stunningly beautiful natural phenomenon. In summer, Murmansk experiences the polar day, which lasts 62 calendar days.`
}

export interface Highway {
  name: string
  description: string
}

export interface BorderCrossing {
  name: string
  description: string
}

export interface TransportFacility {
  name: string
  address: string
  phone?: string
  website?: string
}

export interface TransportInfo {
  airport: TransportFacility
  railway: TransportFacility
  highways: Highway[]
  borderCrossings: BorderCrossing[]
}

export const transportInfo: TransportInfo = {
  airport: {
    name: 'Airport "Murmansk"',
    address: '184355, Murmansk region., Murmashi, Airport',
    phone: '(8152) 31-14-00',
    website: 'https://airport-murmansk.ru/'
  },
  railway: {
    name: 'Murmansk Railway Station',
    address: '183038, Murmansk, Privokzalnaya str., 14',
    website: 'https://rzd.ru/'
  },
  highways: [
    { name: 'Federal highway "Kola" (M18)', description: 'From Murmansk to St. Petersburg (~1400 km)' },
    { name: 'Road "A138"', description: 'To Norway' },
    { name: 'Road "R12"', description: 'To Finland' }
  ],
  borderCrossings: [
    { name: 'Borisoglebsk', description: 'Crossing to Norway' },
    { name: 'Lotta', description: 'Crossing to Finland' },
    { name: 'Salla', description: 'Crossing to Finland' }
  ]
}
