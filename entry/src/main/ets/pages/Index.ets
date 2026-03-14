import { Sight, AnnualEvent, CityInfo, Banner, sightsData, annualEventsData, cityInfoData, banners } from '../models/DataModels'
import router from '@ohos.router'

@Entry
@Component
struct Index {
  @State currentTab: number = 0
  @State sights: Sight[] = sightsData
  @State events: AnnualEvent[] = annualEventsData
  @State cityInfo: CityInfo = cityInfoData
  @State bannerList: Banner[] = banners
  @State swiperIndex: number = 0

  build() {
    Tabs({ index: $$this.currentTab }) {
      TabContent() {
        this.HomeContent()
      }
      .tabBar('Home')

      TabContent() {
        this.SightsContent()
      }
      .tabBar('Sights')

      TabContent() {
        this.EventsContent()
      }
      .tabBar('Events')

      TabContent() {
        this.MoreContent()
      }
      .tabBar('More')
    }
    .barPosition(BarPosition.End)
    .barMode(BarMode.Fixed)
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  @Builder
  HomeContent() {
    Scroll() {
      Column() {
        this.BannerSwiper()
        this.WelcomeSection()
        this.FeaturedSights()
        this.FeaturedEvents()
      }
    }
    .scrollBar(BarState.Off)
    .width('100%')
    .height('100%')
  }

  @Builder
  BannerSwiper() {
    Stack() {
      Swiper() {
        ForEach(this.bannerList, (banner: Banner) => {
          Image(banner.image)
            .width('100%')
            .height(280)
            .objectFit(ImageFit.Cover)
        }, (banner: Banner) => banner.id)
      }
      .autoPlay(true)
      .interval(4000)
      .indicator(false)
      .onChange((index: number) => {
        this.swiperIndex = index
      })

      Column() {
        Text('Murmansk')
          .fontSize(36)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
          .textShadow({ radius: 4, color: '#80000000', offsetX: 0, offsetY: 2 })

        Text('Capital of the Russian Arctic')
          .fontSize(16)
          .fontColor(Color.White)
          .margin({ top: 8 })
          .textShadow({ radius: 2, color: '#80000000', offsetX: 0, offsetY: 1 })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .linearGradient({
        angle: 180,
        colors: [['#00000000', 0], ['#80000000', 1]]
      })

      Row() {
        ForEach(this.bannerList, (banner: Banner, index: number) => {
          Circle()
            .width(6)
            .height(6)
            .fill(this.swiperIndex === index ? Color.White : '#80FFFFFF')
        }, (banner: Banner) => banner.id + '_dot')
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .position({ x: 0, y: 250 })
    }
    .width('100%')
    .height(280)
  }

  @Builder
  WelcomeSection() {
    Column() {
      Text('Welcome!')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .width('100%')

      Text(this.cityInfo.description)
        .fontSize(14)
        .fontColor('#333333')
        .lineHeight(22)
        .margin({ top: 12 })
        .width('100%')
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius({ topLeft: 20, topRight: 20 })
    .margin({ top: -20 })
  }

  @Builder
  FeaturedSights() {
    Column() {
      Row() {
        Text('Popular Sights')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        Blank()

        Text('See all')
          .fontSize(14)
          .fontColor('#007DFF')
          .onClick(() => {
            this.currentTab = 1
          })
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 20, bottom: 12 })

      Scroll() {
        Row() {
          ForEach(this.sights.slice(0, 5), (sight: Sight) => {
            this.SightCard(sight)
          }, (sight: Sight) => sight.id)
        }
        .padding({ left: 16, right: 16 })
      }
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.Off)
      .width('100%')
    }
    .width('100%')
    .margin({ top: 8 })
  }

  @Builder
  SightCard(sight: Sight) {
    Column() {
      Image(sight.image)
        .width(160)
        .height(120)
        .objectFit(ImageFit.Cover)
        .borderRadius({ topLeft: 12, topRight: 12 })

      Column() {
        Text(sight.name)
          .fontSize(13)
          .fontWeight(FontWeight.Medium)
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .height(36)

        Row() {
          Image($r('app.media.icon'))
            .width(12)
            .height(12)

          Text(sight.location.split(',')[0])
            .fontSize(11)
            .fontColor('#666666')
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .margin({ left: 4 })
        }
        .width('100%')
        .margin({ top: 4 })
      }
      .width('100%')
      .padding(8)
      .alignItems(HorizontalAlign.Start)
    }
    .width(160)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 8, color: '#1a000000', offsetX: 0, offsetY: 2 })
    .onClick(() => {
      router.pushUrl({
        url: 'pages/SightDetail/SightDetail',
        params: { sightId: sight.id }
      })
    })
  }

  @Builder
  FeaturedEvents() {
    Column() {
      Row() {
        Text('Annual Events')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        Blank()

        Text('See all')
          .fontSize(14)
          .fontColor('#007DFF')
          .onClick(() => {
            this.currentTab = 2
          })
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 24, bottom: 12 })

      Column() {
        ForEach(this.events.slice(0, 4), (event: AnnualEvent) => {
          this.EventCard(event)
        }, (event: AnnualEvent) => event.id)
      }
      .padding({ left: 16, right: 16 })
    }
    .width('100%')
    .margin({ bottom: 16 })
  }

  @Builder
  EventCard(event: AnnualEvent) {
    Row() {
      Image(event.image)
        .width(100)
        .height(80)
        .objectFit(ImageFit.Cover)
        .borderRadius(8)

      Column() {
        Text(event.name)
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })

        if (event.date) {
          Text(event.date)
            .fontSize(12)
            .fontColor('#007DFF')
            .margin({ top: 4 })
        }

        Text(event.description)
          .fontSize(11)
          .fontColor('#666666')
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .margin({ top: 2 })
      }
      .layoutWeight(1)
      .height(80)
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.Start)
      .padding({ left: 12 })
    }
    .width('100%')
    .padding(12)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1a000000', offsetX: 0, offsetY: 1 })
    .margin({ bottom: 12 })
    .onClick(() => {
      router.pushUrl({
        url: 'pages/EventDetail/EventDetail',
        params: { eventId: event.id }
      })
    })
  }

  @Builder
  SightsContent() {
    Column() {
      Text('Sights of Murmansk')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .padding(16)

      List({ space: 12 }) {
        ForEach(this.sights, (sight: Sight) => {
          ListItem() {
            this.SightListItem(sight)
          }
        }, (sight: Sight) => sight.id)
      }
      .width('100%')
      .layoutWeight(1)
      .padding({ left: 16, right: 16, bottom: 16 })
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  SightListItem(sight: Sight) {
    Row() {
      Image(sight.image)
        .width(120)
        .height(90)
        .objectFit(ImageFit.Cover)
        .borderRadius(8)

      Column() {
        Text(sight.name)
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })

        Text(sight.location)
          .fontSize(12)
          .fontColor('#666666')
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .margin({ top: 8 })
      }
      .layoutWeight(1)
      .height(90)
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.Start)
      .padding({ left: 12 })
    }
    .width('100%')
    .padding(12)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1a000000', offsetX: 0, offsetY: 1 })
    .onClick(() => {
      router.pushUrl({
        url: 'pages/SightDetail/SightDetail',
        params: { sightId: sight.id }
      })
    })
  }

  @Builder
  EventsContent() {
    Column() {
      Text('Traditional Annual Events')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .padding(16)

      List({ space: 12 }) {
        ForEach(this.events, (event: AnnualEvent) => {
          ListItem() {
            this.EventListItem(event)
          }
        }, (event: AnnualEvent) => event.id)
      }
      .width('100%')
      .layoutWeight(1)
      .padding({ left: 16, right: 16, bottom: 16 })
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  EventListItem(event: AnnualEvent) {
    Row() {
      Image(event.image)
        .width(100)
        .height(80)
        .objectFit(ImageFit.Cover)
        .borderRadius(8)

      Column() {
        Text(event.name)
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })

        if (event.date) {
          Text(event.date)
            .fontSize(12)
            .fontColor('#007DFF')
            .margin({ top: 4 })
        }

        Text(event.description)
          .fontSize(12)
          .fontColor('#666666')
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .margin({ top: 4 })
      }
      .layoutWeight(1)
      .height(80)
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.Start)
      .padding({ left: 12 })
    }
    .width('100%')
    .padding(12)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1a000000', offsetX: 0, offsetY: 1 })
    .onClick(() => {
      router.pushUrl({
        url: 'pages/EventDetail/EventDetail',
        params: { eventId: event.id }
      })
    })
  }

  @Builder
  MoreContent() {
    Scroll() {
      Column() {
        this.AboutSection()
        this.MenuItem('Museums & Theatres', 'Explore cultural institutions', 'pages/Infrastructure/InfrastructureList')
        this.MenuItem('Transport', 'How to arrive in Murmansk', 'pages/Transport/Transport')
        this.MenuItem('Contacts', 'Official contact information', 'pages/Contact/Contact')
      }
    }
    .scrollBar(BarState.Off)
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  @Builder
  AboutSection() {
    Column() {
      Image('https://tour.citymurmansk.ru/images/banners/banner_04.jpg')
        .width('100%')
        .height(160)
        .objectFit(ImageFit.Cover)

      Column() {
        Text('About Murmansk')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .width('100%')

        Row() {
          Text('Location: Beyond the Polar Circle')
            .fontSize(13)
            .fontColor('#666666')
        }
        .width('100%')
        .margin({ top: 8 })

        Row() {
          Text('Population: ~300,000')
            .fontSize(13)
            .fontColor('#666666')
        }
        .width('100%')
        .margin({ top: 4 })

        Row() {
          Text('Status: Hero City of Russia')
            .fontSize(13)
            .fontColor('#666666')
        }
        .width('100%')
        .margin({ top: 4 })

        Row() {
          Text('Port: Ice-free port on Kola Bay')
            .fontSize(13)
            .fontColor('#666666')
        }
        .width('100%')
        .margin({ top: 4 })
      }
      .width('100%')
      .padding(16)
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .backgroundColor(Color.White)
    .borderRadius(12)
    .margin({ top: 16, left: 16, right: 16 })
    .shadow({ radius: 4, color: '#1a000000', offsetX: 0, offsetY: 1 })
  }

  @Builder
  MenuItem(title: string, subtitle: string, targetUrl: string) {
    Row() {
      Column() {
        Text(title)
          .fontSize(16)
          .fontWeight(FontWeight.Medium)

        Text(subtitle)
          .fontSize(12)
          .fontColor('#666666')
          .margin({ top: 2 })
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      Text('>')
        .fontSize(18)
        .fontColor('#CCCCCC')
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .margin({ top: 8, left: 16, right: 16 })
    .shadow({ radius: 2, color: '#1a000000', offsetX: 0, offsetY: 1 })
    .onClick(() => {
      router.pushUrl({ url: targetUrl })
    })
  }
}
