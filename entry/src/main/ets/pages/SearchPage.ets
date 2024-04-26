import webview from '@ohos.web.webview';
import CommonConstants from './CommonConstants'
import router from '@ohos.router';

@Entry
@Component
struct SearchPage {

  public controller:WebviewController=new webview.WebviewController();
  @State address:string="发现探索"


  onPageShow(){

  }


  // login(res:string):void{
  //   router.push({
  //     url:'pages'+'/'+res
  //   })
  // }
  Button
  build() {
    Column(){
      Row(){
        Text(this.address)
          .fontSize("70px")
        Image($r('app.media.refresh'))
          .width("90px")
          .height("90px")
          .margin({left:5})
          .onClick(()=>{
            this.controller.registerJavaScriptProxy({
              a:(res:string)=>{
                router.push({
                  url:"pages/"+res
                })
              }
            },"windowArkTS",["a"])
            this.controller.refresh()
          })
      }
      .justifyContent(FlexAlign.Center)
      .backgroundColor($r('app.color.setting_bg'))
      .height("200px")
      .width(CommonConstants.FULL_PARENT)

      Web({
        src:$rawfile("mine.html"),
        controller:this.controller
      })
        .height(CommonConstants.FULL_PARENT)
        .width(CommonConstants.FULL_PARENT)
        .onClick(()=>{

        })
    }
    .width(CommonConstants.FULL_PARENT)
    .height(CommonConstants.FULL_PARENT)
  }
}

export default SearchPage;
