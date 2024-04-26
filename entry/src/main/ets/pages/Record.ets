import CommonConstants from './CommonConstants'
import common from '@ohos.app.ability.common'
import wantConstant from '@ohos.ability.wantConstant'

@Entry
@Component
struct Record {

  //private context=getContext(this) as common.UIAbilityContext
  //private uri:string=""

  build() {
    Column(){
      Row(){
        Text("记录")
          .fontSize("70px")
      }
      .justifyContent(FlexAlign.Center)
      .backgroundColor($r('app.color.setting_bg'))
      .height("200px")
      .width(CommonConstants.FULL_PARENT)





    }
    .height(CommonConstants.FULL_PARENT)
    .width(CommonConstants.FULL_PARENT)
    .justifyContent(FlexAlign.Start)
  }
}

export default Record;