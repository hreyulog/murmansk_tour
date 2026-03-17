import { contactsData, Contact } from '../../models/DataModels'
import router from '@ohos.router'
import common from '@ohos.app.ability.common'
import Want from '@ohos.app.ability.Want'

@Entry
@Component
struct ContactPage {
  @State contacts: Contact[] = contactsData
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
          ForEach(this.contacts, (contact: Contact) => {
            this.ContactCard(contact)
          }, (contact: Contact) => contact.organization)
        }
        .padding(16)
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

      Text('Contacts')
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
  ContactCard(contact: Contact) {
    Column() {
      Text(contact.organization)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .width('100%')

      Divider()
        .margin({ top: 12, bottom: 12 })

      Row() {
        Text('Address: ' + contact.address)
          .fontSize(14)
          .fontColor('#333333')
          .layoutWeight(1)
      }
      .width('100%')
      .alignItems(VerticalAlign.Top)

      Row() {
        Text('Tel: ' + contact.phone)
          .fontSize(14)
          .fontColor('#007DFF')
      }
      .width('100%')
      .margin({ top: 8 })

      if (contact.email) {
        Row() {
          Text('Email: ' + contact.email)
            .fontSize(14)
            .fontColor('#007DFF')
        }
        .width('100%')
        .margin({ top: 8 })
      }

      if (contact.website) {
        Row() {
          Text('Web: ')
            .fontSize(14)
            .fontColor('#666666')
          Text(contact.website)
            .fontSize(14)
            .fontColor('#007DFF')
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .layoutWeight(1)
        }
        .width('100%')
        .margin({ top: 8 })
        .onClick(() => {
          this.openLink(contact.website!)
        })
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .margin({ bottom: 12 })
    .shadow({ radius: 4, color: '#1a000000', offsetX: 0, offsetY: 1 })
    .alignItems(HorizontalAlign.Start)
  }
}
