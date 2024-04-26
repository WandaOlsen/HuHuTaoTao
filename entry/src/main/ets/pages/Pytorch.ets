import webview from '@ohos.web.webview';

@Entry
@Component
struct Pytorch {
  private controller:WebviewController=new webview.WebviewController();
  build(){
    Column(){
      Web({
        src:"https://blog.csdn.net/weixin_43334693/article/details/128836143",
        controller:this.controller
      })
    }
  }
}