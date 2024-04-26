import MySetting from './MySetting'
import Home from './Home'
import SearchPage from './SearchPage'
import Record from './Record'

@Entry
@Component
struct NavPage{

  public tabsController : TabsController = new TabsController()
  @State currentIndex:number = 0

  build() {
    Tabs({barPosition:BarPosition.End,controller:this.tabsController}) {
      TabContent() {
        Home()
      }
      .tabBar(this.TabBuilder("首页",0,$r('app.media.home_plus'),$r('app.media.home')))
      TabContent() {
        Record()
      }
      .tabBar(this.TabBuilder("消息",1,$r('app.media.message_plus'),$r('app.media.message')))
      TabContent() {
        SearchPage()
      }
      .tabBar(this.TabBuilder("发现",2,$r('app.media.search_plus'),$r('app.media.search')))
      TabContent() {
        MySetting()
      }
      .tabBar(this.TabBuilder("我的",3,$r('app.media.mine_plus'),$r('app.media.mine')))
    }.barHeight(100)
    .onChange((index:number) => {
      this.currentIndex = index
    })
  }

  @Builder TabBuilder(title: string, targetIndex: number,selectedImg: Resource,normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 30, height: 30 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#5DA0FF' : '#999999')
    }
    .onClick(() => {
      this.currentIndex = targetIndex;
      this.tabsController.changeIndex(this.currentIndex);
    })
    .justifyContent(FlexAlign.Center)
  }
}
