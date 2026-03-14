import { AnnualEvent, annualEventsData } from '../../models/DataModels'
import router from '@ohos.router'

interface EventDetailParams {
  eventId: string
}

@Entry
@Component
struct EventDetail {
  @State event: AnnualEvent | null = null
  @State isLoading: boolean = true

  aboutToAppear() {
    const params = router.getParams() as EventDetailParams
    if (params && params.eventId) {
      this.event = annualEventsData.find(e => e.id === params.eventId) || null
    }
    this.isLoading = false
  }

  build() {
    if (this.isLoading || !this.event) {
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

      Text('Event Details')
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
        Image(this.event!.image)
          .width('100%')
          .height(220)
          .objectFit(ImageFit.Cover)

        Column() {
          Text(this.event!.name)
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .width('100%')

          if (this.event!.date) {
            Row() {
              Image($r('app.media.icon'))
                .width(16)
                .height(16)
              Text(this.event!.date)
                .fontSize(14)
                .fontColor('#007DFF')
                .margin({ left: 8 })
            }
            .width('100%')
            .margin({ top: 12 })
          }

          Divider()
            .margin({ top: 16, bottom: 16 })

          Text('About This Event')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .width('100%')

          Text(this.event!.description)
            .fontSize(14)
            .fontColor('#333333')
            .lineHeight(22)
            .margin({ top: 12 })
            .width('100%')

          Row() {
            Image($r('app.media.icon'))
              .width(20)
              .height(20)

            Text('Traditional Annual Event')
              .fontSize(14)
              .fontColor('#007DFF')
              .margin({ left: 8 })
          }
          .width('100%')
          .margin({ top: 24 })
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
