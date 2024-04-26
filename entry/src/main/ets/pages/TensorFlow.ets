import webview from '@ohos.web.webview';

@Entry
@Component
struct TensorFlow {
  private controller:WebviewController=new webview.WebviewController();
  build(){
    Column(){
      Web({
        src:"https://tensorflow.google.cn/?hl=zh-cn",
        controller:this.controller
      })
    }
  }
}