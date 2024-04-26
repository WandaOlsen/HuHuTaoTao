import ItemData from './ItemData'

export class DataModel{

  getSettingListData():Array<ItemData>{
    let settingListData:ItemData[] = [
      new ItemData($r('app.string.notifications'),$r('app.media.news'),$r('app.float.small_text_size')),
      new ItemData($r('app.string.manage'),$r('app.media.data')),
      new ItemData($r('app.string.menu'),$r('app.media.menu')),
      new ItemData($r('app.string.about'),$r('app.media.about')),
      new ItemData($r('app.string.clear'),$r('app.media.storage')),
      new ItemData($r('app.string.privacy'),$r('app.media.privacy')),
      new ItemData($r('app.string.exit_login'),$r('app.media.exit'))
    ];
    return settingListData;
  }


}

export default new DataModel()