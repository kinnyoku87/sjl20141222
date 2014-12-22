package models.player
{
	import com.netease.protobuf.UInt64;
	import models.task.TasksModule;
	import proto.com.CAMP_ID;
	import proto.com.ScoreInfo;
	
	import proto.com.CampLevel;
	import proto.com.RoleInfo;
	

	public class RoleVo
	{
		public function setCamps( campList:Array ) : void
		{
			var i:int;
			var l:int;
			var vo:CampVo;
			var data:CampLevel;
			
			_campList = new <CampVo>[];
			l = campList.length;
			while(i<l){
				data = campList[i];
				vo = _campList[i] = new CampVo;
				vo.exp = data.exp;
				vo.id = data.campId;
				vo.level = data.level;
				i++;
			}
		}
		
		
		public function setValue( roleInfo:RoleInfo ): void {
			this.exp = roleInfo.exp;
			this.gender = roleInfo.gender;
			this.icon = roleInfo.icon;
			this.id = roleInfo.id;
			this.level = roleInfo.level;
			this.money = roleInfo.money;
			this.rmb = roleInfo.rmb;
			this.name = roleInfo.name;
			this.xuanyu = roleInfo.derivative;
			this.scoreList = roleInfo.scoreList;
		}
		
		public function updateValue(roleInfo:RoleInfo):void {
			//更新基础数据
			this.exp = roleInfo.exp;
			this.gender = roleInfo.gender;
			this.icon = roleInfo.icon;
			this.id = roleInfo.id;
			this.level = roleInfo.level;
			this.money = roleInfo.money;
			this.rmb = roleInfo.rmb;
			this.name = roleInfo.name;
			this.xuanyu = roleInfo.derivative;
			
			 PlayerModel.dispatchEvent(RoleEvent.Update_Role_Money);
			
			//更新模式积分
			var upScoreList:Array = roleInfo.scoreList;
			var len:int = roleInfo.scoreList.length;
			var i:int;
			for (i = 0; i < len; i++)
            {
				var scoreInfo:ScoreInfo = roleInfo.scoreList[i] as ScoreInfo;
                var score:int = scoreInfo.score;
                var mod:int = scoreInfo.mod;
                if (scoreList.length >= i+1)
                {
                    if (scoreList.length > 0 && scoreList[i].mod == mod)
                    {
                        if (scoreList[i].score != score)
                        {
                            PlayerModel.dispatchEvent(RoleEvent.Update_Score_Change,score);
                            scoreList[i] = scoreInfo;
                        }
                    }
                }
                else
                {
                    PlayerModel.dispatchEvent(RoleEvent.Update_Score_Change,score);
                    scoreList[i] = scoreInfo;
                }
            }
			
		}
		
		public function updateCamps( campList:Array ):void {
			var upCampList:Vector.<CampVo> = new <CampVo>[];
			var i:int;
			var j:int;
			var upLen:int;
			var vo:CampVo;
			var data:CampLevel;
			
			upLen = campList.length;
			while(i<upLen){
				data = campList[i];
				vo = upCampList[i] = new CampVo;
				vo.exp = data.exp;
				vo.id = data.campId;
				vo.level = data.level;
				i++;
			}
			var len:int = _campList.length;
            for (i = 0; i < upLen; i++)
            {
                if (len != 0)
                {
                    for (j = 0; j < len; j++)
                    {
                        if (upCampList[i].id == _campList[j].id)
                        {
                            if (upCampList[i].level != _campList[j].level || upCampList[i].exp != _campList[j].exp)
                            {
                                if (upCampList[i].level != _campList[j].level)
                                {
									
                                }
								PlayerModel.dispatchEvent(RoleEvent.Update_Camp_Level_Up,upCampList[i]);	
                                _campList = upCampList;
                                TasksModule.checkTask();
                                return;
                            }
                            break;
                        }
                        if (j == len - 1)
                        {
							PlayerModel.dispatchEvent(RoleEvent.Update_Camp_Level_Up,upCampList[i]);
                            _campList = upCampList;
                            TasksModule.checkTask();
                            return;
                        }
                    }
                }
                else
                {
                    PlayerModel.dispatchEvent(RoleEvent.Update_Camp_Level_Up,upCampList[i]);
                    _campList = upCampList;
                    TasksModule.checkTask();
                    return;
                }
            }
			
		}
		 
		
		
		public var money:int;       //银子
		
		public var name:String;
		
		public var level:int;
		
		public var icon:String;
		
		public var gender:int;
		
		public var scoreList:Array = [];
		
		public var id:UInt64;
		
		public var exp:int;
		
		public var rmb:int;           //元宝
		
		public var xuanyu:int;           //玄玉
		
		
		//段位等级？
		public function duanweiLevel( mod:int):int {
            return (int)(getScore(mod) / 100) + 1;
		}
		
		//阵营总等级
		public function get getTotalLevel():int
        {
            var total:int = 0;
            for (var i:int = 0 ; i < _campList.length; i++)
            {
				if (_campList[i].id == CAMP_ID.CAMP_ID_WU) {
					continue;
				}
                total += _campList[i].level;
            }
            return total;
        }
		
		//获取某模式下的段位积分
		public function getScore( mod : int):int
        {
            for(var i:int = 0; i < scoreList.length; i++)
            {
                if(mod == ScoreInfo(scoreList[i]).mod)
                {
                    return ScoreInfo(scoreList[i]).score;
                }
            }
            return 0;
        }
		/**
		 * Shang - 1, Zhou - 2, Yao - 3, Wu - 4.
		 */
		public function getCampVo( id:int ) : CampVo {
			//var campVo:CampVo;
			for each(var value:CampVo in _campList) {
				if (value.id == id) {
					return value;
				}
			}
			return null;
		}
		
		/**
		 * 获取阵营等级
		 */
		public function  getCampLevel(id:int):int {
			return getCampVo(id).level;
		}
		
		
		private var _campList:Vector.<CampVo>;
		
		
	}
}