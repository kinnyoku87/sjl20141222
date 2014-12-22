package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.cs.MailDelReq;
	import proto.cs.BlessRes;
	import proto.cs.SingleMailReadReq;
	import proto.cs.InviteFriendReq;
	import proto.cs.SingleMailReadRes;
	import proto.cs.GivingLargessGetReq;
	import proto.cs.BlessReq;
	import proto.cs.GivingLargessGetRes;
	import proto.cs.ObscureFindReq;
	import proto.cs.ObscureFindRes;
	import proto.cs.MailItemExtraReq;
	import proto.cs.MailMoneyExtraReq;
	import proto.cs.DeleteFriendNtf;
	import proto.cs.ChangeFriendTypeReq;
	import proto.cs.WishGatherRes;
	import proto.cs.DeleteFriendReq;
	import proto.cs.GetFriendRes;
	import proto.cs.ChangeFriendTypeRes;
	import proto.cs.WishInfoNtf;
	import proto.cs.DeleteFriendRes;
	import proto.cs.WishInfoReq;
	import proto.cs.MailSendReq;
	import proto.cs.InviteFriendNtf;
	import proto.cs.GetFriendReq;
	import proto.cs.EditNoteNameReq;
	import proto.cs.MailRevNtf;
	import proto.cs.InviteFriendRes;
	import proto.cs.GivingLargessNtf;
	import proto.cs.RankInfoRes;
	import proto.cs.FriendActivityStateNtf;
	import proto.cs.RankInfoReq;
	import proto.cs.AcceptFriendNtf;
	import proto.cs.RecommendFriendsReq;
	import proto.cs.WishReq;
	import proto.cs.RecommendFriendsRes;
	import proto.cs.MailListReadRes;
	import proto.cs.GivingLargessReq;
	import proto.cs.AcceptFriendReq;
	import proto.cs.GivingLargessRes;
	import proto.cs.GivingInfoRes;
	import proto.cs.AcceptFriendRes;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class FriendBody extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GET_FRIEND_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.get_friend_req", "getFriendReq", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.GetFriendReq; });

		private var get_friend_req$field:proto.cs.GetFriendReq;

		public function clearGetFriendReq():void {
			get_friend_req$field = null;
		}

		public function get hasGetFriendReq():Boolean {
			return get_friend_req$field != null;
		}

		public function set getFriendReq(value:proto.cs.GetFriendReq):void {
			get_friend_req$field = value;
		}

		public function get getFriendReq():proto.cs.GetFriendReq {
			return get_friend_req$field;
		}

		/**
		 *  @private
		 */
		public static const GET_FRIEND_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.get_friend_res", "getFriendRes", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.GetFriendRes; });

		private var get_friend_res$field:proto.cs.GetFriendRes;

		public function clearGetFriendRes():void {
			get_friend_res$field = null;
		}

		public function get hasGetFriendRes():Boolean {
			return get_friend_res$field != null;
		}

		public function set getFriendRes(value:proto.cs.GetFriendRes):void {
			get_friend_res$field = value;
		}

		public function get getFriendRes():proto.cs.GetFriendRes {
			return get_friend_res$field;
		}

		/**
		 *  @private
		 */
		public static const OBSCURE_FIND_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.obscure_find_req", "obscureFindReq", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ObscureFindReq; });

		private var obscure_find_req$field:proto.cs.ObscureFindReq;

		public function clearObscureFindReq():void {
			obscure_find_req$field = null;
		}

		public function get hasObscureFindReq():Boolean {
			return obscure_find_req$field != null;
		}

		public function set obscureFindReq(value:proto.cs.ObscureFindReq):void {
			obscure_find_req$field = value;
		}

		public function get obscureFindReq():proto.cs.ObscureFindReq {
			return obscure_find_req$field;
		}

		/**
		 *  @private
		 */
		public static const OBSCURE_FIND_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.obscure_find_res", "obscureFindRes", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ObscureFindRes; });

		private var obscure_find_res$field:proto.cs.ObscureFindRes;

		public function clearObscureFindRes():void {
			obscure_find_res$field = null;
		}

		public function get hasObscureFindRes():Boolean {
			return obscure_find_res$field != null;
		}

		public function set obscureFindRes(value:proto.cs.ObscureFindRes):void {
			obscure_find_res$field = value;
		}

		public function get obscureFindRes():proto.cs.ObscureFindRes {
			return obscure_find_res$field;
		}

		/**
		 *  @private
		 */
		public static const INVITE_FRIEND_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.invite_friend_req", "inviteFriendReq", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.InviteFriendReq; });

		private var invite_friend_req$field:proto.cs.InviteFriendReq;

		public function clearInviteFriendReq():void {
			invite_friend_req$field = null;
		}

		public function get hasInviteFriendReq():Boolean {
			return invite_friend_req$field != null;
		}

		public function set inviteFriendReq(value:proto.cs.InviteFriendReq):void {
			invite_friend_req$field = value;
		}

		public function get inviteFriendReq():proto.cs.InviteFriendReq {
			return invite_friend_req$field;
		}

		/**
		 *  @private
		 */
		public static const INVITE_FRIEND_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.invite_friend_res", "inviteFriendRes", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.InviteFriendRes; });

		private var invite_friend_res$field:proto.cs.InviteFriendRes;

		public function clearInviteFriendRes():void {
			invite_friend_res$field = null;
		}

		public function get hasInviteFriendRes():Boolean {
			return invite_friend_res$field != null;
		}

		public function set inviteFriendRes(value:proto.cs.InviteFriendRes):void {
			invite_friend_res$field = value;
		}

		public function get inviteFriendRes():proto.cs.InviteFriendRes {
			return invite_friend_res$field;
		}

		/**
		 *  @private
		 */
		public static const INVITE_FRIEND_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.invite_friend_ntf", "inviteFriendNtf", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.InviteFriendNtf; });

		private var invite_friend_ntf$field:proto.cs.InviteFriendNtf;

		public function clearInviteFriendNtf():void {
			invite_friend_ntf$field = null;
		}

		public function get hasInviteFriendNtf():Boolean {
			return invite_friend_ntf$field != null;
		}

		public function set inviteFriendNtf(value:proto.cs.InviteFriendNtf):void {
			invite_friend_ntf$field = value;
		}

		public function get inviteFriendNtf():proto.cs.InviteFriendNtf {
			return invite_friend_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const ACCEPT_FRIEND_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.accept_friend_req", "acceptFriendReq", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.AcceptFriendReq; });

		private var accept_friend_req$field:proto.cs.AcceptFriendReq;

		public function clearAcceptFriendReq():void {
			accept_friend_req$field = null;
		}

		public function get hasAcceptFriendReq():Boolean {
			return accept_friend_req$field != null;
		}

		public function set acceptFriendReq(value:proto.cs.AcceptFriendReq):void {
			accept_friend_req$field = value;
		}

		public function get acceptFriendReq():proto.cs.AcceptFriendReq {
			return accept_friend_req$field;
		}

		/**
		 *  @private
		 */
		public static const ACCEPT_FRIEND_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.accept_friend_res", "acceptFriendRes", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.AcceptFriendRes; });

		private var accept_friend_res$field:proto.cs.AcceptFriendRes;

		public function clearAcceptFriendRes():void {
			accept_friend_res$field = null;
		}

		public function get hasAcceptFriendRes():Boolean {
			return accept_friend_res$field != null;
		}

		public function set acceptFriendRes(value:proto.cs.AcceptFriendRes):void {
			accept_friend_res$field = value;
		}

		public function get acceptFriendRes():proto.cs.AcceptFriendRes {
			return accept_friend_res$field;
		}

		/**
		 *  @private
		 */
		public static const ACCEPT_FRIEND_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.accept_friend_ntf", "acceptFriendNtf", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.AcceptFriendNtf; });

		private var accept_friend_ntf$field:proto.cs.AcceptFriendNtf;

		public function clearAcceptFriendNtf():void {
			accept_friend_ntf$field = null;
		}

		public function get hasAcceptFriendNtf():Boolean {
			return accept_friend_ntf$field != null;
		}

		public function set acceptFriendNtf(value:proto.cs.AcceptFriendNtf):void {
			accept_friend_ntf$field = value;
		}

		public function get acceptFriendNtf():proto.cs.AcceptFriendNtf {
			return accept_friend_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const DELETE_FRIEND_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.delete_friend_req", "deleteFriendReq", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.DeleteFriendReq; });

		private var delete_friend_req$field:proto.cs.DeleteFriendReq;

		public function clearDeleteFriendReq():void {
			delete_friend_req$field = null;
		}

		public function get hasDeleteFriendReq():Boolean {
			return delete_friend_req$field != null;
		}

		public function set deleteFriendReq(value:proto.cs.DeleteFriendReq):void {
			delete_friend_req$field = value;
		}

		public function get deleteFriendReq():proto.cs.DeleteFriendReq {
			return delete_friend_req$field;
		}

		/**
		 *  @private
		 */
		public static const DELETE_FRIEND_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.delete_friend_res", "deleteFriendRes", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.DeleteFriendRes; });

		private var delete_friend_res$field:proto.cs.DeleteFriendRes;

		public function clearDeleteFriendRes():void {
			delete_friend_res$field = null;
		}

		public function get hasDeleteFriendRes():Boolean {
			return delete_friend_res$field != null;
		}

		public function set deleteFriendRes(value:proto.cs.DeleteFriendRes):void {
			delete_friend_res$field = value;
		}

		public function get deleteFriendRes():proto.cs.DeleteFriendRes {
			return delete_friend_res$field;
		}

		/**
		 *  @private
		 */
		public static const DELETE_FRIEND_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.delete_friend_ntf", "deleteFriendNtf", (13 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.DeleteFriendNtf; });

		private var delete_friend_ntf$field:proto.cs.DeleteFriendNtf;

		public function clearDeleteFriendNtf():void {
			delete_friend_ntf$field = null;
		}

		public function get hasDeleteFriendNtf():Boolean {
			return delete_friend_ntf$field != null;
		}

		public function set deleteFriendNtf(value:proto.cs.DeleteFriendNtf):void {
			delete_friend_ntf$field = value;
		}

		public function get deleteFriendNtf():proto.cs.DeleteFriendNtf {
			return delete_friend_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const CHANGE_FRIEND_TYPE_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.change_friend_type_req", "changeFriendTypeReq", (14 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ChangeFriendTypeReq; });

		private var change_friend_type_req$field:proto.cs.ChangeFriendTypeReq;

		public function clearChangeFriendTypeReq():void {
			change_friend_type_req$field = null;
		}

		public function get hasChangeFriendTypeReq():Boolean {
			return change_friend_type_req$field != null;
		}

		public function set changeFriendTypeReq(value:proto.cs.ChangeFriendTypeReq):void {
			change_friend_type_req$field = value;
		}

		public function get changeFriendTypeReq():proto.cs.ChangeFriendTypeReq {
			return change_friend_type_req$field;
		}

		/**
		 *  @private
		 */
		public static const CHANGE_FRIEND_TYPE_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.change_friend_type_res", "changeFriendTypeRes", (15 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ChangeFriendTypeRes; });

		private var change_friend_type_res$field:proto.cs.ChangeFriendTypeRes;

		public function clearChangeFriendTypeRes():void {
			change_friend_type_res$field = null;
		}

		public function get hasChangeFriendTypeRes():Boolean {
			return change_friend_type_res$field != null;
		}

		public function set changeFriendTypeRes(value:proto.cs.ChangeFriendTypeRes):void {
			change_friend_type_res$field = value;
		}

		public function get changeFriendTypeRes():proto.cs.ChangeFriendTypeRes {
			return change_friend_type_res$field;
		}

		/**
		 *  @private
		 */
		public static const EDIT_NOTE_NAME_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.edit_note_name_req", "editNoteNameReq", (16 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.EditNoteNameReq; });

		private var edit_note_name_req$field:proto.cs.EditNoteNameReq;

		public function clearEditNoteNameReq():void {
			edit_note_name_req$field = null;
		}

		public function get hasEditNoteNameReq():Boolean {
			return edit_note_name_req$field != null;
		}

		public function set editNoteNameReq(value:proto.cs.EditNoteNameReq):void {
			edit_note_name_req$field = value;
		}

		public function get editNoteNameReq():proto.cs.EditNoteNameReq {
			return edit_note_name_req$field;
		}

		/**
		 *  @private
		 */
		public static const RECOMMEND_FRIENDS_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.recommend_friends_req", "recommendFriendsReq", (18 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.RecommendFriendsReq; });

		private var recommend_friends_req$field:proto.cs.RecommendFriendsReq;

		public function clearRecommendFriendsReq():void {
			recommend_friends_req$field = null;
		}

		public function get hasRecommendFriendsReq():Boolean {
			return recommend_friends_req$field != null;
		}

		public function set recommendFriendsReq(value:proto.cs.RecommendFriendsReq):void {
			recommend_friends_req$field = value;
		}

		public function get recommendFriendsReq():proto.cs.RecommendFriendsReq {
			return recommend_friends_req$field;
		}

		/**
		 *  @private
		 */
		public static const RECOMMEND_FRIENDS_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.recommend_friends_res", "recommendFriendsRes", (19 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.RecommendFriendsRes; });

		private var recommend_friends_res$field:proto.cs.RecommendFriendsRes;

		public function clearRecommendFriendsRes():void {
			recommend_friends_res$field = null;
		}

		public function get hasRecommendFriendsRes():Boolean {
			return recommend_friends_res$field != null;
		}

		public function set recommendFriendsRes(value:proto.cs.RecommendFriendsRes):void {
			recommend_friends_res$field = value;
		}

		public function get recommendFriendsRes():proto.cs.RecommendFriendsRes {
			return recommend_friends_res$field;
		}

		/**
		 *  @private
		 */
		public static const FRIEND_ACTIVITY_STATE_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.friend_activity_state_ntf", "friendActivityStateNtf", (44 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.FriendActivityStateNtf; });

		private var friend_activity_state_ntf$field:proto.cs.FriendActivityStateNtf;

		public function clearFriendActivityStateNtf():void {
			friend_activity_state_ntf$field = null;
		}

		public function get hasFriendActivityStateNtf():Boolean {
			return friend_activity_state_ntf$field != null;
		}

		public function set friendActivityStateNtf(value:proto.cs.FriendActivityStateNtf):void {
			friend_activity_state_ntf$field = value;
		}

		public function get friendActivityStateNtf():proto.cs.FriendActivityStateNtf {
			return friend_activity_state_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const WISH_INFO_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.wish_info_req", "wishInfoReq", (47 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.WishInfoReq; });

		private var wish_info_req$field:proto.cs.WishInfoReq;

		public function clearWishInfoReq():void {
			wish_info_req$field = null;
		}

		public function get hasWishInfoReq():Boolean {
			return wish_info_req$field != null;
		}

		public function set wishInfoReq(value:proto.cs.WishInfoReq):void {
			wish_info_req$field = value;
		}

		public function get wishInfoReq():proto.cs.WishInfoReq {
			return wish_info_req$field;
		}

		/**
		 *  @private
		 */
		public static const WISH_INFO_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.wish_info_ntf", "wishInfoNtf", (48 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.WishInfoNtf; });

		private var wish_info_ntf$field:proto.cs.WishInfoNtf;

		public function clearWishInfoNtf():void {
			wish_info_ntf$field = null;
		}

		public function get hasWishInfoNtf():Boolean {
			return wish_info_ntf$field != null;
		}

		public function set wishInfoNtf(value:proto.cs.WishInfoNtf):void {
			wish_info_ntf$field = value;
		}

		public function get wishInfoNtf():proto.cs.WishInfoNtf {
			return wish_info_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const WISH_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.wish_req", "wishReq", (49 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.WishReq; });

		private var wish_req$field:proto.cs.WishReq;

		public function clearWishReq():void {
			wish_req$field = null;
		}

		public function get hasWishReq():Boolean {
			return wish_req$field != null;
		}

		public function set wishReq(value:proto.cs.WishReq):void {
			wish_req$field = value;
		}

		public function get wishReq():proto.cs.WishReq {
			return wish_req$field;
		}

		/**
		 *  @private
		 */
		public static const BLESS_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.bless_req", "blessReq", (50 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.BlessReq; });

		private var bless_req$field:proto.cs.BlessReq;

		public function clearBlessReq():void {
			bless_req$field = null;
		}

		public function get hasBlessReq():Boolean {
			return bless_req$field != null;
		}

		public function set blessReq(value:proto.cs.BlessReq):void {
			bless_req$field = value;
		}

		public function get blessReq():proto.cs.BlessReq {
			return bless_req$field;
		}

		/**
		 *  @private
		 */
		public static const BLESS_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.bless_res", "blessRes", (51 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.BlessRes; });

		private var bless_res$field:proto.cs.BlessRes;

		public function clearBlessRes():void {
			bless_res$field = null;
		}

		public function get hasBlessRes():Boolean {
			return bless_res$field != null;
		}

		public function set blessRes(value:proto.cs.BlessRes):void {
			bless_res$field = value;
		}

		public function get blessRes():proto.cs.BlessRes {
			return bless_res$field;
		}

		/**
		 *  @private
		 */
		public static const WISH_GATHER_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.wish_gather_res", "wishGatherRes", (52 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.WishGatherRes; });

		private var wish_gather_res$field:proto.cs.WishGatherRes;

		public function clearWishGatherRes():void {
			wish_gather_res$field = null;
		}

		public function get hasWishGatherRes():Boolean {
			return wish_gather_res$field != null;
		}

		public function set wishGatherRes(value:proto.cs.WishGatherRes):void {
			wish_gather_res$field = value;
		}

		public function get wishGatherRes():proto.cs.WishGatherRes {
			return wish_gather_res$field;
		}

		/**
		 *  @private
		 */
		public static const GIVING_INFO_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.giving_info_res", "givingInfoRes", (53 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.GivingInfoRes; });

		private var giving_info_res$field:proto.cs.GivingInfoRes;

		public function clearGivingInfoRes():void {
			giving_info_res$field = null;
		}

		public function get hasGivingInfoRes():Boolean {
			return giving_info_res$field != null;
		}

		public function set givingInfoRes(value:proto.cs.GivingInfoRes):void {
			giving_info_res$field = value;
		}

		public function get givingInfoRes():proto.cs.GivingInfoRes {
			return giving_info_res$field;
		}

		/**
		 *  @private
		 */
		public static const GIVING_LARGESS_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.giving_largess_req", "givingLargessReq", (60 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.GivingLargessReq; });

		private var giving_largess_req$field:proto.cs.GivingLargessReq;

		public function clearGivingLargessReq():void {
			giving_largess_req$field = null;
		}

		public function get hasGivingLargessReq():Boolean {
			return giving_largess_req$field != null;
		}

		public function set givingLargessReq(value:proto.cs.GivingLargessReq):void {
			giving_largess_req$field = value;
		}

		public function get givingLargessReq():proto.cs.GivingLargessReq {
			return giving_largess_req$field;
		}

		/**
		 *  @private
		 */
		public static const GIVING_LARGESS_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.giving_largess_res", "givingLargessRes", (61 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.GivingLargessRes; });

		private var giving_largess_res$field:proto.cs.GivingLargessRes;

		public function clearGivingLargessRes():void {
			giving_largess_res$field = null;
		}

		public function get hasGivingLargessRes():Boolean {
			return giving_largess_res$field != null;
		}

		public function set givingLargessRes(value:proto.cs.GivingLargessRes):void {
			giving_largess_res$field = value;
		}

		public function get givingLargessRes():proto.cs.GivingLargessRes {
			return giving_largess_res$field;
		}

		/**
		 *  @private
		 */
		public static const GIVING_LARGESS_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.giving_largess_ntf", "givingLargessNtf", (62 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.GivingLargessNtf; });

		private var giving_largess_ntf$field:proto.cs.GivingLargessNtf;

		public function clearGivingLargessNtf():void {
			giving_largess_ntf$field = null;
		}

		public function get hasGivingLargessNtf():Boolean {
			return giving_largess_ntf$field != null;
		}

		public function set givingLargessNtf(value:proto.cs.GivingLargessNtf):void {
			giving_largess_ntf$field = value;
		}

		public function get givingLargessNtf():proto.cs.GivingLargessNtf {
			return giving_largess_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const GIVING_LARGESS_GET_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.giving_largess_get_req", "givingLargessGetReq", (63 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.GivingLargessGetReq; });

		private var giving_largess_get_req$field:proto.cs.GivingLargessGetReq;

		public function clearGivingLargessGetReq():void {
			giving_largess_get_req$field = null;
		}

		public function get hasGivingLargessGetReq():Boolean {
			return giving_largess_get_req$field != null;
		}

		public function set givingLargessGetReq(value:proto.cs.GivingLargessGetReq):void {
			giving_largess_get_req$field = value;
		}

		public function get givingLargessGetReq():proto.cs.GivingLargessGetReq {
			return giving_largess_get_req$field;
		}

		/**
		 *  @private
		 */
		public static const GIVING_LARGESS_GET_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.giving_largess_get_res", "givingLargessGetRes", (64 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.GivingLargessGetRes; });

		private var giving_largess_get_res$field:proto.cs.GivingLargessGetRes;

		public function clearGivingLargessGetRes():void {
			giving_largess_get_res$field = null;
		}

		public function get hasGivingLargessGetRes():Boolean {
			return giving_largess_get_res$field != null;
		}

		public function set givingLargessGetRes(value:proto.cs.GivingLargessGetRes):void {
			giving_largess_get_res$field = value;
		}

		public function get givingLargessGetRes():proto.cs.GivingLargessGetRes {
			return giving_largess_get_res$field;
		}

		/**
		 *  @private
		 */
		public static const RANK_INFO_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.rank_info_req", "rankInfoReq", (73 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.RankInfoReq; });

		private var rank_info_req$field:proto.cs.RankInfoReq;

		public function clearRankInfoReq():void {
			rank_info_req$field = null;
		}

		public function get hasRankInfoReq():Boolean {
			return rank_info_req$field != null;
		}

		public function set rankInfoReq(value:proto.cs.RankInfoReq):void {
			rank_info_req$field = value;
		}

		public function get rankInfoReq():proto.cs.RankInfoReq {
			return rank_info_req$field;
		}

		/**
		 *  @private
		 */
		public static const RANK_INFO_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.rank_info_res", "rankInfoRes", (74 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.RankInfoRes; });

		private var rank_info_res$field:proto.cs.RankInfoRes;

		public function clearRankInfoRes():void {
			rank_info_res$field = null;
		}

		public function get hasRankInfoRes():Boolean {
			return rank_info_res$field != null;
		}

		public function set rankInfoRes(value:proto.cs.RankInfoRes):void {
			rank_info_res$field = value;
		}

		public function get rankInfoRes():proto.cs.RankInfoRes {
			return rank_info_res$field;
		}

		/**
		 *  @private
		 */
		public static const MAIL_SEND_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.mail_send_req", "mailSendReq", (91 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.MailSendReq; });

		private var mail_send_req$field:proto.cs.MailSendReq;

		public function clearMailSendReq():void {
			mail_send_req$field = null;
		}

		public function get hasMailSendReq():Boolean {
			return mail_send_req$field != null;
		}

		public function set mailSendReq(value:proto.cs.MailSendReq):void {
			mail_send_req$field = value;
		}

		public function get mailSendReq():proto.cs.MailSendReq {
			return mail_send_req$field;
		}

		/**
		 *  @private
		 */
		public static const MAIL_REV_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.mail_rev_ntf", "mailRevNtf", (93 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.MailRevNtf; });

		private var mail_rev_ntf$field:proto.cs.MailRevNtf;

		public function clearMailRevNtf():void {
			mail_rev_ntf$field = null;
		}

		public function get hasMailRevNtf():Boolean {
			return mail_rev_ntf$field != null;
		}

		public function set mailRevNtf(value:proto.cs.MailRevNtf):void {
			mail_rev_ntf$field = value;
		}

		public function get mailRevNtf():proto.cs.MailRevNtf {
			return mail_rev_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const MAIL_LIST_READ_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.mail_list_read_res", "mailListReadRes", (95 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.MailListReadRes; });

		private var mail_list_read_res$field:proto.cs.MailListReadRes;

		public function clearMailListReadRes():void {
			mail_list_read_res$field = null;
		}

		public function get hasMailListReadRes():Boolean {
			return mail_list_read_res$field != null;
		}

		public function set mailListReadRes(value:proto.cs.MailListReadRes):void {
			mail_list_read_res$field = value;
		}

		public function get mailListReadRes():proto.cs.MailListReadRes {
			return mail_list_read_res$field;
		}

		/**
		 *  @private
		 */
		public static const SINGLE_MAIL_READ_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.single_mail_read_req", "singleMailReadReq", (96 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.SingleMailReadReq; });

		private var single_mail_read_req$field:proto.cs.SingleMailReadReq;

		public function clearSingleMailReadReq():void {
			single_mail_read_req$field = null;
		}

		public function get hasSingleMailReadReq():Boolean {
			return single_mail_read_req$field != null;
		}

		public function set singleMailReadReq(value:proto.cs.SingleMailReadReq):void {
			single_mail_read_req$field = value;
		}

		public function get singleMailReadReq():proto.cs.SingleMailReadReq {
			return single_mail_read_req$field;
		}

		/**
		 *  @private
		 */
		public static const SINGLE_MAIL_READ_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.single_mail_read_res", "singleMailReadRes", (97 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.SingleMailReadRes; });

		private var single_mail_read_res$field:proto.cs.SingleMailReadRes;

		public function clearSingleMailReadRes():void {
			single_mail_read_res$field = null;
		}

		public function get hasSingleMailReadRes():Boolean {
			return single_mail_read_res$field != null;
		}

		public function set singleMailReadRes(value:proto.cs.SingleMailReadRes):void {
			single_mail_read_res$field = value;
		}

		public function get singleMailReadRes():proto.cs.SingleMailReadRes {
			return single_mail_read_res$field;
		}

		/**
		 *  @private
		 */
		public static const MAIL_ITEM_EXTRA_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.mail_item_extra_req", "mailItemExtraReq", (98 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.MailItemExtraReq; });

		private var mail_item_extra_req$field:proto.cs.MailItemExtraReq;

		public function clearMailItemExtraReq():void {
			mail_item_extra_req$field = null;
		}

		public function get hasMailItemExtraReq():Boolean {
			return mail_item_extra_req$field != null;
		}

		public function set mailItemExtraReq(value:proto.cs.MailItemExtraReq):void {
			mail_item_extra_req$field = value;
		}

		public function get mailItemExtraReq():proto.cs.MailItemExtraReq {
			return mail_item_extra_req$field;
		}

		/**
		 *  @private
		 */
		public static const MAIL_MONEY_EXTRA_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.mail_money_extra_req", "mailMoneyExtraReq", (100 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.MailMoneyExtraReq; });

		private var mail_money_extra_req$field:proto.cs.MailMoneyExtraReq;

		public function clearMailMoneyExtraReq():void {
			mail_money_extra_req$field = null;
		}

		public function get hasMailMoneyExtraReq():Boolean {
			return mail_money_extra_req$field != null;
		}

		public function set mailMoneyExtraReq(value:proto.cs.MailMoneyExtraReq):void {
			mail_money_extra_req$field = value;
		}

		public function get mailMoneyExtraReq():proto.cs.MailMoneyExtraReq {
			return mail_money_extra_req$field;
		}

		/**
		 *  @private
		 */
		public static const MAIL_DEL_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.FriendBody.mail_del_req", "mailDelReq", (110 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.MailDelReq; });

		private var mail_del_req$field:proto.cs.MailDelReq;

		public function clearMailDelReq():void {
			mail_del_req$field = null;
		}

		public function get hasMailDelReq():Boolean {
			return mail_del_req$field != null;
		}

		public function set mailDelReq(value:proto.cs.MailDelReq):void {
			mail_del_req$field = value;
		}

		public function get mailDelReq():proto.cs.MailDelReq {
			return mail_del_req$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasGetFriendReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, get_friend_req$field);
			}
			if (hasGetFriendRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, get_friend_res$field);
			}
			if (hasObscureFindReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, obscure_find_req$field);
			}
			if (hasObscureFindRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, obscure_find_res$field);
			}
			if (hasInviteFriendReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, invite_friend_req$field);
			}
			if (hasInviteFriendRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, invite_friend_res$field);
			}
			if (hasInviteFriendNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, invite_friend_ntf$field);
			}
			if (hasAcceptFriendReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, accept_friend_req$field);
			}
			if (hasAcceptFriendRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, accept_friend_res$field);
			}
			if (hasAcceptFriendNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, accept_friend_ntf$field);
			}
			if (hasDeleteFriendReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, delete_friend_req$field);
			}
			if (hasDeleteFriendRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, delete_friend_res$field);
			}
			if (hasDeleteFriendNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, delete_friend_ntf$field);
			}
			if (hasChangeFriendTypeReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, change_friend_type_req$field);
			}
			if (hasChangeFriendTypeRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 15);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, change_friend_type_res$field);
			}
			if (hasEditNoteNameReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 16);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, edit_note_name_req$field);
			}
			if (hasRecommendFriendsReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 18);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, recommend_friends_req$field);
			}
			if (hasRecommendFriendsRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 19);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, recommend_friends_res$field);
			}
			if (hasFriendActivityStateNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 44);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, friend_activity_state_ntf$field);
			}
			if (hasWishInfoReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 47);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, wish_info_req$field);
			}
			if (hasWishInfoNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 48);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, wish_info_ntf$field);
			}
			if (hasWishReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 49);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, wish_req$field);
			}
			if (hasBlessReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 50);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, bless_req$field);
			}
			if (hasBlessRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 51);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, bless_res$field);
			}
			if (hasWishGatherRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 52);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, wish_gather_res$field);
			}
			if (hasGivingInfoRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 53);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, giving_info_res$field);
			}
			if (hasGivingLargessReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 60);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, giving_largess_req$field);
			}
			if (hasGivingLargessRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 61);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, giving_largess_res$field);
			}
			if (hasGivingLargessNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 62);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, giving_largess_ntf$field);
			}
			if (hasGivingLargessGetReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 63);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, giving_largess_get_req$field);
			}
			if (hasGivingLargessGetRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 64);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, giving_largess_get_res$field);
			}
			if (hasRankInfoReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 73);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, rank_info_req$field);
			}
			if (hasRankInfoRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 74);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, rank_info_res$field);
			}
			if (hasMailSendReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 91);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, mail_send_req$field);
			}
			if (hasMailRevNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 93);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, mail_rev_ntf$field);
			}
			if (hasMailListReadRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 95);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, mail_list_read_res$field);
			}
			if (hasSingleMailReadReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 96);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, single_mail_read_req$field);
			}
			if (hasSingleMailReadRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 97);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, single_mail_read_res$field);
			}
			if (hasMailItemExtraReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 98);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, mail_item_extra_req$field);
			}
			if (hasMailMoneyExtraReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 100);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, mail_money_extra_req$field);
			}
			if (hasMailDelReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 110);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, mail_del_req$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var get_friend_req$count:uint = 0;
			var get_friend_res$count:uint = 0;
			var obscure_find_req$count:uint = 0;
			var obscure_find_res$count:uint = 0;
			var invite_friend_req$count:uint = 0;
			var invite_friend_res$count:uint = 0;
			var invite_friend_ntf$count:uint = 0;
			var accept_friend_req$count:uint = 0;
			var accept_friend_res$count:uint = 0;
			var accept_friend_ntf$count:uint = 0;
			var delete_friend_req$count:uint = 0;
			var delete_friend_res$count:uint = 0;
			var delete_friend_ntf$count:uint = 0;
			var change_friend_type_req$count:uint = 0;
			var change_friend_type_res$count:uint = 0;
			var edit_note_name_req$count:uint = 0;
			var recommend_friends_req$count:uint = 0;
			var recommend_friends_res$count:uint = 0;
			var friend_activity_state_ntf$count:uint = 0;
			var wish_info_req$count:uint = 0;
			var wish_info_ntf$count:uint = 0;
			var wish_req$count:uint = 0;
			var bless_req$count:uint = 0;
			var bless_res$count:uint = 0;
			var wish_gather_res$count:uint = 0;
			var giving_info_res$count:uint = 0;
			var giving_largess_req$count:uint = 0;
			var giving_largess_res$count:uint = 0;
			var giving_largess_ntf$count:uint = 0;
			var giving_largess_get_req$count:uint = 0;
			var giving_largess_get_res$count:uint = 0;
			var rank_info_req$count:uint = 0;
			var rank_info_res$count:uint = 0;
			var mail_send_req$count:uint = 0;
			var mail_rev_ntf$count:uint = 0;
			var mail_list_read_res$count:uint = 0;
			var single_mail_read_req$count:uint = 0;
			var single_mail_read_res$count:uint = 0;
			var mail_item_extra_req$count:uint = 0;
			var mail_money_extra_req$count:uint = 0;
			var mail_del_req$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (get_friend_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.getFriendReq cannot be set twice.');
					}
					++get_friend_req$count;
					this.getFriendReq = new proto.cs.GetFriendReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.getFriendReq);
					break;
				case 2:
					if (get_friend_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.getFriendRes cannot be set twice.');
					}
					++get_friend_res$count;
					this.getFriendRes = new proto.cs.GetFriendRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.getFriendRes);
					break;
				case 3:
					if (obscure_find_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.obscureFindReq cannot be set twice.');
					}
					++obscure_find_req$count;
					this.obscureFindReq = new proto.cs.ObscureFindReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.obscureFindReq);
					break;
				case 4:
					if (obscure_find_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.obscureFindRes cannot be set twice.');
					}
					++obscure_find_res$count;
					this.obscureFindRes = new proto.cs.ObscureFindRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.obscureFindRes);
					break;
				case 5:
					if (invite_friend_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.inviteFriendReq cannot be set twice.');
					}
					++invite_friend_req$count;
					this.inviteFriendReq = new proto.cs.InviteFriendReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.inviteFriendReq);
					break;
				case 6:
					if (invite_friend_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.inviteFriendRes cannot be set twice.');
					}
					++invite_friend_res$count;
					this.inviteFriendRes = new proto.cs.InviteFriendRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.inviteFriendRes);
					break;
				case 7:
					if (invite_friend_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.inviteFriendNtf cannot be set twice.');
					}
					++invite_friend_ntf$count;
					this.inviteFriendNtf = new proto.cs.InviteFriendNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.inviteFriendNtf);
					break;
				case 8:
					if (accept_friend_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.acceptFriendReq cannot be set twice.');
					}
					++accept_friend_req$count;
					this.acceptFriendReq = new proto.cs.AcceptFriendReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.acceptFriendReq);
					break;
				case 9:
					if (accept_friend_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.acceptFriendRes cannot be set twice.');
					}
					++accept_friend_res$count;
					this.acceptFriendRes = new proto.cs.AcceptFriendRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.acceptFriendRes);
					break;
				case 10:
					if (accept_friend_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.acceptFriendNtf cannot be set twice.');
					}
					++accept_friend_ntf$count;
					this.acceptFriendNtf = new proto.cs.AcceptFriendNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.acceptFriendNtf);
					break;
				case 11:
					if (delete_friend_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.deleteFriendReq cannot be set twice.');
					}
					++delete_friend_req$count;
					this.deleteFriendReq = new proto.cs.DeleteFriendReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.deleteFriendReq);
					break;
				case 12:
					if (delete_friend_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.deleteFriendRes cannot be set twice.');
					}
					++delete_friend_res$count;
					this.deleteFriendRes = new proto.cs.DeleteFriendRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.deleteFriendRes);
					break;
				case 13:
					if (delete_friend_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.deleteFriendNtf cannot be set twice.');
					}
					++delete_friend_ntf$count;
					this.deleteFriendNtf = new proto.cs.DeleteFriendNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.deleteFriendNtf);
					break;
				case 14:
					if (change_friend_type_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.changeFriendTypeReq cannot be set twice.');
					}
					++change_friend_type_req$count;
					this.changeFriendTypeReq = new proto.cs.ChangeFriendTypeReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.changeFriendTypeReq);
					break;
				case 15:
					if (change_friend_type_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.changeFriendTypeRes cannot be set twice.');
					}
					++change_friend_type_res$count;
					this.changeFriendTypeRes = new proto.cs.ChangeFriendTypeRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.changeFriendTypeRes);
					break;
				case 16:
					if (edit_note_name_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.editNoteNameReq cannot be set twice.');
					}
					++edit_note_name_req$count;
					this.editNoteNameReq = new proto.cs.EditNoteNameReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.editNoteNameReq);
					break;
				case 18:
					if (recommend_friends_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.recommendFriendsReq cannot be set twice.');
					}
					++recommend_friends_req$count;
					this.recommendFriendsReq = new proto.cs.RecommendFriendsReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.recommendFriendsReq);
					break;
				case 19:
					if (recommend_friends_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.recommendFriendsRes cannot be set twice.');
					}
					++recommend_friends_res$count;
					this.recommendFriendsRes = new proto.cs.RecommendFriendsRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.recommendFriendsRes);
					break;
				case 44:
					if (friend_activity_state_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.friendActivityStateNtf cannot be set twice.');
					}
					++friend_activity_state_ntf$count;
					this.friendActivityStateNtf = new proto.cs.FriendActivityStateNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.friendActivityStateNtf);
					break;
				case 47:
					if (wish_info_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.wishInfoReq cannot be set twice.');
					}
					++wish_info_req$count;
					this.wishInfoReq = new proto.cs.WishInfoReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.wishInfoReq);
					break;
				case 48:
					if (wish_info_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.wishInfoNtf cannot be set twice.');
					}
					++wish_info_ntf$count;
					this.wishInfoNtf = new proto.cs.WishInfoNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.wishInfoNtf);
					break;
				case 49:
					if (wish_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.wishReq cannot be set twice.');
					}
					++wish_req$count;
					this.wishReq = new proto.cs.WishReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.wishReq);
					break;
				case 50:
					if (bless_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.blessReq cannot be set twice.');
					}
					++bless_req$count;
					this.blessReq = new proto.cs.BlessReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.blessReq);
					break;
				case 51:
					if (bless_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.blessRes cannot be set twice.');
					}
					++bless_res$count;
					this.blessRes = new proto.cs.BlessRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.blessRes);
					break;
				case 52:
					if (wish_gather_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.wishGatherRes cannot be set twice.');
					}
					++wish_gather_res$count;
					this.wishGatherRes = new proto.cs.WishGatherRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.wishGatherRes);
					break;
				case 53:
					if (giving_info_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.givingInfoRes cannot be set twice.');
					}
					++giving_info_res$count;
					this.givingInfoRes = new proto.cs.GivingInfoRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.givingInfoRes);
					break;
				case 60:
					if (giving_largess_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.givingLargessReq cannot be set twice.');
					}
					++giving_largess_req$count;
					this.givingLargessReq = new proto.cs.GivingLargessReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.givingLargessReq);
					break;
				case 61:
					if (giving_largess_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.givingLargessRes cannot be set twice.');
					}
					++giving_largess_res$count;
					this.givingLargessRes = new proto.cs.GivingLargessRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.givingLargessRes);
					break;
				case 62:
					if (giving_largess_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.givingLargessNtf cannot be set twice.');
					}
					++giving_largess_ntf$count;
					this.givingLargessNtf = new proto.cs.GivingLargessNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.givingLargessNtf);
					break;
				case 63:
					if (giving_largess_get_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.givingLargessGetReq cannot be set twice.');
					}
					++giving_largess_get_req$count;
					this.givingLargessGetReq = new proto.cs.GivingLargessGetReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.givingLargessGetReq);
					break;
				case 64:
					if (giving_largess_get_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.givingLargessGetRes cannot be set twice.');
					}
					++giving_largess_get_res$count;
					this.givingLargessGetRes = new proto.cs.GivingLargessGetRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.givingLargessGetRes);
					break;
				case 73:
					if (rank_info_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.rankInfoReq cannot be set twice.');
					}
					++rank_info_req$count;
					this.rankInfoReq = new proto.cs.RankInfoReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.rankInfoReq);
					break;
				case 74:
					if (rank_info_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.rankInfoRes cannot be set twice.');
					}
					++rank_info_res$count;
					this.rankInfoRes = new proto.cs.RankInfoRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.rankInfoRes);
					break;
				case 91:
					if (mail_send_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.mailSendReq cannot be set twice.');
					}
					++mail_send_req$count;
					this.mailSendReq = new proto.cs.MailSendReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.mailSendReq);
					break;
				case 93:
					if (mail_rev_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.mailRevNtf cannot be set twice.');
					}
					++mail_rev_ntf$count;
					this.mailRevNtf = new proto.cs.MailRevNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.mailRevNtf);
					break;
				case 95:
					if (mail_list_read_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.mailListReadRes cannot be set twice.');
					}
					++mail_list_read_res$count;
					this.mailListReadRes = new proto.cs.MailListReadRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.mailListReadRes);
					break;
				case 96:
					if (single_mail_read_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.singleMailReadReq cannot be set twice.');
					}
					++single_mail_read_req$count;
					this.singleMailReadReq = new proto.cs.SingleMailReadReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.singleMailReadReq);
					break;
				case 97:
					if (single_mail_read_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.singleMailReadRes cannot be set twice.');
					}
					++single_mail_read_res$count;
					this.singleMailReadRes = new proto.cs.SingleMailReadRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.singleMailReadRes);
					break;
				case 98:
					if (mail_item_extra_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.mailItemExtraReq cannot be set twice.');
					}
					++mail_item_extra_req$count;
					this.mailItemExtraReq = new proto.cs.MailItemExtraReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.mailItemExtraReq);
					break;
				case 100:
					if (mail_money_extra_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.mailMoneyExtraReq cannot be set twice.');
					}
					++mail_money_extra_req$count;
					this.mailMoneyExtraReq = new proto.cs.MailMoneyExtraReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.mailMoneyExtraReq);
					break;
				case 110:
					if (mail_del_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendBody.mailDelReq cannot be set twice.');
					}
					++mail_del_req$count;
					this.mailDelReq = new proto.cs.MailDelReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.mailDelReq);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
