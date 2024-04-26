import CommonConstants from './CommonConstants'

@Entry
@Component
struct Home {
  @State videoSrc: Resource = $rawfile('mv1.mp4')
  @State previewUri: Resource = $r('app.media.video_bg')
  @State curRate: PlaybackSpeed = PlaybackSpeed.Speed_Forward_1_00_X
  @State isAutoPlay: boolean = false
  @State showControls: boolean = true
  @State isFullScreen:boolean = false
  controller: VideoController = new VideoController()

  @State button_bg1 : Resource = $r('app.color.button_color')
  @State button_bg2 : Resource = $r('app.color.button_color')
  @State button_bg3 : Resource = $r('app.color.button_color')
  @State button_bg4 : Resource = $r('app.color.button_color')
  @State video_width:string='100%'
  @State video_height:number=250
  build() {
    Column() {
      Row(){
        Text("主页")
          .fontSize("70px")
      }
      .justifyContent(FlexAlign.Center)
      .backgroundColor($r('app.color.setting_bg'))
      .height("200px")
      .width(CommonConstants.FULL_PARENT)
      Row(){
      }
      .width(CommonConstants.FULL_PARENT)
      .height("100px")
      .backgroundColor(Color.White)
      Video({
        src: this.videoSrc,
        previewUri: this.previewUri,
        currentProgressRate: this.curRate,
        controller: this.controller
      })
        .width(this.video_width).height(this.video_height)
        .autoPlay(this.isAutoPlay)
        .controls(this.showControls)


      Column(){
        Row(){
          Column(){
            Image($r('app.media.screenshot'))
              .height(40)
              .width(40)
              .onClick(()=>{

              })
            Text('截屏').fontSize($r('app.float.small_text_size'))
          }
          .height(70)
          .width(70)
          .borderRadius(35)
          .backgroundColor(this.button_bg1)
          .justifyContent(FlexAlign.Center)
          .onTouch((e)=>{
            if(e.type == TouchType.Down){
              this.button_bg1=$r('app.color.button_down_color')
            }
            if(e.type == TouchType.Up){
              this.button_bg1=$r('app.color.button_color')
            }
          })
          Column(){
            Image($r('app.media.microphone'))
              .height(40)
              .width(40)
            Text('对讲').fontSize($r('app.float.small_text_size'))
          }
          .height(70)
          .width(70)
          .borderRadius(35)
          .backgroundColor(this.button_bg2)
          .justifyContent(FlexAlign.Center)
          .onTouch((e)=>{
            if(e.type == TouchType.Down){
              this.button_bg2=$r('app.color.button_down_color')
            }
            if(e.type == TouchType.Up){
              this.button_bg2=$r('app.color.button_color')
            }
          })
          Column(){
            Image($r('app.media.camera'))
              .height(40)
              .width(40)
            Text('录像').fontSize($r('app.float.small_text_size'))
          }
          .height(70)
          .width(70)
          .borderRadius(35)
          .backgroundColor(this.button_bg3)
          .justifyContent(FlexAlign.Center)
          .onTouch((e)=>{
            if(e.type == TouchType.Down){
              this.button_bg3=$r('app.color.button_down_color')
            }
            if(e.type == TouchType.Up){
              this.button_bg3=$r('app.color.button_color')
            }
          })
          Column(){
            Image($r('app.media.remote'))
              .height(40)
              .width(40)
            Text('遥控').fontSize($r('app.float.small_text_size'))
          }
          .height(70)
          .width(70)
          .borderRadius(35)
          .backgroundColor(this.button_bg4)
          .justifyContent(FlexAlign.Center)
          .onTouch((e)=>{
            if(e.type == TouchType.Down){
              this.button_bg4=$r('app.color.button_down_color')
            }
            if(e.type == TouchType.Up){
              this.button_bg4=$r('app.color.button_color')
            }
          })
        }
        .width('90%')
        .height(150)
        .margin({
          top:20
        })
        .backgroundColor(Color.White)
        .borderRadius(20)
        .justifyContent(FlexAlign.SpaceAround)
      }
      .width(CommonConstants.FULL_PARENT)
      .height(510)

      .backgroundColor($r('app.color.setting_bg'))
      //
      // Row() {
      //   Button('src').onClick(() => {
      //     this.videoSrc = $rawfile('video2.mp4') // 切换视频源
      //   }).margin(5)
      //   Button('previewUri').onClick(() => {
      //     this.previewUri = $r('app.media.ShenZi06') // 切换视频预览海报
      //   }).margin(5)
      //   Button('controls').onClick(() => {
      //     this.showControls = !this.showControls // 切换是否显示视频控制栏
      //   }).margin(5)
      // }
      //
      // Row() {
      //   Button('start').onClick(() => {
      //     this.controller.start() // 开始播放
      //   }).margin(5)
      //   Button('pause').onClick(() => {
      //     this.controller.pause() // 暂停播放
      //   }).margin(5)
      //   Button('stop').onClick(() => {
      //     this.controller.stop() // 结束播放
      //   }).margin(5)
      //   Button('setTime').onClick(() => {
      //     this.controller.setCurrentTime(10, SeekMode.Accurate) // 精准跳转到视频的10s位置
      //   }).margin(5)
      // }
      //
      // Row() {
      //   Button('rate 0.75').onClick(() => {
      //     this.curRate = PlaybackSpeed.Speed_Forward_0_75_X // 0.75倍速播放
      //   }).margin(5)
      //   Button('rate 1').onClick(() => {
      //     this.curRate = PlaybackSpeed.Speed_Forward_1_00_X // 原倍速播放
      //   }).margin(5)
      //   Button('rate 2').onClick(() => {
      //     this.curRate = PlaybackSpeed.Speed_Forward_2_00_X // 2倍速播放
      //   }).margin(5)
      // }
    }

  }
}
export default Home;