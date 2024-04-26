import webview from '@ohos.web.webview';

@Entry
@Component
struct YoLov6 {
  private controller:WebviewController=new webview.WebviewController();
  build(){
    Column(){
      Web({
        src:"https://blog.csdn.net/weixin_43702653/article/details/126949674",
        controller:this.controller
      })
    }
  }
}