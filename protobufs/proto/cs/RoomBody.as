package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.cs.JoinRoomRes;
	import proto.cs.JoinRoomReq;
	import proto.cs.MatchJoinReq;
	import proto.cs.SelectCampNtf;
	import proto.cs.ClientSelfOperationReq;
	import proto.cs.FindRoomRes;
	import proto.cs.ReadyMatchNtf;
	import proto.cs.ReconnectPvpIngNtf;
	import proto.cs.CreateRoomRes;
	import proto.cs.MatchJoinRes;
	import proto.cs.ModifyRoomParamReq;
	import proto.cs.FindRoomReq;
	import proto.cs.SetChairStateNtf;
	import proto.cs.CreateRoomReq;
	import proto.cs.StartMatchNtf;
	import proto.cs.SetChairStateReq;
	import proto.cs.KickRoomReq;
	import proto.cs.QuitRoomNtf;
	import proto.cs.JoinRoomNtf;
	import proto.cs.SelectCampReq;
	import proto.cs.KickRoomNtf;
	import proto.cs.ModifyRoomParamNtf;
	import proto.cs.QuickJoinRoomReq;
	import proto.cs.SelectCampRes;
	import proto.cs.CheckCodeNtf;
	import proto.cs.ReadyMatchReq;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class RoomBody extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CREATE_ROOM_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoomBody.create_room_req", "createRoomReq", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.CreateRoomReq; });

		private var create_room_req$field:proto.cs.CreateRoomReq;

		public function clearCreateRoomReq():void {
			create_room_req$field = null;
		}

		public function get hasCreateRoomReq():Boolean {
			return create_room_req$field != null;
		}

		public function set createRoomReq(value:proto.cs.CreateRoomReq):void {
			create_room_req$field = value;
		}

		public function get createRoomReq():proto.cs.CreateRoomReq {
			return create_room_req$field;
		}

		/**
		 *  @private
		 */
		public static const CREATE_ROOM_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoomBody.create_room_res", "createRoomRes", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.CreateRoomRes; });

		private var create_room_res$field:proto.cs.CreateRoomRes;

		public function clearCreateRoomRes():void {
			create_room_res$field = null;
		}

		public function get hasCreateRoomRes():Boolean {
			return create_room_res$field != null;
		}

		public function set createRoomRes(value:proto.cs.CreateRoomRes):void {
			create_room_res$field = value;
		}

		public function get createRoomRes():proto.cs.CreateRoomRes {
			return create_room_res$field;
		}

		/**
		 *  @private
		 */
		public static const FIND_ROOM_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoomBody.find_room_req", "findRoomReq", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.FindRoomReq; });

		private var find_room_req$field:proto.cs.FindRoomReq;

		public function clearFindRoomReq():void {
			find_room_req$field = null;
		}

		public function get hasFindRoomReq():Boolean {
			return find_room_req$field != null;
		}

		public function set findRoomReq(value:proto.cs.FindRoomReq):void {
			find_room_req$field = value;
		}

		public function get findRoomReq():proto.cs.FindRoomReq {
			return find_room_req$field;
		}

		/**
		 *  @private
		 */
		public static const FIND_ROOM_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoomBody.find_room_res", "findRoomRes", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.FindRoomRes; });

		private var find_room_res$field:proto.cs.FindRoomRes;

		public function clearFindRoomRes():void {
			find_room_res$field = null;
		}

		public function get hasFindRoomRes():Boolean {
			return find_room_res$field != null;
		}

		public function set findRoomRes(value:proto.cs.FindRoomRes):void {
			find_room_res$field = value;
		}

		public function get findRoomRes():proto.cs.FindRoomRes {
			return find_room_res$field;
		}

		/**
		 *  @private
		 */
		public static const MODIFY_ROOM_PARAM_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoomBody.modify_room_param_req", "modifyRoomParamReq", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ModifyRoomParamReq; });

		private var modify_room_param_req$field:proto.cs.ModifyRoomParamReq;

		public function clearModifyRoomParamReq():void {
			modify_room_param_req$field = null;
		}

		public function get hasModifyRoomParamReq():Boolean {
			return modify_room_param_req$field != null;
		}

		public function set modifyRoomParamReq(value:proto.cs.ModifyRoomParamReq):void {
			modify_room_param_req$field = value;
		}

		public function get modifyRoomParamReq():proto.cs.ModifyRoomParamReq {
			return modify_room_param_req$field;
		}

		/**
		 *  @private
		 */
		public static const MODIFY_ROOM_PARAM_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoomBody.modify_room_param_ntf", "modifyRoomParamNtf", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ModifyRoomParamNtf; });

		private var modify_room_param_ntf$field:proto.cs.ModifyRoomParamNtf;

		public function clearModifyRoomParamNtf():void {
			modify_room_param_ntf$field = null;
		}

		public function get hasModifyRoomParamNtf():Boolean {
			return modify_room_param_ntf$field != null;
		}

		public function set modifyRoomParamNtf(value:proto.cs.ModifyRoomParamNtf):void {
			modify_room_param_ntf$field = value;
		}

		public function get modifyRoomParamNtf():proto.cs.ModifyRoomParamNtf {
			return modify_room_param_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const JOIN_ROOM_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoomBody.join_room_req", "joinRoomReq", (19 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.JoinRoomReq; });

		private var join_room_req$field:proto.cs.JoinRoomReq;

		public function clearJoinRoomReq():void {
			join_room_req$field = null;
		}

		public function get hasJoinRoomReq():Boolean {
			return join_room_req$field != null;
		}

		public function set joinRoomReq(value:proto.cs.JoinRoomReq):void {
			join_room_req$field = value;
		}

		public function get joinRoomReq():proto.cs.JoinRoomReq {
			return join_room_req$field;
		}

		/**
		 *  @private
		 */
		public static const JOIN_ROOM_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoomBody.join_room_res", "joinRoomRes", (20 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.JoinRoomRes; });

		private var join_room_res$field:proto.cs.JoinRoomRes;

		public function clearJoinRoomRes():void {
			join_room_res$field = null;
		}

		public function get hasJoinRoomRes():Boolean {
			return join_room_res$field != null;
		}

		public function set joinRoomRes(value:proto.cs.JoinRoomRes):void {
			join_room_res$field = value;
		}

		public function get joinRoomRes():proto.cs.JoinRoomRes {
			return join_room_res$field;
		}

		/**
		 *  @private
		 */
		public static const JOIN_ROOM_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoomBody.join_room_ntf", "joinRoomNtf", (21 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.JoinRoomNtf; });

		private var join_room_ntf$field:proto.cs.JoinRoomNtf;

		public function clearJoinRoomNtf():void {
			join_room_ntf$field = null;
		}

		public function get hasJoinRoomNtf():Boolean {
			return join_room_ntf$field != null;
		}

		public function set joinRoomNtf(value:proto.cs.JoinRoomNtf):void {
			join_room_ntf$field = value;
		}

		public function get joinRoomNtf():proto.cs.JoinRoomNtf {
			return join_room_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const QUIT_ROOM_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoomBody.quit_room_ntf", "quitRoomNtf", (23 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.QuitRoomNtf; });

		private var quit_room_ntf$field:proto.cs.QuitRoomNtf;

		public function clearQuitRoomNtf():void {
			quit_room_ntf$field = null;
		}

		public function get hasQuitRoomNtf():Boolean {
			return quit_room_ntf$field != null;
		}

		public function set quitRoomNtf(value:proto.cs.QuitRoomNtf):void {
			quit_room_ntf$field = value;
		}

		public function get quitRoomNtf():proto.cs.QuitRoomNtf {
			return quit_room_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const KICK_ROOM_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoomBody.kick_room_req", "kickRoomReq", (24 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.KickRoomReq; });

		private var kick_room_req$field:proto.cs.KickRoomReq;

		public function clearKickRoomReq():void {
			kick_room_req$field = null;
		}

		public function get hasKickRoomReq():Boolean {
			return kick_room_req$field != null;
		}

		public function set kickRoomReq(value:proto.cs.KickRoomReq):void {
			kick_room_req$field = value;
		}

		public function get kickRoomReq():proto.cs.KickRoomReq {
			return kick_room_req$field;
		}

		/**
		 *  @private
		 */
		public static const KICK_ROOM_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoomBody.kick_room_ntf", "kickRoomNtf", (26 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.KickRoomNtf; });

		private var kick_room_ntf$field:proto.cs.KickRoomNtf;

		public function clearKickRoomNtf():void {
			kick_room_ntf$field = null;
		}

		public function get hasKickRoomNtf():Boolean {
			return kick_room_ntf$field != null;
		}

		public function set kickRoomNtf(value:proto.cs.KickRoomNtf):void {
			kick_room_ntf$field = value;
		}

		public function get kickRoomNtf():proto.cs.KickRoomNtf {
			return kick_room_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const SET_CHAIR_STATE_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoomBody.set_chair_state_req", "setChairStateReq", (27 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.SetChairStateReq; });

		private var set_chair_state_req$field:proto.cs.SetChairStateReq;

		public function clearSetChairStateReq():void {
			set_chair_state_req$field = null;
		}

		public function get hasSetChairStateReq():Boolean {
			return set_chair_state_req$field != null;
		}

		public function set setChairStateReq(value:proto.cs.SetChairStateReq):void {
			set_chair_state_req$field = value;
		}

		public function get setChairStateReq():proto.cs.SetChairStateReq {
			return set_chair_state_req$field;
		}

		/**
		 *  @private
		 */
		public static const SET_CHAIR_STATE_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoomBody.set_chair_state_ntf", "setChairStateNtf", (28 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.SetChairStateNtf; });

		private var set_chair_state_ntf$field:proto.cs.SetChairStateNtf;

		public function clearSetChairStateNtf():void {
			set_chair_state_ntf$field = null;
		}

		public function get hasSetChairStateNtf():Boolean {
			return set_chair_state_ntf$field != null;
		}

		public function set setChairStateNtf(value:proto.cs.SetChairStateNtf):void {
			set_chair_state_ntf$field = value;
		}

		public function get setChairStateNtf():proto.cs.SetChairStateNtf {
			return set_chair_state_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const READY_MATCH_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoomBody.ready_match_req", "readyMatchReq", (29 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ReadyMatchReq; });

		private var ready_match_req$field:proto.cs.ReadyMatchReq;

		public function clearReadyMatchReq():void {
			ready_match_req$field = null;
		}

		public function get hasReadyMatchReq():Boolean {
			return ready_match_req$field != null;
		}

		public function set readyMatchReq(value:proto.cs.ReadyMatchReq):void {
			ready_match_req$field = value;
		}

		public function get readyMatchReq():proto.cs.ReadyMatchReq {
			return ready_match_req$field;
		}

		/**
		 *  @private
		 */
		public static const READY_MATCH_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoomBody.ready_match_ntf", "readyMatchNtf", (31 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ReadyMatchNtf; });

		private var ready_match_ntf$field:proto.cs.ReadyMatchNtf;

		public function clearReadyMatchNtf():void {
			ready_match_ntf$field = null;
		}

		public function get hasReadyMatchNtf():Boolean {
			return ready_match_ntf$field != null;
		}

		public function set readyMatchNtf(value:proto.cs.ReadyMatchNtf):void {
			ready_match_ntf$field = value;
		}

		public function get readyMatchNtf():proto.cs.ReadyMatchNtf {
			return ready_match_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const START_MATCH_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoomBody.start_match_ntf", "startMatchNtf", (38 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.StartMatchNtf; });

		private var start_match_ntf$field:proto.cs.StartMatchNtf;

		public function clearStartMatchNtf():void {
			start_match_ntf$field = null;
		}

		public function get hasStartMatchNtf():Boolean {
			return start_match_ntf$field != null;
		}

		public function set startMatchNtf(value:proto.cs.StartMatchNtf):void {
			start_match_ntf$field = value;
		}

		public function get startMatchNtf():proto.cs.StartMatchNtf {
			return start_match_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const QUICK_JOIN_ROOM_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoomBody.quick_join_room_req", "quickJoinRoomReq", (42 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.QuickJoinRoomReq; });

		private var quick_join_room_req$field:proto.cs.QuickJoinRoomReq;

		public function clearQuickJoinRoomReq():void {
			quick_join_room_req$field = null;
		}

		public function get hasQuickJoinRoomReq():Boolean {
			return quick_join_room_req$field != null;
		}

		public function set quickJoinRoomReq(value:proto.cs.QuickJoinRoomReq):void {
			quick_join_room_req$field = value;
		}

		public function get quickJoinRoomReq():proto.cs.QuickJoinRoomReq {
			return quick_join_room_req$field;
		}

		/**
		 *  @private
		 */
		public static const SELECT_CAMP_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoomBody.select_camp_req", "selectCampReq", (43 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.SelectCampReq; });

		private var select_camp_req$field:proto.cs.SelectCampReq;

		public function clearSelectCampReq():void {
			select_camp_req$field = null;
		}

		public function get hasSelectCampReq():Boolean {
			return select_camp_req$field != null;
		}

		public function set selectCampReq(value:proto.cs.SelectCampReq):void {
			select_camp_req$field = value;
		}

		public function get selectCampReq():proto.cs.SelectCampReq {
			return select_camp_req$field;
		}

		/**
		 *  @private
		 */
		public static const SELECT_CAMP_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoomBody.select_camp_res", "selectCampRes", (44 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.SelectCampRes; });

		private var select_camp_res$field:proto.cs.SelectCampRes;

		public function clearSelectCampRes():void {
			select_camp_res$field = null;
		}

		public function get hasSelectCampRes():Boolean {
			return select_camp_res$field != null;
		}

		public function set selectCampRes(value:proto.cs.SelectCampRes):void {
			select_camp_res$field = value;
		}

		public function get selectCampRes():proto.cs.SelectCampRes {
			return select_camp_res$field;
		}

		/**
		 *  @private
		 */
		public static const SELECT_CAMP_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoomBody.select_camp_ntf", "selectCampNtf", (45 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.SelectCampNtf; });

		private var select_camp_ntf$field:proto.cs.SelectCampNtf;

		public function clearSelectCampNtf():void {
			select_camp_ntf$field = null;
		}

		public function get hasSelectCampNtf():Boolean {
			return select_camp_ntf$field != null;
		}

		public function set selectCampNtf(value:proto.cs.SelectCampNtf):void {
			select_camp_ntf$field = value;
		}

		public function get selectCampNtf():proto.cs.SelectCampNtf {
			return select_camp_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const MATCH_JOIN_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoomBody.match_join_req", "matchJoinReq", (71 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.MatchJoinReq; });

		private var match_join_req$field:proto.cs.MatchJoinReq;

		public function clearMatchJoinReq():void {
			match_join_req$field = null;
		}

		public function get hasMatchJoinReq():Boolean {
			return match_join_req$field != null;
		}

		public function set matchJoinReq(value:proto.cs.MatchJoinReq):void {
			match_join_req$field = value;
		}

		public function get matchJoinReq():proto.cs.MatchJoinReq {
			return match_join_req$field;
		}

		/**
		 *  @private
		 */
		public static const MATCH_JOIN_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoomBody.match_join_res", "matchJoinRes", (72 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.MatchJoinRes; });

		private var match_join_res$field:proto.cs.MatchJoinRes;

		public function clearMatchJoinRes():void {
			match_join_res$field = null;
		}

		public function get hasMatchJoinRes():Boolean {
			return match_join_res$field != null;
		}

		public function set matchJoinRes(value:proto.cs.MatchJoinRes):void {
			match_join_res$field = value;
		}

		public function get matchJoinRes():proto.cs.MatchJoinRes {
			return match_join_res$field;
		}

		/**
		 *  @private
		 */
		public static const CHECK_CODE_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoomBody.check_code_ntf", "checkCodeNtf", (80 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.CheckCodeNtf; });

		private var check_code_ntf$field:proto.cs.CheckCodeNtf;

		public function clearCheckCodeNtf():void {
			check_code_ntf$field = null;
		}

		public function get hasCheckCodeNtf():Boolean {
			return check_code_ntf$field != null;
		}

		public function set checkCodeNtf(value:proto.cs.CheckCodeNtf):void {
			check_code_ntf$field = value;
		}

		public function get checkCodeNtf():proto.cs.CheckCodeNtf {
			return check_code_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const RECONNECT_PVP_ING_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoomBody.reconnect_pvp_ing_ntf", "reconnectPvpIngNtf", (81 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ReconnectPvpIngNtf; });

		private var reconnect_pvp_ing_ntf$field:proto.cs.ReconnectPvpIngNtf;

		public function clearReconnectPvpIngNtf():void {
			reconnect_pvp_ing_ntf$field = null;
		}

		public function get hasReconnectPvpIngNtf():Boolean {
			return reconnect_pvp_ing_ntf$field != null;
		}

		public function set reconnectPvpIngNtf(value:proto.cs.ReconnectPvpIngNtf):void {
			reconnect_pvp_ing_ntf$field = value;
		}

		public function get reconnectPvpIngNtf():proto.cs.ReconnectPvpIngNtf {
			return reconnect_pvp_ing_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const CLIENT_SELF_OPERATION_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoomBody.client_self_operation_req", "clientSelfOperationReq", (82 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ClientSelfOperationReq; });

		private var client_self_operation_req$field:proto.cs.ClientSelfOperationReq;

		public function clearClientSelfOperationReq():void {
			client_self_operation_req$field = null;
		}

		public function get hasClientSelfOperationReq():Boolean {
			return client_self_operation_req$field != null;
		}

		public function set clientSelfOperationReq(value:proto.cs.ClientSelfOperationReq):void {
			client_self_operation_req$field = value;
		}

		public function get clientSelfOperationReq():proto.cs.ClientSelfOperationReq {
			return client_self_operation_req$field;
		}

		/**
		 *  @private
		 */
		public static const CLIENT_SELF_OPERATION_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.RoomBody.client_self_operation_ntf", "clientSelfOperationNtf", (83 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ClientSelfOperationReq; });

		private var client_self_operation_ntf$field:proto.cs.ClientSelfOperationReq;

		public function clearClientSelfOperationNtf():void {
			client_self_operation_ntf$field = null;
		}

		public function get hasClientSelfOperationNtf():Boolean {
			return client_self_operation_ntf$field != null;
		}

		public function set clientSelfOperationNtf(value:proto.cs.ClientSelfOperationReq):void {
			client_self_operation_ntf$field = value;
		}

		public function get clientSelfOperationNtf():proto.cs.ClientSelfOperationReq {
			return client_self_operation_ntf$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCreateRoomReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, create_room_req$field);
			}
			if (hasCreateRoomRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, create_room_res$field);
			}
			if (hasFindRoomReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, find_room_req$field);
			}
			if (hasFindRoomRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, find_room_res$field);
			}
			if (hasModifyRoomParamReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, modify_room_param_req$field);
			}
			if (hasModifyRoomParamNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, modify_room_param_ntf$field);
			}
			if (hasJoinRoomReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 19);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, join_room_req$field);
			}
			if (hasJoinRoomRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 20);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, join_room_res$field);
			}
			if (hasJoinRoomNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 21);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, join_room_ntf$field);
			}
			if (hasQuitRoomNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 23);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, quit_room_ntf$field);
			}
			if (hasKickRoomReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 24);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, kick_room_req$field);
			}
			if (hasKickRoomNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 26);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, kick_room_ntf$field);
			}
			if (hasSetChairStateReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 27);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, set_chair_state_req$field);
			}
			if (hasSetChairStateNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 28);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, set_chair_state_ntf$field);
			}
			if (hasReadyMatchReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 29);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, ready_match_req$field);
			}
			if (hasReadyMatchNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 31);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, ready_match_ntf$field);
			}
			if (hasStartMatchNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 38);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, start_match_ntf$field);
			}
			if (hasQuickJoinRoomReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 42);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, quick_join_room_req$field);
			}
			if (hasSelectCampReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 43);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, select_camp_req$field);
			}
			if (hasSelectCampRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 44);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, select_camp_res$field);
			}
			if (hasSelectCampNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 45);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, select_camp_ntf$field);
			}
			if (hasMatchJoinReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 71);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, match_join_req$field);
			}
			if (hasMatchJoinRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 72);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, match_join_res$field);
			}
			if (hasCheckCodeNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 80);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, check_code_ntf$field);
			}
			if (hasReconnectPvpIngNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 81);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, reconnect_pvp_ing_ntf$field);
			}
			if (hasClientSelfOperationReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 82);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, client_self_operation_req$field);
			}
			if (hasClientSelfOperationNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 83);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, client_self_operation_ntf$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var create_room_req$count:uint = 0;
			var create_room_res$count:uint = 0;
			var find_room_req$count:uint = 0;
			var find_room_res$count:uint = 0;
			var modify_room_param_req$count:uint = 0;
			var modify_room_param_ntf$count:uint = 0;
			var join_room_req$count:uint = 0;
			var join_room_res$count:uint = 0;
			var join_room_ntf$count:uint = 0;
			var quit_room_ntf$count:uint = 0;
			var kick_room_req$count:uint = 0;
			var kick_room_ntf$count:uint = 0;
			var set_chair_state_req$count:uint = 0;
			var set_chair_state_ntf$count:uint = 0;
			var ready_match_req$count:uint = 0;
			var ready_match_ntf$count:uint = 0;
			var start_match_ntf$count:uint = 0;
			var quick_join_room_req$count:uint = 0;
			var select_camp_req$count:uint = 0;
			var select_camp_res$count:uint = 0;
			var select_camp_ntf$count:uint = 0;
			var match_join_req$count:uint = 0;
			var match_join_res$count:uint = 0;
			var check_code_ntf$count:uint = 0;
			var reconnect_pvp_ing_ntf$count:uint = 0;
			var client_self_operation_req$count:uint = 0;
			var client_self_operation_ntf$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (create_room_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBody.createRoomReq cannot be set twice.');
					}
					++create_room_req$count;
					this.createRoomReq = new proto.cs.CreateRoomReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.createRoomReq);
					break;
				case 2:
					if (create_room_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBody.createRoomRes cannot be set twice.');
					}
					++create_room_res$count;
					this.createRoomRes = new proto.cs.CreateRoomRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.createRoomRes);
					break;
				case 8:
					if (find_room_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBody.findRoomReq cannot be set twice.');
					}
					++find_room_req$count;
					this.findRoomReq = new proto.cs.FindRoomReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.findRoomReq);
					break;
				case 9:
					if (find_room_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBody.findRoomRes cannot be set twice.');
					}
					++find_room_res$count;
					this.findRoomRes = new proto.cs.FindRoomRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.findRoomRes);
					break;
				case 10:
					if (modify_room_param_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBody.modifyRoomParamReq cannot be set twice.');
					}
					++modify_room_param_req$count;
					this.modifyRoomParamReq = new proto.cs.ModifyRoomParamReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.modifyRoomParamReq);
					break;
				case 11:
					if (modify_room_param_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBody.modifyRoomParamNtf cannot be set twice.');
					}
					++modify_room_param_ntf$count;
					this.modifyRoomParamNtf = new proto.cs.ModifyRoomParamNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.modifyRoomParamNtf);
					break;
				case 19:
					if (join_room_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBody.joinRoomReq cannot be set twice.');
					}
					++join_room_req$count;
					this.joinRoomReq = new proto.cs.JoinRoomReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.joinRoomReq);
					break;
				case 20:
					if (join_room_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBody.joinRoomRes cannot be set twice.');
					}
					++join_room_res$count;
					this.joinRoomRes = new proto.cs.JoinRoomRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.joinRoomRes);
					break;
				case 21:
					if (join_room_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBody.joinRoomNtf cannot be set twice.');
					}
					++join_room_ntf$count;
					this.joinRoomNtf = new proto.cs.JoinRoomNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.joinRoomNtf);
					break;
				case 23:
					if (quit_room_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBody.quitRoomNtf cannot be set twice.');
					}
					++quit_room_ntf$count;
					this.quitRoomNtf = new proto.cs.QuitRoomNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.quitRoomNtf);
					break;
				case 24:
					if (kick_room_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBody.kickRoomReq cannot be set twice.');
					}
					++kick_room_req$count;
					this.kickRoomReq = new proto.cs.KickRoomReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.kickRoomReq);
					break;
				case 26:
					if (kick_room_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBody.kickRoomNtf cannot be set twice.');
					}
					++kick_room_ntf$count;
					this.kickRoomNtf = new proto.cs.KickRoomNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.kickRoomNtf);
					break;
				case 27:
					if (set_chair_state_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBody.setChairStateReq cannot be set twice.');
					}
					++set_chair_state_req$count;
					this.setChairStateReq = new proto.cs.SetChairStateReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.setChairStateReq);
					break;
				case 28:
					if (set_chair_state_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBody.setChairStateNtf cannot be set twice.');
					}
					++set_chair_state_ntf$count;
					this.setChairStateNtf = new proto.cs.SetChairStateNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.setChairStateNtf);
					break;
				case 29:
					if (ready_match_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBody.readyMatchReq cannot be set twice.');
					}
					++ready_match_req$count;
					this.readyMatchReq = new proto.cs.ReadyMatchReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.readyMatchReq);
					break;
				case 31:
					if (ready_match_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBody.readyMatchNtf cannot be set twice.');
					}
					++ready_match_ntf$count;
					this.readyMatchNtf = new proto.cs.ReadyMatchNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.readyMatchNtf);
					break;
				case 38:
					if (start_match_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBody.startMatchNtf cannot be set twice.');
					}
					++start_match_ntf$count;
					this.startMatchNtf = new proto.cs.StartMatchNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.startMatchNtf);
					break;
				case 42:
					if (quick_join_room_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBody.quickJoinRoomReq cannot be set twice.');
					}
					++quick_join_room_req$count;
					this.quickJoinRoomReq = new proto.cs.QuickJoinRoomReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.quickJoinRoomReq);
					break;
				case 43:
					if (select_camp_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBody.selectCampReq cannot be set twice.');
					}
					++select_camp_req$count;
					this.selectCampReq = new proto.cs.SelectCampReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.selectCampReq);
					break;
				case 44:
					if (select_camp_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBody.selectCampRes cannot be set twice.');
					}
					++select_camp_res$count;
					this.selectCampRes = new proto.cs.SelectCampRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.selectCampRes);
					break;
				case 45:
					if (select_camp_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBody.selectCampNtf cannot be set twice.');
					}
					++select_camp_ntf$count;
					this.selectCampNtf = new proto.cs.SelectCampNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.selectCampNtf);
					break;
				case 71:
					if (match_join_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBody.matchJoinReq cannot be set twice.');
					}
					++match_join_req$count;
					this.matchJoinReq = new proto.cs.MatchJoinReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.matchJoinReq);
					break;
				case 72:
					if (match_join_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBody.matchJoinRes cannot be set twice.');
					}
					++match_join_res$count;
					this.matchJoinRes = new proto.cs.MatchJoinRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.matchJoinRes);
					break;
				case 80:
					if (check_code_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBody.checkCodeNtf cannot be set twice.');
					}
					++check_code_ntf$count;
					this.checkCodeNtf = new proto.cs.CheckCodeNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.checkCodeNtf);
					break;
				case 81:
					if (reconnect_pvp_ing_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBody.reconnectPvpIngNtf cannot be set twice.');
					}
					++reconnect_pvp_ing_ntf$count;
					this.reconnectPvpIngNtf = new proto.cs.ReconnectPvpIngNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.reconnectPvpIngNtf);
					break;
				case 82:
					if (client_self_operation_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBody.clientSelfOperationReq cannot be set twice.');
					}
					++client_self_operation_req$count;
					this.clientSelfOperationReq = new proto.cs.ClientSelfOperationReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.clientSelfOperationReq);
					break;
				case 83:
					if (client_self_operation_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBody.clientSelfOperationNtf cannot be set twice.');
					}
					++client_self_operation_ntf$count;
					this.clientSelfOperationNtf = new proto.cs.ClientSelfOperationReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.clientSelfOperationNtf);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
