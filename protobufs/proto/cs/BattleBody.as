package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.cs.BattleStatusNtf;
	import proto.cs.ArenaOverNtf;
	import proto.cs.UpdateMonsterNtf;
	import proto.cs.StartBattleReq;
	import proto.cs.RoleCardCountNtf;
	import proto.cs.StartBattleRes;
	import proto.cs.ArenaSelectOrderCardNtf;
	import proto.cs.ArenaDisconnectNtf;
	import proto.cs.PlayCardRes;
	import proto.cs.SkillUseNtf;
	import proto.cs.BoutBeginNtf;
	import proto.cs.SetBattleParamReq;
	import proto.cs.GuessCardNameResNtf;
	import proto.cs.GuessCardNameReq;
	import proto.cs.MoveChessRes;
	import proto.cs.StartBattleAck;
	import proto.cs.PlayCardReq;
	import proto.cs.SetBattleParamRes;
	import proto.cs.MoveChessReq;
	import proto.cs.ArenaQuitNtf;
	import proto.cs.BattleForceExitNtf;
	import proto.cs.EnterArenaNtf;
	import proto.cs.EnterArenaReq;
	import proto.cs.ArenaReconnectReq;
	import proto.cs.BoutEndNtf;
	import proto.cs.GetBattleParamRes;
	import proto.cs.ArenaReconnectRes;
	import proto.cs.MoveChessNtf;
	import proto.cs.ArenaSelectCampNtf;
	import proto.cs.ReceiveOnceSkillNtf;
	import proto.cs.SkillUseReq;
	import proto.cs.GuessCardNameNtf;
	import proto.cs.PlayCardNtf;
	import proto.cs.SkillUseRes;
	import proto.cs.ArenaSelectCampReq;
	import proto.cs.ArenaReconnectNtf;
	import proto.cs.GiveOutInitCard;
	import proto.cs.GiveOutIdentityNtf;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class BattleBody extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GET_BATTLE_PARAM_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.get_battle_param_res", "getBattleParamRes", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.GetBattleParamRes; });

		private var get_battle_param_res$field:proto.cs.GetBattleParamRes;

		public function clearGetBattleParamRes():void {
			get_battle_param_res$field = null;
		}

		public function get hasGetBattleParamRes():Boolean {
			return get_battle_param_res$field != null;
		}

		public function set getBattleParamRes(value:proto.cs.GetBattleParamRes):void {
			get_battle_param_res$field = value;
		}

		public function get getBattleParamRes():proto.cs.GetBattleParamRes {
			return get_battle_param_res$field;
		}

		/**
		 *  @private
		 */
		public static const SET_BATTLE_PARAM_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.set_battle_param_req", "setBattleParamReq", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.SetBattleParamReq; });

		private var set_battle_param_req$field:proto.cs.SetBattleParamReq;

		public function clearSetBattleParamReq():void {
			set_battle_param_req$field = null;
		}

		public function get hasSetBattleParamReq():Boolean {
			return set_battle_param_req$field != null;
		}

		public function set setBattleParamReq(value:proto.cs.SetBattleParamReq):void {
			set_battle_param_req$field = value;
		}

		public function get setBattleParamReq():proto.cs.SetBattleParamReq {
			return set_battle_param_req$field;
		}

		/**
		 *  @private
		 */
		public static const SET_BATTLE_PARAM_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.set_battle_param_res", "setBattleParamRes", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.SetBattleParamRes; });

		private var set_battle_param_res$field:proto.cs.SetBattleParamRes;

		public function clearSetBattleParamRes():void {
			set_battle_param_res$field = null;
		}

		public function get hasSetBattleParamRes():Boolean {
			return set_battle_param_res$field != null;
		}

		public function set setBattleParamRes(value:proto.cs.SetBattleParamRes):void {
			set_battle_param_res$field = value;
		}

		public function get setBattleParamRes():proto.cs.SetBattleParamRes {
			return set_battle_param_res$field;
		}

		/**
		 *  @private
		 */
		public static const START_BATTLE_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.start_battle_req", "startBattleReq", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.StartBattleReq; });

		private var start_battle_req$field:proto.cs.StartBattleReq;

		public function clearStartBattleReq():void {
			start_battle_req$field = null;
		}

		public function get hasStartBattleReq():Boolean {
			return start_battle_req$field != null;
		}

		public function set startBattleReq(value:proto.cs.StartBattleReq):void {
			start_battle_req$field = value;
		}

		public function get startBattleReq():proto.cs.StartBattleReq {
			return start_battle_req$field;
		}

		/**
		 *  @private
		 */
		public static const START_BATTLE_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.start_battle_res", "startBattleRes", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.StartBattleRes; });

		private var start_battle_res$field:proto.cs.StartBattleRes;

		public function clearStartBattleRes():void {
			start_battle_res$field = null;
		}

		public function get hasStartBattleRes():Boolean {
			return start_battle_res$field != null;
		}

		public function set startBattleRes(value:proto.cs.StartBattleRes):void {
			start_battle_res$field = value;
		}

		public function get startBattleRes():proto.cs.StartBattleRes {
			return start_battle_res$field;
		}

		/**
		 *  @private
		 */
		public static const START_BATTLE_ACK:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.start_battle_ack", "startBattleAck", (13 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.StartBattleAck; });

		private var start_battle_ack$field:proto.cs.StartBattleAck;

		public function clearStartBattleAck():void {
			start_battle_ack$field = null;
		}

		public function get hasStartBattleAck():Boolean {
			return start_battle_ack$field != null;
		}

		public function set startBattleAck(value:proto.cs.StartBattleAck):void {
			start_battle_ack$field = value;
		}

		public function get startBattleAck():proto.cs.StartBattleAck {
			return start_battle_ack$field;
		}

		/**
		 *  @private
		 */
		public static const SKILL_USE_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.skill_use_req", "skillUseReq", (50 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.SkillUseReq; });

		private var skill_use_req$field:proto.cs.SkillUseReq;

		public function clearSkillUseReq():void {
			skill_use_req$field = null;
		}

		public function get hasSkillUseReq():Boolean {
			return skill_use_req$field != null;
		}

		public function set skillUseReq(value:proto.cs.SkillUseReq):void {
			skill_use_req$field = value;
		}

		public function get skillUseReq():proto.cs.SkillUseReq {
			return skill_use_req$field;
		}

		/**
		 *  @private
		 */
		public static const SKILL_USE_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.skill_use_res", "skillUseRes", (51 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.SkillUseRes; });

		private var skill_use_res$field:proto.cs.SkillUseRes;

		public function clearSkillUseRes():void {
			skill_use_res$field = null;
		}

		public function get hasSkillUseRes():Boolean {
			return skill_use_res$field != null;
		}

		public function set skillUseRes(value:proto.cs.SkillUseRes):void {
			skill_use_res$field = value;
		}

		public function get skillUseRes():proto.cs.SkillUseRes {
			return skill_use_res$field;
		}

		/**
		 *  @private
		 */
		public static const SKILL_USE_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.skill_use_ntf", "skillUseNtf", (52 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.SkillUseNtf; });

		private var skill_use_ntf$field:proto.cs.SkillUseNtf;

		public function clearSkillUseNtf():void {
			skill_use_ntf$field = null;
		}

		public function get hasSkillUseNtf():Boolean {
			return skill_use_ntf$field != null;
		}

		public function set skillUseNtf(value:proto.cs.SkillUseNtf):void {
			skill_use_ntf$field = value;
		}

		public function get skillUseNtf():proto.cs.SkillUseNtf {
			return skill_use_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const BATTLE_STATUS_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.battle_status_ntf", "battleStatusNtf", (55 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.BattleStatusNtf; });

		private var battle_status_ntf$field:proto.cs.BattleStatusNtf;

		public function clearBattleStatusNtf():void {
			battle_status_ntf$field = null;
		}

		public function get hasBattleStatusNtf():Boolean {
			return battle_status_ntf$field != null;
		}

		public function set battleStatusNtf(value:proto.cs.BattleStatusNtf):void {
			battle_status_ntf$field = value;
		}

		public function get battleStatusNtf():proto.cs.BattleStatusNtf {
			return battle_status_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const ARENA_SELECT_ORDER_CARD_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.arena_select_order_card_ntf", "arenaSelectOrderCardNtf", (71 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ArenaSelectOrderCardNtf; });

		private var arena_select_order_card_ntf$field:proto.cs.ArenaSelectOrderCardNtf;

		public function clearArenaSelectOrderCardNtf():void {
			arena_select_order_card_ntf$field = null;
		}

		public function get hasArenaSelectOrderCardNtf():Boolean {
			return arena_select_order_card_ntf$field != null;
		}

		public function set arenaSelectOrderCardNtf(value:proto.cs.ArenaSelectOrderCardNtf):void {
			arena_select_order_card_ntf$field = value;
		}

		public function get arenaSelectOrderCardNtf():proto.cs.ArenaSelectOrderCardNtf {
			return arena_select_order_card_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const ARENA_SELECT_CAMP_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.arena_select_camp_req", "arenaSelectCampReq", (72 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ArenaSelectCampReq; });

		private var arena_select_camp_req$field:proto.cs.ArenaSelectCampReq;

		public function clearArenaSelectCampReq():void {
			arena_select_camp_req$field = null;
		}

		public function get hasArenaSelectCampReq():Boolean {
			return arena_select_camp_req$field != null;
		}

		public function set arenaSelectCampReq(value:proto.cs.ArenaSelectCampReq):void {
			arena_select_camp_req$field = value;
		}

		public function get arenaSelectCampReq():proto.cs.ArenaSelectCampReq {
			return arena_select_camp_req$field;
		}

		/**
		 *  @private
		 */
		public static const ARENA_SELECT_CAMP_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.arena_select_camp_ntf", "arenaSelectCampNtf", (74 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ArenaSelectCampNtf; });

		private var arena_select_camp_ntf$field:proto.cs.ArenaSelectCampNtf;

		public function clearArenaSelectCampNtf():void {
			arena_select_camp_ntf$field = null;
		}

		public function get hasArenaSelectCampNtf():Boolean {
			return arena_select_camp_ntf$field != null;
		}

		public function set arenaSelectCampNtf(value:proto.cs.ArenaSelectCampNtf):void {
			arena_select_camp_ntf$field = value;
		}

		public function get arenaSelectCampNtf():proto.cs.ArenaSelectCampNtf {
			return arena_select_camp_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const ARENA_DISCONNECT_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.arena_disconnect_ntf", "arenaDisconnectNtf", (91 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ArenaDisconnectNtf; });

		private var arena_disconnect_ntf$field:proto.cs.ArenaDisconnectNtf;

		public function clearArenaDisconnectNtf():void {
			arena_disconnect_ntf$field = null;
		}

		public function get hasArenaDisconnectNtf():Boolean {
			return arena_disconnect_ntf$field != null;
		}

		public function set arenaDisconnectNtf(value:proto.cs.ArenaDisconnectNtf):void {
			arena_disconnect_ntf$field = value;
		}

		public function get arenaDisconnectNtf():proto.cs.ArenaDisconnectNtf {
			return arena_disconnect_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const ARENA_RECONNECT_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.arena_reconnect_req", "arenaReconnectReq", (92 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ArenaReconnectReq; });

		private var arena_reconnect_req$field:proto.cs.ArenaReconnectReq;

		public function clearArenaReconnectReq():void {
			arena_reconnect_req$field = null;
		}

		public function get hasArenaReconnectReq():Boolean {
			return arena_reconnect_req$field != null;
		}

		public function set arenaReconnectReq(value:proto.cs.ArenaReconnectReq):void {
			arena_reconnect_req$field = value;
		}

		public function get arenaReconnectReq():proto.cs.ArenaReconnectReq {
			return arena_reconnect_req$field;
		}

		/**
		 *  @private
		 */
		public static const ARENA_RECONNECT_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.arena_reconnect_res", "arenaReconnectRes", (93 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ArenaReconnectRes; });

		private var arena_reconnect_res$field:proto.cs.ArenaReconnectRes;

		public function clearArenaReconnectRes():void {
			arena_reconnect_res$field = null;
		}

		public function get hasArenaReconnectRes():Boolean {
			return arena_reconnect_res$field != null;
		}

		public function set arenaReconnectRes(value:proto.cs.ArenaReconnectRes):void {
			arena_reconnect_res$field = value;
		}

		public function get arenaReconnectRes():proto.cs.ArenaReconnectRes {
			return arena_reconnect_res$field;
		}

		/**
		 *  @private
		 */
		public static const ARENA_RECONNECT_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.arena_reconnect_ntf", "arenaReconnectNtf", (94 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ArenaReconnectNtf; });

		private var arena_reconnect_ntf$field:proto.cs.ArenaReconnectNtf;

		public function clearArenaReconnectNtf():void {
			arena_reconnect_ntf$field = null;
		}

		public function get hasArenaReconnectNtf():Boolean {
			return arena_reconnect_ntf$field != null;
		}

		public function set arenaReconnectNtf(value:proto.cs.ArenaReconnectNtf):void {
			arena_reconnect_ntf$field = value;
		}

		public function get arenaReconnectNtf():proto.cs.ArenaReconnectNtf {
			return arena_reconnect_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const ENTER_ARENA_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.enter_arena_req", "enterArenaReq", (101 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.EnterArenaReq; });

		private var enter_arena_req$field:proto.cs.EnterArenaReq;

		public function clearEnterArenaReq():void {
			enter_arena_req$field = null;
		}

		public function get hasEnterArenaReq():Boolean {
			return enter_arena_req$field != null;
		}

		public function set enterArenaReq(value:proto.cs.EnterArenaReq):void {
			enter_arena_req$field = value;
		}

		public function get enterArenaReq():proto.cs.EnterArenaReq {
			return enter_arena_req$field;
		}

		/**
		 *  @private
		 */
		public static const ENTER_ARENA_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.enter_arena_ntf", "enterArenaNtf", (103 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.EnterArenaNtf; });

		private var enter_arena_ntf$field:proto.cs.EnterArenaNtf;

		public function clearEnterArenaNtf():void {
			enter_arena_ntf$field = null;
		}

		public function get hasEnterArenaNtf():Boolean {
			return enter_arena_ntf$field != null;
		}

		public function set enterArenaNtf(value:proto.cs.EnterArenaNtf):void {
			enter_arena_ntf$field = value;
		}

		public function get enterArenaNtf():proto.cs.EnterArenaNtf {
			return enter_arena_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const ARENA_OVER_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.arena_over_ntf", "arenaOverNtf", (104 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ArenaOverNtf; });

		private var arena_over_ntf$field:proto.cs.ArenaOverNtf;

		public function clearArenaOverNtf():void {
			arena_over_ntf$field = null;
		}

		public function get hasArenaOverNtf():Boolean {
			return arena_over_ntf$field != null;
		}

		public function set arenaOverNtf(value:proto.cs.ArenaOverNtf):void {
			arena_over_ntf$field = value;
		}

		public function get arenaOverNtf():proto.cs.ArenaOverNtf {
			return arena_over_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const ARENA_QUIT_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.arena_quit_ntf", "arenaQuitNtf", (105 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ArenaQuitNtf; });

		private var arena_quit_ntf$field:proto.cs.ArenaQuitNtf;

		public function clearArenaQuitNtf():void {
			arena_quit_ntf$field = null;
		}

		public function get hasArenaQuitNtf():Boolean {
			return arena_quit_ntf$field != null;
		}

		public function set arenaQuitNtf(value:proto.cs.ArenaQuitNtf):void {
			arena_quit_ntf$field = value;
		}

		public function get arenaQuitNtf():proto.cs.ArenaQuitNtf {
			return arena_quit_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const GIVE_OUT_IDENTITY_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.give_out_identity_ntf", "giveOutIdentityNtf", (110 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.GiveOutIdentityNtf; });

		private var give_out_identity_ntf$field:proto.cs.GiveOutIdentityNtf;

		public function clearGiveOutIdentityNtf():void {
			give_out_identity_ntf$field = null;
		}

		public function get hasGiveOutIdentityNtf():Boolean {
			return give_out_identity_ntf$field != null;
		}

		public function set giveOutIdentityNtf(value:proto.cs.GiveOutIdentityNtf):void {
			give_out_identity_ntf$field = value;
		}

		public function get giveOutIdentityNtf():proto.cs.GiveOutIdentityNtf {
			return give_out_identity_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const GIVE_OUT_INIT_CARD_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.give_out_init_card_ntf", "giveOutInitCardNtf", (111 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.GiveOutInitCard; });

		private var give_out_init_card_ntf$field:proto.cs.GiveOutInitCard;

		public function clearGiveOutInitCardNtf():void {
			give_out_init_card_ntf$field = null;
		}

		public function get hasGiveOutInitCardNtf():Boolean {
			return give_out_init_card_ntf$field != null;
		}

		public function set giveOutInitCardNtf(value:proto.cs.GiveOutInitCard):void {
			give_out_init_card_ntf$field = value;
		}

		public function get giveOutInitCardNtf():proto.cs.GiveOutInitCard {
			return give_out_init_card_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const PLAY_CARD_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.play_card_req", "playCardReq", (112 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.PlayCardReq; });

		private var play_card_req$field:proto.cs.PlayCardReq;

		public function clearPlayCardReq():void {
			play_card_req$field = null;
		}

		public function get hasPlayCardReq():Boolean {
			return play_card_req$field != null;
		}

		public function set playCardReq(value:proto.cs.PlayCardReq):void {
			play_card_req$field = value;
		}

		public function get playCardReq():proto.cs.PlayCardReq {
			return play_card_req$field;
		}

		/**
		 *  @private
		 */
		public static const PLAY_CARD_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.play_card_res", "playCardRes", (113 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.PlayCardRes; });

		private var play_card_res$field:proto.cs.PlayCardRes;

		public function clearPlayCardRes():void {
			play_card_res$field = null;
		}

		public function get hasPlayCardRes():Boolean {
			return play_card_res$field != null;
		}

		public function set playCardRes(value:proto.cs.PlayCardRes):void {
			play_card_res$field = value;
		}

		public function get playCardRes():proto.cs.PlayCardRes {
			return play_card_res$field;
		}

		/**
		 *  @private
		 */
		public static const PLAY_CARD_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.play_card_ntf", "playCardNtf", (114 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.PlayCardNtf; });

		private var play_card_ntf$field:proto.cs.PlayCardNtf;

		public function clearPlayCardNtf():void {
			play_card_ntf$field = null;
		}

		public function get hasPlayCardNtf():Boolean {
			return play_card_ntf$field != null;
		}

		public function set playCardNtf(value:proto.cs.PlayCardNtf):void {
			play_card_ntf$field = value;
		}

		public function get playCardNtf():proto.cs.PlayCardNtf {
			return play_card_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const UPDATE_MONSTER_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.update_monster_ntf", "updateMonsterNtf", (115 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.UpdateMonsterNtf; });

		private var update_monster_ntf$field:proto.cs.UpdateMonsterNtf;

		public function clearUpdateMonsterNtf():void {
			update_monster_ntf$field = null;
		}

		public function get hasUpdateMonsterNtf():Boolean {
			return update_monster_ntf$field != null;
		}

		public function set updateMonsterNtf(value:proto.cs.UpdateMonsterNtf):void {
			update_monster_ntf$field = value;
		}

		public function get updateMonsterNtf():proto.cs.UpdateMonsterNtf {
			return update_monster_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const ROLE_CARD_COUNT_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.role_card_count_ntf", "roleCardCountNtf", (116 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.RoleCardCountNtf; });

		private var role_card_count_ntf$field:proto.cs.RoleCardCountNtf;

		public function clearRoleCardCountNtf():void {
			role_card_count_ntf$field = null;
		}

		public function get hasRoleCardCountNtf():Boolean {
			return role_card_count_ntf$field != null;
		}

		public function set roleCardCountNtf(value:proto.cs.RoleCardCountNtf):void {
			role_card_count_ntf$field = value;
		}

		public function get roleCardCountNtf():proto.cs.RoleCardCountNtf {
			return role_card_count_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const MOVE_CHESS_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.move_chess_req", "moveChessReq", (120 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.MoveChessReq; });

		private var move_chess_req$field:proto.cs.MoveChessReq;

		public function clearMoveChessReq():void {
			move_chess_req$field = null;
		}

		public function get hasMoveChessReq():Boolean {
			return move_chess_req$field != null;
		}

		public function set moveChessReq(value:proto.cs.MoveChessReq):void {
			move_chess_req$field = value;
		}

		public function get moveChessReq():proto.cs.MoveChessReq {
			return move_chess_req$field;
		}

		/**
		 *  @private
		 */
		public static const MOVE_CHESS_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.move_chess_res", "moveChessRes", (121 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.MoveChessRes; });

		private var move_chess_res$field:proto.cs.MoveChessRes;

		public function clearMoveChessRes():void {
			move_chess_res$field = null;
		}

		public function get hasMoveChessRes():Boolean {
			return move_chess_res$field != null;
		}

		public function set moveChessRes(value:proto.cs.MoveChessRes):void {
			move_chess_res$field = value;
		}

		public function get moveChessRes():proto.cs.MoveChessRes {
			return move_chess_res$field;
		}

		/**
		 *  @private
		 */
		public static const MOVE_CHESS_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.move_chess_ntf", "moveChessNtf", (122 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.MoveChessNtf; });

		private var move_chess_ntf$field:proto.cs.MoveChessNtf;

		public function clearMoveChessNtf():void {
			move_chess_ntf$field = null;
		}

		public function get hasMoveChessNtf():Boolean {
			return move_chess_ntf$field != null;
		}

		public function set moveChessNtf(value:proto.cs.MoveChessNtf):void {
			move_chess_ntf$field = value;
		}

		public function get moveChessNtf():proto.cs.MoveChessNtf {
			return move_chess_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const BOUT_BEGIN_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.bout_begin_ntf", "boutBeginNtf", (131 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.BoutBeginNtf; });

		private var bout_begin_ntf$field:proto.cs.BoutBeginNtf;

		public function clearBoutBeginNtf():void {
			bout_begin_ntf$field = null;
		}

		public function get hasBoutBeginNtf():Boolean {
			return bout_begin_ntf$field != null;
		}

		public function set boutBeginNtf(value:proto.cs.BoutBeginNtf):void {
			bout_begin_ntf$field = value;
		}

		public function get boutBeginNtf():proto.cs.BoutBeginNtf {
			return bout_begin_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const BOUT_END_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.bout_end_ntf", "boutEndNtf", (132 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.BoutEndNtf; });

		private var bout_end_ntf$field:proto.cs.BoutEndNtf;

		public function clearBoutEndNtf():void {
			bout_end_ntf$field = null;
		}

		public function get hasBoutEndNtf():Boolean {
			return bout_end_ntf$field != null;
		}

		public function set boutEndNtf(value:proto.cs.BoutEndNtf):void {
			bout_end_ntf$field = value;
		}

		public function get boutEndNtf():proto.cs.BoutEndNtf {
			return bout_end_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const GUESS_CARD_NAME_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.guess_card_name_ntf", "guessCardNameNtf", (165 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.GuessCardNameNtf; });

		private var guess_card_name_ntf$field:proto.cs.GuessCardNameNtf;

		public function clearGuessCardNameNtf():void {
			guess_card_name_ntf$field = null;
		}

		public function get hasGuessCardNameNtf():Boolean {
			return guess_card_name_ntf$field != null;
		}

		public function set guessCardNameNtf(value:proto.cs.GuessCardNameNtf):void {
			guess_card_name_ntf$field = value;
		}

		public function get guessCardNameNtf():proto.cs.GuessCardNameNtf {
			return guess_card_name_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const GUESS_CARD_NAME_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.guess_card_name_req", "guessCardNameReq", (166 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.GuessCardNameReq; });

		private var guess_card_name_req$field:proto.cs.GuessCardNameReq;

		public function clearGuessCardNameReq():void {
			guess_card_name_req$field = null;
		}

		public function get hasGuessCardNameReq():Boolean {
			return guess_card_name_req$field != null;
		}

		public function set guessCardNameReq(value:proto.cs.GuessCardNameReq):void {
			guess_card_name_req$field = value;
		}

		public function get guessCardNameReq():proto.cs.GuessCardNameReq {
			return guess_card_name_req$field;
		}

		/**
		 *  @private
		 */
		public static const GUESS_CARD_NAME_RES_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.guess_card_name_res_ntf", "guessCardNameResNtf", (167 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.GuessCardNameResNtf; });

		private var guess_card_name_res_ntf$field:proto.cs.GuessCardNameResNtf;

		public function clearGuessCardNameResNtf():void {
			guess_card_name_res_ntf$field = null;
		}

		public function get hasGuessCardNameResNtf():Boolean {
			return guess_card_name_res_ntf$field != null;
		}

		public function set guessCardNameResNtf(value:proto.cs.GuessCardNameResNtf):void {
			guess_card_name_res_ntf$field = value;
		}

		public function get guessCardNameResNtf():proto.cs.GuessCardNameResNtf {
			return guess_card_name_res_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const RECEIVE_ONCE_SKILL_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.receive_once_skill_ntf", "receiveOnceSkillNtf", (181 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ReceiveOnceSkillNtf; });

		private var receive_once_skill_ntf$field:proto.cs.ReceiveOnceSkillNtf;

		public function clearReceiveOnceSkillNtf():void {
			receive_once_skill_ntf$field = null;
		}

		public function get hasReceiveOnceSkillNtf():Boolean {
			return receive_once_skill_ntf$field != null;
		}

		public function set receiveOnceSkillNtf(value:proto.cs.ReceiveOnceSkillNtf):void {
			receive_once_skill_ntf$field = value;
		}

		public function get receiveOnceSkillNtf():proto.cs.ReceiveOnceSkillNtf {
			return receive_once_skill_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const BATTLE_FORCE_EXIT_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.BattleBody.battle_force_exit_ntf", "battleForceExitNtf", (193 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.BattleForceExitNtf; });

		private var battle_force_exit_ntf$field:proto.cs.BattleForceExitNtf;

		public function clearBattleForceExitNtf():void {
			battle_force_exit_ntf$field = null;
		}

		public function get hasBattleForceExitNtf():Boolean {
			return battle_force_exit_ntf$field != null;
		}

		public function set battleForceExitNtf(value:proto.cs.BattleForceExitNtf):void {
			battle_force_exit_ntf$field = value;
		}

		public function get battleForceExitNtf():proto.cs.BattleForceExitNtf {
			return battle_force_exit_ntf$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasGetBattleParamRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, get_battle_param_res$field);
			}
			if (hasSetBattleParamReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, set_battle_param_req$field);
			}
			if (hasSetBattleParamRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, set_battle_param_res$field);
			}
			if (hasStartBattleReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, start_battle_req$field);
			}
			if (hasStartBattleRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, start_battle_res$field);
			}
			if (hasStartBattleAck) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, start_battle_ack$field);
			}
			if (hasSkillUseReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 50);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, skill_use_req$field);
			}
			if (hasSkillUseRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 51);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, skill_use_res$field);
			}
			if (hasSkillUseNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 52);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, skill_use_ntf$field);
			}
			if (hasBattleStatusNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 55);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, battle_status_ntf$field);
			}
			if (hasArenaSelectOrderCardNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 71);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, arena_select_order_card_ntf$field);
			}
			if (hasArenaSelectCampReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 72);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, arena_select_camp_req$field);
			}
			if (hasArenaSelectCampNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 74);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, arena_select_camp_ntf$field);
			}
			if (hasArenaDisconnectNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 91);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, arena_disconnect_ntf$field);
			}
			if (hasArenaReconnectReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 92);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, arena_reconnect_req$field);
			}
			if (hasArenaReconnectRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 93);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, arena_reconnect_res$field);
			}
			if (hasArenaReconnectNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 94);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, arena_reconnect_ntf$field);
			}
			if (hasEnterArenaReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 101);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, enter_arena_req$field);
			}
			if (hasEnterArenaNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 103);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, enter_arena_ntf$field);
			}
			if (hasArenaOverNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 104);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, arena_over_ntf$field);
			}
			if (hasArenaQuitNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 105);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, arena_quit_ntf$field);
			}
			if (hasGiveOutIdentityNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 110);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, give_out_identity_ntf$field);
			}
			if (hasGiveOutInitCardNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 111);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, give_out_init_card_ntf$field);
			}
			if (hasPlayCardReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 112);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, play_card_req$field);
			}
			if (hasPlayCardRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 113);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, play_card_res$field);
			}
			if (hasPlayCardNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 114);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, play_card_ntf$field);
			}
			if (hasUpdateMonsterNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 115);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, update_monster_ntf$field);
			}
			if (hasRoleCardCountNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 116);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, role_card_count_ntf$field);
			}
			if (hasMoveChessReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 120);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, move_chess_req$field);
			}
			if (hasMoveChessRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 121);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, move_chess_res$field);
			}
			if (hasMoveChessNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 122);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, move_chess_ntf$field);
			}
			if (hasBoutBeginNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 131);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, bout_begin_ntf$field);
			}
			if (hasBoutEndNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 132);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, bout_end_ntf$field);
			}
			if (hasGuessCardNameNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 165);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, guess_card_name_ntf$field);
			}
			if (hasGuessCardNameReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 166);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, guess_card_name_req$field);
			}
			if (hasGuessCardNameResNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 167);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, guess_card_name_res_ntf$field);
			}
			if (hasReceiveOnceSkillNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 181);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, receive_once_skill_ntf$field);
			}
			if (hasBattleForceExitNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 193);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, battle_force_exit_ntf$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var get_battle_param_res$count:uint = 0;
			var set_battle_param_req$count:uint = 0;
			var set_battle_param_res$count:uint = 0;
			var start_battle_req$count:uint = 0;
			var start_battle_res$count:uint = 0;
			var start_battle_ack$count:uint = 0;
			var skill_use_req$count:uint = 0;
			var skill_use_res$count:uint = 0;
			var skill_use_ntf$count:uint = 0;
			var battle_status_ntf$count:uint = 0;
			var arena_select_order_card_ntf$count:uint = 0;
			var arena_select_camp_req$count:uint = 0;
			var arena_select_camp_ntf$count:uint = 0;
			var arena_disconnect_ntf$count:uint = 0;
			var arena_reconnect_req$count:uint = 0;
			var arena_reconnect_res$count:uint = 0;
			var arena_reconnect_ntf$count:uint = 0;
			var enter_arena_req$count:uint = 0;
			var enter_arena_ntf$count:uint = 0;
			var arena_over_ntf$count:uint = 0;
			var arena_quit_ntf$count:uint = 0;
			var give_out_identity_ntf$count:uint = 0;
			var give_out_init_card_ntf$count:uint = 0;
			var play_card_req$count:uint = 0;
			var play_card_res$count:uint = 0;
			var play_card_ntf$count:uint = 0;
			var update_monster_ntf$count:uint = 0;
			var role_card_count_ntf$count:uint = 0;
			var move_chess_req$count:uint = 0;
			var move_chess_res$count:uint = 0;
			var move_chess_ntf$count:uint = 0;
			var bout_begin_ntf$count:uint = 0;
			var bout_end_ntf$count:uint = 0;
			var guess_card_name_ntf$count:uint = 0;
			var guess_card_name_req$count:uint = 0;
			var guess_card_name_res_ntf$count:uint = 0;
			var receive_once_skill_ntf$count:uint = 0;
			var battle_force_exit_ntf$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (get_battle_param_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.getBattleParamRes cannot be set twice.');
					}
					++get_battle_param_res$count;
					this.getBattleParamRes = new proto.cs.GetBattleParamRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.getBattleParamRes);
					break;
				case 3:
					if (set_battle_param_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.setBattleParamReq cannot be set twice.');
					}
					++set_battle_param_req$count;
					this.setBattleParamReq = new proto.cs.SetBattleParamReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.setBattleParamReq);
					break;
				case 4:
					if (set_battle_param_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.setBattleParamRes cannot be set twice.');
					}
					++set_battle_param_res$count;
					this.setBattleParamRes = new proto.cs.SetBattleParamRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.setBattleParamRes);
					break;
				case 10:
					if (start_battle_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.startBattleReq cannot be set twice.');
					}
					++start_battle_req$count;
					this.startBattleReq = new proto.cs.StartBattleReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.startBattleReq);
					break;
				case 12:
					if (start_battle_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.startBattleRes cannot be set twice.');
					}
					++start_battle_res$count;
					this.startBattleRes = new proto.cs.StartBattleRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.startBattleRes);
					break;
				case 13:
					if (start_battle_ack$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.startBattleAck cannot be set twice.');
					}
					++start_battle_ack$count;
					this.startBattleAck = new proto.cs.StartBattleAck();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.startBattleAck);
					break;
				case 50:
					if (skill_use_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.skillUseReq cannot be set twice.');
					}
					++skill_use_req$count;
					this.skillUseReq = new proto.cs.SkillUseReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.skillUseReq);
					break;
				case 51:
					if (skill_use_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.skillUseRes cannot be set twice.');
					}
					++skill_use_res$count;
					this.skillUseRes = new proto.cs.SkillUseRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.skillUseRes);
					break;
				case 52:
					if (skill_use_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.skillUseNtf cannot be set twice.');
					}
					++skill_use_ntf$count;
					this.skillUseNtf = new proto.cs.SkillUseNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.skillUseNtf);
					break;
				case 55:
					if (battle_status_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.battleStatusNtf cannot be set twice.');
					}
					++battle_status_ntf$count;
					this.battleStatusNtf = new proto.cs.BattleStatusNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.battleStatusNtf);
					break;
				case 71:
					if (arena_select_order_card_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.arenaSelectOrderCardNtf cannot be set twice.');
					}
					++arena_select_order_card_ntf$count;
					this.arenaSelectOrderCardNtf = new proto.cs.ArenaSelectOrderCardNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.arenaSelectOrderCardNtf);
					break;
				case 72:
					if (arena_select_camp_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.arenaSelectCampReq cannot be set twice.');
					}
					++arena_select_camp_req$count;
					this.arenaSelectCampReq = new proto.cs.ArenaSelectCampReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.arenaSelectCampReq);
					break;
				case 74:
					if (arena_select_camp_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.arenaSelectCampNtf cannot be set twice.');
					}
					++arena_select_camp_ntf$count;
					this.arenaSelectCampNtf = new proto.cs.ArenaSelectCampNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.arenaSelectCampNtf);
					break;
				case 91:
					if (arena_disconnect_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.arenaDisconnectNtf cannot be set twice.');
					}
					++arena_disconnect_ntf$count;
					this.arenaDisconnectNtf = new proto.cs.ArenaDisconnectNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.arenaDisconnectNtf);
					break;
				case 92:
					if (arena_reconnect_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.arenaReconnectReq cannot be set twice.');
					}
					++arena_reconnect_req$count;
					this.arenaReconnectReq = new proto.cs.ArenaReconnectReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.arenaReconnectReq);
					break;
				case 93:
					if (arena_reconnect_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.arenaReconnectRes cannot be set twice.');
					}
					++arena_reconnect_res$count;
					this.arenaReconnectRes = new proto.cs.ArenaReconnectRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.arenaReconnectRes);
					break;
				case 94:
					if (arena_reconnect_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.arenaReconnectNtf cannot be set twice.');
					}
					++arena_reconnect_ntf$count;
					this.arenaReconnectNtf = new proto.cs.ArenaReconnectNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.arenaReconnectNtf);
					break;
				case 101:
					if (enter_arena_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.enterArenaReq cannot be set twice.');
					}
					++enter_arena_req$count;
					this.enterArenaReq = new proto.cs.EnterArenaReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.enterArenaReq);
					break;
				case 103:
					if (enter_arena_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.enterArenaNtf cannot be set twice.');
					}
					++enter_arena_ntf$count;
					this.enterArenaNtf = new proto.cs.EnterArenaNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.enterArenaNtf);
					break;
				case 104:
					if (arena_over_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.arenaOverNtf cannot be set twice.');
					}
					++arena_over_ntf$count;
					this.arenaOverNtf = new proto.cs.ArenaOverNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.arenaOverNtf);
					break;
				case 105:
					if (arena_quit_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.arenaQuitNtf cannot be set twice.');
					}
					++arena_quit_ntf$count;
					this.arenaQuitNtf = new proto.cs.ArenaQuitNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.arenaQuitNtf);
					break;
				case 110:
					if (give_out_identity_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.giveOutIdentityNtf cannot be set twice.');
					}
					++give_out_identity_ntf$count;
					this.giveOutIdentityNtf = new proto.cs.GiveOutIdentityNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.giveOutIdentityNtf);
					break;
				case 111:
					if (give_out_init_card_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.giveOutInitCardNtf cannot be set twice.');
					}
					++give_out_init_card_ntf$count;
					this.giveOutInitCardNtf = new proto.cs.GiveOutInitCard();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.giveOutInitCardNtf);
					break;
				case 112:
					if (play_card_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.playCardReq cannot be set twice.');
					}
					++play_card_req$count;
					this.playCardReq = new proto.cs.PlayCardReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.playCardReq);
					break;
				case 113:
					if (play_card_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.playCardRes cannot be set twice.');
					}
					++play_card_res$count;
					this.playCardRes = new proto.cs.PlayCardRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.playCardRes);
					break;
				case 114:
					if (play_card_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.playCardNtf cannot be set twice.');
					}
					++play_card_ntf$count;
					this.playCardNtf = new proto.cs.PlayCardNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.playCardNtf);
					break;
				case 115:
					if (update_monster_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.updateMonsterNtf cannot be set twice.');
					}
					++update_monster_ntf$count;
					this.updateMonsterNtf = new proto.cs.UpdateMonsterNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.updateMonsterNtf);
					break;
				case 116:
					if (role_card_count_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.roleCardCountNtf cannot be set twice.');
					}
					++role_card_count_ntf$count;
					this.roleCardCountNtf = new proto.cs.RoleCardCountNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.roleCardCountNtf);
					break;
				case 120:
					if (move_chess_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.moveChessReq cannot be set twice.');
					}
					++move_chess_req$count;
					this.moveChessReq = new proto.cs.MoveChessReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.moveChessReq);
					break;
				case 121:
					if (move_chess_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.moveChessRes cannot be set twice.');
					}
					++move_chess_res$count;
					this.moveChessRes = new proto.cs.MoveChessRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.moveChessRes);
					break;
				case 122:
					if (move_chess_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.moveChessNtf cannot be set twice.');
					}
					++move_chess_ntf$count;
					this.moveChessNtf = new proto.cs.MoveChessNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.moveChessNtf);
					break;
				case 131:
					if (bout_begin_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.boutBeginNtf cannot be set twice.');
					}
					++bout_begin_ntf$count;
					this.boutBeginNtf = new proto.cs.BoutBeginNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.boutBeginNtf);
					break;
				case 132:
					if (bout_end_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.boutEndNtf cannot be set twice.');
					}
					++bout_end_ntf$count;
					this.boutEndNtf = new proto.cs.BoutEndNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.boutEndNtf);
					break;
				case 165:
					if (guess_card_name_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.guessCardNameNtf cannot be set twice.');
					}
					++guess_card_name_ntf$count;
					this.guessCardNameNtf = new proto.cs.GuessCardNameNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.guessCardNameNtf);
					break;
				case 166:
					if (guess_card_name_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.guessCardNameReq cannot be set twice.');
					}
					++guess_card_name_req$count;
					this.guessCardNameReq = new proto.cs.GuessCardNameReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.guessCardNameReq);
					break;
				case 167:
					if (guess_card_name_res_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.guessCardNameResNtf cannot be set twice.');
					}
					++guess_card_name_res_ntf$count;
					this.guessCardNameResNtf = new proto.cs.GuessCardNameResNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.guessCardNameResNtf);
					break;
				case 181:
					if (receive_once_skill_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.receiveOnceSkillNtf cannot be set twice.');
					}
					++receive_once_skill_ntf$count;
					this.receiveOnceSkillNtf = new proto.cs.ReceiveOnceSkillNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.receiveOnceSkillNtf);
					break;
				case 193:
					if (battle_force_exit_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBody.battleForceExitNtf cannot be set twice.');
					}
					++battle_force_exit_ntf$count;
					this.battleForceExitNtf = new proto.cs.BattleForceExitNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.battleForceExitNtf);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
