import CommonConstants from './CommonConstants'
import prompt  from '@ohos.promptAction'
import router from '@ohos.router';
import wantConstant from '@ohos.ability.wantConstant';
import common from '@ohos.app.ability.common';
import picker from '@ohos.file.picker';


@Extend(TextInput)
function inputStyle(){
  .placeholderColor($r('app.color.placeholder_color'))
  .placeholderFont({size:24,weight:400})
  .height($r('app.float.login_input_height'))
  .fontSize($r('app.float.normal_text_size'))
  .backgroundColor($r('app.color.background'))
  .width(CommonConstants.FULL_PARENT)
  .padding({left:CommonConstants.INPUT_PADDING_LEFT})
  .margin({top:$r('app.float.input_margin_top')})
}

@Extend(Line)
function lineStyle(){
  .width(CommonConstants.FULL_PARENT)
  .height($r('app.float.line_height'))
  .backgroundColor($r('app.color.line_color'))
}

@Extend(Text)
function blueTextStyle(){
  .fontColor($r('app.color.login_blue_text_color'))
  .fontSize($r('app.float.small_text_size'))
  .fontWeight(FontWeight.Medium)
}


@Entry
@Component
struct Login {
  @Builder
  imageButton(image:Resource){
    Button({type:ButtonType.Circle,stateEffect:true}){
      Image(image)    //stateEffect:true  按钮按下去会有一个切换效果
    }
    .height($r('app.float.other_login_image_size'))
    .width($r('app.float.other_login_image_size'))
    .backgroundColor($r('app.color.background'))
  }

  private timeoutId:number=-1

  private context=getContext(this) as common.UIAbilityContext
  private uri:Resource;

  login():void{
    if(this.account === '' || this.password === ''){
      // prompt.showDialog()  //模态框
      prompt.showToast({    //非模态
        message:$r('app.string.input_empty_tips')
      })
    }else {
      this.isShowProgress=true
      if(this.timeoutId === -1){
        this.timeoutId=setTimeout(()=>{
          this.isShowProgress=false
          this.timeoutId=-1
          router.push({
            url:'pages/NavPage',
            params:{account:this.account}
          })
        },CommonConstants.LOGIN_DELAY_TIME)
      }
    }
  }

  aboutToDisappear(){
    clearTimeout(this.timeoutId)
    this.timeoutId=-1
  }
  @State
  account:string=''

  @State
  password:string=''

  @State
  isShowProgress:boolean=false
  //$r('app.media.ShenZi07')


  build() {
    Column(){
      Image(this.uri).width($r('app.float.logo_image_width'))
        .height($r('app.float.logo_image_height'))
        .margin({
          top:$r('app.float.logo_margin_top'),
          bottom:$r('app.float.logo_margin_bottom')
        })

      //登录标题
      Text($r('app.string.login_page'))
        .fontSize($r('app.float.big_text_size'))
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.title_text_color'))

      //登录了解更多的text
      Text($r('app.string.login_more'))
        .fontSize($r('app.float.normal_text_size'))
        .fontColor($r('app.color.login_more_text_color'))
        .margin({bottom:$r('app.float.login_more_margin_bottom'),top:$r('app.float.login_more_margin_top')})

      TextInput({placeholder:$r('app.string.account')}).inputStyle()
        .maxLength(CommonConstants.INPUT_ACCOUNT_LENGTH)
        .type(InputType.Number)
        .onChange((value:string)=>{
          this.account=value
        })

      Line().lineStyle()

      TextInput({placeholder:$r('app.string.password')}).inputStyle()
        .maxLength(CommonConstants.INPUT_PASSWORD_LENGTH)
        .type(InputType.Password)
        .onChange((value:string)=>{
          this.password=value
        })

      Line().lineStyle()

      Row(){
        Text($r('app.string.message_login')).blueTextStyle()
        Text($r('app.string.forgot_password')).blueTextStyle()
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width(CommonConstants.FULL_PARENT)
      .margin({top:$r('app.float.forgot_margin_top')})


      //登录按钮
      Button($r('app.string.login'),{type:ButtonType.Capsule})
        .width(CommonConstants.BUTTON_WIDTH)
        .height($r('app.float.login_button_height'))
        .fontSize($r('app.float.normal_text_size'))
        .fontWeight(FontWeight.Medium)
        .backgroundColor($r('app.color.login_button_color'))
        .margin({
          top:$r('app.float.login_button_margin_top'),
          bottom:$r('app.float.login_button_margin_bottom')
        })
        .onClick(()=>{
          let wantObj={
            deviceId:"",
            action:wantConstant.Action.ACTION_IMAGE_CAPTURE
          }
          this.context.startAbilityForResult(wantObj).then((data)=>{

          })




          // let photoSelectOptions = new picker.PhotoSelectOptions()
          // photoSelectOptions.MIMEType=picker.PhotoViewMIMETypes.IMAGE_TYPE
          // photoSelectOptions.maxSelectNumber=1
          //
          // let photoPicker = new picker.PhotoViewPicker()
          // let res = await photoPicker.select(photoSelectOptions)
          // this.uri=res.photoUris[0]

        }
          //this.login()
        )
      Text($r('app.string.register_account'))
        .fontColor($r('app.color.login_blue_text_color'))
        .fontSize($r('app.float.normal_text_size'))
        .fontWeight(FontWeight.Medium)

      if(this.isShowProgress){
        LoadingProgress()
          .color($r('app.color.loading_color'))
          .width($r('app.float.login_progress_size'))
          .height($r('app.float.login_progress_size'))
          .margin({top:$r('app.float.login_progress_margin_top')})
      }

      Blank()

      Text($r('app.string.other_login_method'))
        .fontColor($r('app.color.other_login_text_color'))
        .fontSize($r('app.float.small_text_size'))
        .fontWeight(FontWeight.Medium)
        .margin({top:$r('app.float.other_login_margin_top'),
          bottom:$r('app.float.other_login_margin_bottom')})

      Row({
        space:CommonConstants.LOGIN_METHODS_SPACE
      }){
        this.imageButton($r('app.media.QQ'))
        this.imageButton($r('app.media.WeiXin'))
        this.imageButton($r('app.media.UC'))
      }
    }
    .backgroundColor($r('app.color.background'))
    .height(CommonConstants.FULL_PARENT)
    .width(CommonConstants.FULL_PARENT)
    .padding({
      left:$r('app.float.page_padding_hor'),
      right:$r('app.float.page_padding_hor'),
      bottom:$r('app.float.login_page_padding_bottom')
    })
  }
}