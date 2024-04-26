import webview from '@ohos.web.webview';

@Entry
@Component
struct YoLov7 {
  private controller:WebviewController=new webview.WebviewController();
  build(){
    Column(){
      Web({
        src:"https://blog.csdn.net/qq_51511878/article/details/131991365",
        controller:this.controller
      })
    }
  }
}