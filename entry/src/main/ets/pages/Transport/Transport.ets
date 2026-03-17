import { transportInfo } from '../../models/DataModels'
import router from '@ohos.router'
import common from '@ohos.app.ability.common'
import Want from '@ohos.app.ability.Want'

interface HighwayItem {
  name: string
  description: string
}

interface CrossingItem {
  name: string
  description: string
}

@Entry
@Component
struct Transport {
  @State highways: HighwayItem[] = transportInfo.highways
  @State crossings: CrossingItem[] = transportInfo.borderCrossings
  context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext

  openLink(url: string) {
    const want: Want = {
      action: 'ohos.want.action.viewData',
      entities: ['entity.system.browsable'],
      uri: url
    }
    this.context.startAbility(want)
  }

  build() {
    Column() {
      this.Header()
      Scroll() {
        Column() {
          this.AirportSection()
          this.RailwaySection()
          this.HighwaySection()
          this.BorderSection()
        }
      }
      .scrollBar(BarState.Off)
      .width('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  @Builder
  Header() {
    Row() {
      Button({ type: ButtonType.Circle }) {
        Text('<')
          .fontSize(20)
          .fontColor(Color.White)
      }
      .width(36)
      .height(36)
      .backgroundColor('#007DFF')
      .onClick(() => {
        router.back()
      })

      Text('How to Arrive in Murmansk')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.White)
        .layoutWeight(1)
        .margin({ left: 12 })
    }
    .width('100%')
    .height(56)
    .padding({ left: 16, right: 16 })
    .backgroundColor('#007DFF')
  }

  @Builder
  AirportSection() {
    Column() {
      Text('Air Transport')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .width('100%')

      this.InfoCard(transportInfo.airport.name, transportInfo.airport.address, transportInfo.airport.phone, transportInfo.airport.website)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .margin({ top: 16, left: 16, right: 16 })
  }

  @Builder
  RailwaySection() {
    Column() {
      Text('Railway')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .width('100%')

      this.InfoCard(transportInfo.railway.name, transportInfo.railway.address, undefined, transportInfo.railway.website)

      Text('Direct railway link from Murmansk to St. Petersburg, Vologda, Moscow, Minsk, and many other cities.')
        .fontSize(13)
        .fontColor('#666666')
        .margin({ top: 12 })
        .width('100%')
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .margin({ top: 12, left: 16, right: 16 })
  }

  @Builder
  HighwaySection() {
    Column() {
      Text('Road Transport')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .width('100%')

      ForEach(this.highways, (highway: HighwayItem) => {
        Row() {
          Text('*')
            .fontSize(14)
            .fontColor('#007DFF')
          Column() {
            Text(highway.name)
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
            Text(highway.description)
              .fontSize(12)
              .fontColor('#666666')
          }
          .alignItems(HorizontalAlign.Start)
          .margin({ left: 8 })
        }
        .width('100%')
        .margin({ top: 8 })
      }, (highway: HighwayItem) => highway.name)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .margin({ top: 12, left: 16, right: 16 })
  }

  @Builder
  BorderSection() {
    Column() {
      Text('Border Crossings')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .width('100%')

      ForEach(this.crossings, (crossing: CrossingItem) => {
        Row() {
          Text('*')
            .fontSize(14)
            .fontColor('#007DFF')
          Column() {
            Text(crossing.name)
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
            Text(crossing.description)
              .fontSize(12)
              .fontColor('#666666')
          }
          .alignItems(HorizontalAlign.Start)
          .margin({ left: 8 })
        }
        .width('100%')
        .margin({ top: 8 })
      }, (crossing: CrossingItem) => crossing.name)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .margin({ top: 12, left: 16, right: 16, bottom: 16 })
  }

  @Builder
  InfoCard(name: string, address: string, phone?: string, website?: string) {
    Column() {
      Text(name)
        .fontSize(15)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text(address)
        .fontSize(13)
        .fontColor('#666666')
        .margin({ top: 4 })
        .width('100%')

      if (phone) {
        Text('Tel: ' + phone)
          .fontSize(13)
          .fontColor('#007DFF')
          .margin({ top: 4 })
      }

      if (website) {
        Text('Website: ' + website)
          .fontSize(13)
          .fontColor('#007DFF')
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .margin({ top: 4 })
          .onClick(() => {
            this.openLink(website)
          })
      }
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding({ top: 12 })
  }
}
