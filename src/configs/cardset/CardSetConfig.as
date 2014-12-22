package configs.cardset 
{
	import org.agony2d.utils.ColorUtil;
	import proto.com.CAMP_ID;
	/**
	 * ...
	 * @author ... dcl
	 */
	public class CardSetConfig 
	{
		public static const Camp_Str:Object = { 1:"商国套牌", 2:"周国套牌", 3:"妖族套牌", 4:"巫族套牌", 9:"中立套牌" };
		
		public static const Card_Pinzhi_Str:Object = {0:"全部",1:"普通", 2:"精英", 3:"稀有", 4:"传奇", 5:"盖世" };
		//public static const Card_Pinzhi_Color:Object = {0:0xD68568,1:, 2:ColorUtil.WHITE, 3:"稀有", 4:"传奇", 5:"盖世" };
		public static const Card_Pinzhi_Color:Object = {0:ColorUtil.COFFEE_A,1:ColorUtil.WHITE, 2:ColorUtil.GREEN, 3:ColorUtil.BLUE, 4:ColorUtil.PURPLE, 5:ColorUtil.ORANGE };
		
		
		public static const Camp_Neatrual_Id:int = 9;
		
		public static const Cardset_Card_Width:int = 230;
		public static const Cardset_Card_Height:int = 350;
		
		public static const Cardset_Bag_Step1:int  = 1;
		public static const Cardset_Bag_Step2:int  = 2;
		public static const Cardset_Bag_Step3:int  = 3;
		
		
		public static const Page_Num:int = 8;                       //每页显示卡牌数量
		
		public static var campId:int = CAMP_ID.CAMP_ID_SHANG;           //当前阵营
		
		public static var quality:int = 0;                        //当前品质  0：全部  
		
		public static var magic:int = -1;                        //当前魔法  -1：全部  
		
		public static var curPage:int = 1;                      //当前页数
		
		public static var maxPage:int = 1;                      //总页数
		
		public static var searchName:String = "";               //查找名称
		
		public static var isSetCard:Boolean ;                  //是否在设置卡包
		
		public static var curBagIndex:int;                      //当前选中的卡包索引
		//public static var curBagCamp:int;                      //当前选中的卡包阵营
		public function CardSetConfig() 
		{
			
		}
		
	}

}