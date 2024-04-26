import webview from '@ohos.web.webview';


@Entry
@Component
struct YoLov8 {
  private controller:WebviewController=new webview.WebviewController();

  build() {
    Column(){
      Web({
        src:"https://blog.csdn.net/matt45m/article/details/134396179",
        controller:this.controller
      })
    }
  }
}