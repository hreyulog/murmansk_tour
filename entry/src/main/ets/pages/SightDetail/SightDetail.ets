import { Sight, sightsData } from '../../models/DataModels'
import router from '@ohos.router'
import common from '@ohos.app.ability.common'
import Want from '@ohos.app.ability.Want'

interface SightDetailParams {
  sightId: string
}

@Entry
@Component
struct SightDetail {
  @State sight: Sight | null = null
  @State isLoading: boolean = true
  context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext

  openLink(url: string) {
    const want: Want = {
      action: 'ohos.want.action.viewData',
      entities: ['entity.system.browsable'],
      uri: url
    }
    this.context.startAbility(want)
  }

  aboutToAppear() {
    const params = router.getParams() as SightDetailParams
    if (params && params.sightId) {
      this.sight = sightsData.find(s => s.id === params.sightId) || null
    }
    this.isLoading = false
  }

  build() {
    if (this.isLoading || !this.sight) {
      Column() {
        LoadingProgress()
          .width(50)
          .height(50)
          .color('#007DFF')
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    } else {
      Column() {
        this.Header()
        this.Content()
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#F5F5F5')
    }
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
      .backgroundColor('#80000000')
      .onClick(() => {
        router.back()
      })

      Text('Sight Details')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.White)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)

      Blank()
        .width(36)
    }
    .width('100%')
    .height(56)
    .padding({ left: 16, right: 16 })
    .position({ x: 0, y: 0 })
    .zIndex(10)
  }

  @Builder
  Content() {
    Scroll() {
      Column() {
        Image(this.sight!.image)
          .width('100%')
          .height(250)
          .objectFit(ImageFit.Cover)

        Column() {
          Text(this.sight!.name)
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .width('100%')

          Row() {
            Image($r('app.media.icon'))
              .width(16)
              .height(16)

            Text(this.sight!.location)
              .fontSize(14)
              .fontColor('#666666')
              .margin({ left: 8 })
          }
          .width('100%')
          .margin({ top: 12 })

          Divider()
            .margin({ top: 16, bottom: 16 })

          Text('Description')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .width('100%')

          Text(this.sight!.description)
            .fontSize(14)
            .fontColor('#333333')
            .lineHeight(22)
            .margin({ top: 12 })
            .width('100%')

          if (this.sight!.fullDescription) {
            Text('More Information')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
              .width('100%')
              .margin({ top: 16 })

            Text(this.sight!.fullDescription!)
              .fontSize(14)
              .fontColor('#333333')
              .lineHeight(22)
              .margin({ top: 12 })
              .width('100%')
          }

          if (this.sight!.mapLink) {
            Row() {
              Text('View on Map')
                .fontSize(14)
                .fontColor(Color.White)
                .padding({ left: 20, right: 20, top: 10, bottom: 10 })
                .backgroundColor('#007DFF')
                .borderRadius(20)
            }
            .width('100%')
            .justifyContent(FlexAlign.Center)
            .margin({ top: 20 })
            .onClick(() => {
              this.openLink(this.sight!.mapLink!)
            })
          }
        }
        .width('100%')
        .padding(16)
        .backgroundColor(Color.White)
        .borderRadius({ topLeft: 20, topRight: 20 })
        .margin({ top: -20 })
      }
    }
    .scrollBar(BarState.Off)
    .width('100%')
    .layoutWeight(1)
  }
}
