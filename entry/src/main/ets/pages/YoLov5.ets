import webview from '@ohos.web.webview';


@Entry
@Component
struct YoLov5 {
  private controller:WebviewController=new webview.WebviewController();

  build() {
    Column(){
      Web({
        src:"https://blog.csdn.net/m0_57787115/article/details/130670624",
        controller:this.controller
      })
    }
  }
}