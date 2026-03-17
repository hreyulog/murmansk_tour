import { Infrastructure, cultureHousesData } from '../../models/DataModels'
import router from '@ohos.router'
import common from '@ohos.app.ability.common'
import Want from '@ohos.app.ability.Want'

@Entry
@Component
struct CultureHousesPage {
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
      List({ space: 12 }) {
        ForEach(cultureHousesData, (item: Infrastructure) => {
          ListItem() {
            this.InfrastructureCard(item)
          }
        }, (item: Infrastructure) => item.id)
      }
      .width('100%')
      .layoutWeight(1)
      .padding({ left: 16, right: 16, bottom: 16 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  @Builder
  Header() {
    Row() {
      Button({ type: ButtonType.Circle }) {
        Text('←')
          .fontSize(20)
          .fontColor(Color.White)
      }
      .width(36)
      .height(36)
      .backgroundColor('#007DFF')
      .onClick(() => {
        router.back()
      })

      Text('Houses of Culture')
        .fontSize(20)
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
  InfrastructureCard(item: Infrastructure) {
    Column() {
      if (item.image) {
        Image(item.image)
          .width('100%')
          .height(140)
          .objectFit(ImageFit.Cover)
          .borderRadius({ topLeft: 12, topRight: 12 })
      }

      Column() {
        Text(item.name)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .width('100%')

        Row() {
          Image($r('app.media.icon'))
            .width(14)
            .height(14)
          Text(item.address)
            .fontSize(12)
            .fontColor('#666666')
            .margin({ left: 6 })
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }
        .width('100%')
        .margin({ top: 8 })

        if (item.phone) {
          Row() {
            Text('Tel: ')
              .fontSize(12)
              .fontColor('#666666')
            Text(item.phone)
              .fontSize(12)
              .fontColor('#007DFF')
          }
          .width('100%')
          .margin({ top: 4 })
        }

        if (item.website) {
          Row() {
            Text('Website: ')
              .fontSize(12)
              .fontColor('#666666')
            Text(item.website)
              .fontSize(12)
              .fontColor('#007DFF')
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .layoutWeight(1)
          }
          .width('100%')
          .margin({ top: 4 })
          .onClick(() => {
            this.openLink(item.website!)
          })
        }

        if (item.mapLink) {
          Row() {
            Text('View on Map')
              .fontSize(12)
              .fontColor('#007DFF')
          }
          .width('100%')
          .margin({ top: 8 })
          .onClick(() => {
            this.openLink(item.mapLink!)
          })
        }
      }
      .width('100%')
      .padding(12)
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1a000000', offsetX: 0, offsetY: 1 })
  }
}
