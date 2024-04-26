import CommonConstants from './CommonConstants'
import ItemData from './ItemData'
import DataModel from "./DataModel"
import router from '@ohos.router';

@Entry
@Component
struct MySetting {

  @State
  //account:string = router.getParams()['account']
  account:string = '1450637062'

  @Builder
  settingCell(item:ItemData){
    Row(){
      Row({space:CommonConstants.COMMON_SPACE}){
        Image(item.img)
          .width($r('app.float.setting_size'))
          .height($r('app.float.setting_size'))
        Text(item.title)
          .fontSize($r('app.float.normal_text_size'))
      }

      if(item.others == null){
        Image($r('app.media.arrow'))
          .width($r('app.float.setting_jump_width'))
          .height($r('app.float.setting_jump_height'))
      }else {
        Toggle({type:ToggleType.Switch,isOn:false})
      }
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width(CommonConstants.FULL_PARENT)
    .padding({
      left:$r('app.float.setting_cell_left'),
      right:$r('app.float.setting_cell_right')
    })
  }

  // onPageShow(){
  //   let acc=router.getParams() as Record<string,number>
  //   if (acc){
  //     this.account=acc['sendMsg']
  //   }
  // }


  build(){
    Scroll(){
      Column({space:CommonConstants.COMMON_SPACE}){
        // Row() {
        //   Text($r('app.string.mainPage_tabTitles_mine'))
        //     .fontWeight(FontWeight.Medium)
        //     .fontSize($r('app.float.page_title_text_size'))
        //     .margin({ top: $r('app.float.mainPage_tabTitles_margin') })
        //     .padding({ left: '50px'})
        //
        // }
        // .height('150px')
        // .width(CommonConstants.FULL_PARENT)



        Row(){
          Image($r('app.media.sdm'))
            .width($r('app.float.setting_account_size'))
            .height($r('app.float.setting_account_size'))
            .margin($r('app.float.mainPage_tabTitles_margin'))
          Column(){
            Text($r('app.string.setting_account_name'))
              .fontSize($r('app.float.setting_account_fontSize'))
            Text("账号:"+this.account)
              .fontSize($r('app.float.small_text_size'))
              .margin({top:$r('app.float.setting_name_margin')})
          }
          .alignItems(HorizontalAlign.Start)
          .margin({left:$r('app.float.setting_account_margin')})
        }
        .alignItems(VerticalAlign.Center)
        .width(CommonConstants.FULL_PARENT)
        .height($r('app.float.setting_account_height'))
        .backgroundColor(Color.White)
        .borderRadius($r('app.float.setting_account_borderRadius'))
        
        
        List({space:10}){
          ForEach(DataModel.getSettingListData(),(item:ItemData)=>{
            ListItem(){
              this.settingCell(item)
            }
            .height($r('app.float.setting_list_height'))
            .backgroundColor(Color.White)
          })
        }
        .backgroundColor($r('app.color.setting_bg'))
        .width(CommonConstants.FULL_PARENT)
        //.height(CommonConstants.SET_LIST_WIDTH)
        // .divider({
        //   strokeWidth:$r('app.float.setting_divide_width'),
        //   color:Color.Grey,
        //   startMargin:$r('app.float.setting_divide_marginleft'),
        //   endMargin:$r('app.float.setting_divide_marginright')
        // })
        .borderRadius($r('app.float.setting_account_borderRadius'))
        .padding({top:$r('app.float.setting_list_padding'),bottom:$r('app.float.setting_list_padding')})

        Blank()




      }
      .height(CommonConstants.FULL_PARENT)

    }
    .backgroundColor($r('app.color.setting_bg'))

  }

}

export default MySetting