import { Infrastructure, InfrastructureType, museumsData, theatresData } from '../../models/DataModels'
import router from '@ohos.router'

@Entry
@Component
struct InfrastructureList {
  @State currentType: InfrastructureType = 'museum'
  @State museums: Infrastructure[] = museumsData
  @State theatres: Infrastructure[] = theatresData

  build() {
    Column() {
      this.Header()
      this.TypeSelector()
      this.ContentList()
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

      Text('Infrastructure')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .layoutWeight(1)
        .margin({ left: 12 })
    }
    .width('100%')
    .height(56)
    .padding({ left: 16, right: 16 })
    .backgroundColor('#007DFF')
  }

  @Builder
  TypeSelector() {
    Row() {
      this.TypeButton('Museums', 'museum')
      Blank().width(12)
      this.TypeButton('Theatres', 'theatre')
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  TypeButton(label: string, type: InfrastructureType) {
    Text(label)
      .fontSize(14)
      .fontWeight(this.currentType === type ? FontWeight.Bold : FontWeight.Normal)
      .fontColor(this.currentType === type ? '#007DFF' : '#666666')
      .padding({ left: 24, right: 24, top: 10, bottom: 10 })
      .backgroundColor(this.currentType === type ? '#E6F2FF' : '#F5F5F5')
      .borderRadius(20)
      .onClick(() => {
        this.currentType = type
      })
  }

  @Builder
  ContentList() {
    List({ space: 12 }) {
      if (this.currentType === 'museum') {
        ForEach(this.museums, (item: Infrastructure) => {
          ListItem() {
            this.InfrastructureCard(item)
          }
        }, (item: Infrastructure) => item.id)
      } else {
        ForEach(this.theatres, (item: Infrastructure) => {
          ListItem() {
            this.InfrastructureCard(item)
          }
        }, (item: Infrastructure) => item.id)
      }
    }
    .width('100%')
    .layoutWeight(1)
    .padding({ left: 16, right: 16, bottom: 16 })
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
            Text('📞')
              .fontSize(12)
            Text(item.phone)
              .fontSize(12)
              .fontColor('#666666')
              .margin({ left: 6 })
          }
          .width('100%')
          .margin({ top: 4 })
        }

        if (item.website) {
          Text(item.website)
            .fontSize(11)
            .fontColor('#007DFF')
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .margin({ top: 4 })
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
