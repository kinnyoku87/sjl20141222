package views
{
	import com.greensock.TweenMax;
	import configs.ConfigNet;
	import configs.ConfigRes;
	import configs.skinname.SkinNameConfig;
	import flash.utils.setTimeout;
	import models.GameModel;
	import org.agony2d.Agony;
	import org.agony2d.flashApi.skins.Scale9MultiBitmapsSkinUU;
	import org.agony2d.project.StateVV;
	import org.agony2d.sounds.MusicManager;
	
	import net.NetManager;
	
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.flashApi.skins.ButtonSkinType;
	import org.agony2d.flashApi.skins.ButtonSkinUU;
	import org.agony2d.resources.TResourceManager;
	
	import proto.cs.CmdCodeSign;
	import proto.cs.CmdType;
	import proto.cs.SignReq;
	
	import configs.battle.BattleConfigurator;
	
	import org.agony2d.collections.CsvUtil;
	import org.agony2d.events.AEvent;
	import org.agony2d.flashApi.UUFacade;
	import org.agony2d.resources.TResourceManager;
	import views.UU.loading.Loading_StateUU;
	
	
	// bg
	// ui_A
	// active
	// ui_B
	
	public class Battle_StateVV extends StateVV
	{
		
		private static var _isAssetsLoaded:Boolean;
		
		override public function onEnter():void{
			var data:Vector.<Array>;
			
			if (_isAssetsLoaded) {
				UUFacade.getWindow(Loading_StateUU).activate([true, requestBattle]);
				return;
			}
			
			UUFacade.getWindow(Loading_StateUU).activate([false, requestBattle]);
			TResourceManager.addEventListener(AEvent.COMPLETE, onAssetLoaded);
			
			var i:int;
			var l:int;
			
			// Ui
			TResourceManager.loadAssets("battle.zip");
			TResourceManager.loadAssets2("temp/bg/battleBg.png");
			TResourceManager.loadAssets("gameover.zip");
			
			// 動畫data.
			TResourceManager.loadAssets2("data/7-7_grid.csv").addEventListener(AEvent.COMPLETE, function(e:AEvent):void{
				data = CsvUtil.parse(TResourceManager.getAsset("data/7-7_grid.csv").data);
				BattleConfigurator.initGrids(data);
			})
			
			// 動畫atlas.
			TResourceManager.loadAssets2(
										"atlas/scene/fire2.atlas", 
										//"atlas/scene/debut.atlas", 
										"atlas/scene/debut3.atlas", 
										"atlas/scene/death2.atlas", 
										"atlas/scene/sleep.atlas", 
										"atlas/scene/hit.atlas", 
										"atlas/scene/shoot.atlas", 
										
										"atlas/characters/optional.atlas", 
										
										"atlas/skill/baguaxianyi.atlas", // 八卦仙衣
										"atlas/skill/dingfengzhu2.atlas",  // 定风珠
										"atlas/skill/dinghaizhu.atlas",  // 定海珠
										"atlas/skill/dingshen.atlas",  // 定身
										"atlas/skill/fazhoujinsan.atlas", // 法咒尽散
										"atlas/skill/feihuangshi.atlas", // 飞蝗石
										"atlas/skill/feixing.atlas",  // 飞行
										"atlas/skill/humingduohun.atlas",  // 呼名夺魂
										"atlas/skill/hunyuanbaozhu.atlas",  // 混元宝珠
										"atlas/skill/huolongdubiao.atlas",  // 火龙毒镖
										"atlas/skill/jufengfan.atlas",  // 聚风帆
										"atlas/skill/junwei.atlas",  // 君威
										"atlas/skill/pidizhu_A.atlas",  // 辟地珠A
										"atlas/skill/pidizhu_B.atlas",  // 辟地珠B
										"atlas/skill/qianxing2.atlas",  // 潜行
										"atlas/skill/qiankunquan.atlas",  // 乾坤圈
										"atlas/skill/qibaolinglongta.atlas",  // 七宝玲珑塔
										"atlas/skill/sanqianhuolongjun_A.atlas",  // 三千火龙军A
										"atlas/skill/sanqianhuolongjun_B.atlas",  // 三千火龙军B
										"atlas/skill/sheji.atlas",  // 射击
										"atlas/skill/shenyanzhiguang.atlas",  // 神眼之光
										"atlas/skill/taiyangjinzhen.atlas", // 太阳金针
										"atlas/skill/tianyuan.atlas", // 天元
										"atlas/skill/wugoushuangjian.atlas", // 吴钩双剑
										"atlas/skill/yishoulongwei.atlas", // 异兽龙威
										"atlas/skill/yuanhu.atlas",  // 援护
										//"atlas/skill/xinghuangqi.atlas",  // 杏黄旗
										"atlas/skill/zuanxinding.atlas",  // 钻心钉
										
										"atlas/common/roundOk.atlas",
										"atlas/common/selected2.atlas",
										
										"atlas/gameover/duan.atlas",
										"atlas/gameover/lose.atlas",
										"atlas/gameover/win.atlas",
										"atlas/gameover/unlock.atlas").addEventListener(AEvent.COMPLETE, function(e:AEvent):void{
										
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/scene/fire2.atlas").data);
				//UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/scene/debut.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/scene/debut3.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/scene/death2.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/scene/sleep.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/scene/hit.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/scene/shoot.atlas").data);
				
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/characters/optional.atlas").data);
				
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/skill/baguaxianyi.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/skill/dingfengzhu2.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/skill/dinghaizhu.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/skill/dingshen.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/skill/fazhoujinsan.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/skill/feihuangshi.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/skill/feixing.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/skill/humingduohun.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/skill/hunyuanbaozhu.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/skill/huolongdubiao.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/skill/jufengfan.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/skill/junwei.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/skill/pidizhu_A.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/skill/pidizhu_B.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/skill/qianxing2.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/skill/qiankunquan.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/skill/qibaolinglongta.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/skill/sanqianhuolongjun_A.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/skill/sanqianhuolongjun_B.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/skill/sheji.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/skill/shenyanzhiguang.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/skill/taiyangjinzhen.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/skill/tianyuan.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/skill/wugoushuangjian.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/skill/yishoulongwei.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/skill/yuanhu.atlas").data);
				//UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/skill/xinghuangqi.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/skill/zuanxinding.atlas").data);
				
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/common/roundOk.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/common/selected2.atlas").data);
				
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/gameover/duan.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/gameover/win.atlas").data);
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/gameover/lose.atlas").data);	
				UUFacade.cache.addAtlas(TResourceManager.getAsset("atlas/gameover/unlock.atlas").data);	
				
			});
		}
		
		private static function onAssetLoaded(e:AEvent):void {
			TResourceManager.removeEventListener(AEvent.COMPLETE, onAssetLoaded);
			
			_isAssetsLoaded = true;
			
			Agony.getFrame().timeScaleFactor = 1.02;
			
			UUFacade.registerSkin("battle_roundOk", ButtonSkinUU, ButtonSkinType.PRESS, 
				TResourceManager.getAsset("battle/btn/roundOk_release.png").data,
				TResourceManager.getAsset("battle/btn/roundOk_press.png").data);
				
			UUFacade.registerSkin("buffTip_scale9", Scale9MultiBitmapsSkinUU, TResourceManager.getAsset("battle/img/buffTip_scale9.png").data);
			
			UUFacade.registerSkin("battle_back", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("battle/btn2/back_release.png").data,
				TResourceManager.getAsset("battle/btn2/back_hover.png").data,
				TResourceManager.getAsset("battle/btn2/back_press.png").data);
				
			UUFacade.registerSkin("battle_setting", ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("battle/btn2/setting_release.png").data,
				TResourceManager.getAsset("battle/btn2/setting_hover.png").data,
				TResourceManager.getAsset("battle/btn2/setting_press.png").data);
			UUFacade.registerSkin("battle_common_B", ButtonSkinUU, ButtonSkinType.SCALE9, 
					TResourceManager.getAsset("battle/btn2/common_B.png").data);
			
			UUFacade.registerSkin(SkinNameConfig.unlock_mount_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("gameover/btn/mount_release.png").data,
				TResourceManager.getAsset("gameover/btn/mount_hover.png").data,
				TResourceManager.getAsset("gameover/btn/mount_press.png").data);
				
			UUFacade.registerSkin(SkinNameConfig.unlock_close_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("gameover/btn/next_release.png").data,
				TResourceManager.getAsset("gameover/btn/next_hover.png").data,
				TResourceManager.getAsset("gameover/btn/next_press.png").data);
			
			UUFacade.registerSkin(SkinNameConfig.unlock_left_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("gameover/btn/left_release.png").data,
				TResourceManager.getAsset("gameover/btn/left_hover.png").data,
				TResourceManager.getAsset("gameover/btn/left_hover.png").data);
			
			UUFacade.registerSkin(SkinNameConfig.unlock_right_btn, ButtonSkinUU, ButtonSkinType.PRESS_OVER, 
				TResourceManager.getAsset("gameover/btn/right_release.png").data,
				TResourceManager.getAsset("gameover/btn/right_hover.png").data,
				TResourceManager.getAsset("gameover/btn/right_hover.png").data);
					
					
			Agony.getLog().simplify("\n");
			
			Agony.getLog().message("Battle_VV", "資源加載完成，加入戰鬥中...");
			
			
			
			// 停頓.
			GameModel.getDelay().delayedCall(ConfigRes.WAITING_TIME_FOR_LOADING, function():void {
				requestBattle();
			});
		}
		
		
		override public function onExit() : void {
			//TweenMax.killAll();
			UUFacade.closeAllWindows();
		}
		
		
		
		public static function requestBattle() : void {
			var msg_A:SignReq;
			
			msg_A = new SignReq;
			msg_A.uid = ConfigNet.uid;
			msg_A.cbData = 1;
			NetManager.sendRequest2(CmdType.CT_AUTH, CmdCodeSign.CC_AUTH_SIGN_REQ, msg_A);
			
			
			MusicManager.getInstance().loadAndPlay("assets/sounds/music/battle_bg.mp3", 0, 0.6);
		}
	}
}