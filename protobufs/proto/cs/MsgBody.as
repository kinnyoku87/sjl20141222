package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.cs.AuthBody;
	import proto.cs.RoomBody;
	import proto.cs.BattleBody;
	import proto.cs.ChatBody;
	import proto.cs.QuestBody;
	import proto.cs.RoleBody;
	import proto.cs.FriendBody;
	import proto.cs.ItemBody;
	import proto.cs.LoginBody;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class MsgBody extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RET:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.MsgBody.ret", "ret", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ret$field:int;

		private var hasField$0:uint = 0;

		public function clearRet():void {
			hasField$0 &= 0xfffffffe;
			ret$field = new int();
		}

		public function get hasRet():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set ret(value:int):void {
			hasField$0 |= 0x1;
			ret$field = value;
		}

		public function get ret():int {
			return ret$field;
		}

		/**
		 *  @private
		 */
		public static const AUTH_BODY:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.MsgBody.auth_body", "authBody", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.AuthBody; });

		private var auth_body$field:proto.cs.AuthBody;

		public function clearAuthBody():void {
			auth_body$field = null;
		}

		public function get hasAuthBody():Boolean {
			return auth_body$field != null;
		}

		public function set authBody(value:proto.cs.AuthBody):void {
			auth_body$field = value;
		}

		public function get authBody():proto.cs.AuthBody {
			return auth_body$field;
		}

		/**
		 *  @private
		 */
		public static const LOGIN_BODY:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.MsgBody.login_body", "loginBody", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.LoginBody; });

		private var login_body$field:proto.cs.LoginBody;

		public function clearLoginBody():void {
			login_body$field = null;
		}

		public function get hasLoginBody():Boolean {
			return login_body$field != null;
		}

		public function set loginBody(value:proto.cs.LoginBody):void {
			login_body$field = value;
		}

		public function get loginBody():proto.cs.LoginBody {
			return login_body$field;
		}

		/**
		 *  @private
		 */
		public static const ROLE_BODY:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.MsgBody.role_body", "roleBody", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.RoleBody; });

		private var role_body$field:proto.cs.RoleBody;

		public function clearRoleBody():void {
			role_body$field = null;
		}

		public function get hasRoleBody():Boolean {
			return role_body$field != null;
		}

		public function set roleBody(value:proto.cs.RoleBody):void {
			role_body$field = value;
		}

		public function get roleBody():proto.cs.RoleBody {
			return role_body$field;
		}

		/**
		 *  @private
		 */
		public static const BATTLE_BODY:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.MsgBody.battle_body", "battleBody", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.BattleBody; });

		private var battle_body$field:proto.cs.BattleBody;

		public function clearBattleBody():void {
			battle_body$field = null;
		}

		public function get hasBattleBody():Boolean {
			return battle_body$field != null;
		}

		public function set battleBody(value:proto.cs.BattleBody):void {
			battle_body$field = value;
		}

		public function get battleBody():proto.cs.BattleBody {
			return battle_body$field;
		}

		/**
		 *  @private
		 */
		public static const ITEM_BODY:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.MsgBody.item_body", "itemBody", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ItemBody; });

		private var item_body$field:proto.cs.ItemBody;

		public function clearItemBody():void {
			item_body$field = null;
		}

		public function get hasItemBody():Boolean {
			return item_body$field != null;
		}

		public function set itemBody(value:proto.cs.ItemBody):void {
			item_body$field = value;
		}

		public function get itemBody():proto.cs.ItemBody {
			return item_body$field;
		}

		/**
		 *  @private
		 */
		public static const QUEST_BODY:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.MsgBody.quest_body", "questBody", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.QuestBody; });

		private var quest_body$field:proto.cs.QuestBody;

		public function clearQuestBody():void {
			quest_body$field = null;
		}

		public function get hasQuestBody():Boolean {
			return quest_body$field != null;
		}

		public function set questBody(value:proto.cs.QuestBody):void {
			quest_body$field = value;
		}

		public function get questBody():proto.cs.QuestBody {
			return quest_body$field;
		}

		/**
		 *  @private
		 */
		public static const FRIEND_BODY:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.MsgBody.friend_body", "friendBody", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.FriendBody; });

		private var friend_body$field:proto.cs.FriendBody;

		public function clearFriendBody():void {
			friend_body$field = null;
		}

		public function get hasFriendBody():Boolean {
			return friend_body$field != null;
		}

		public function set friendBody(value:proto.cs.FriendBody):void {
			friend_body$field = value;
		}

		public function get friendBody():proto.cs.FriendBody {
			return friend_body$field;
		}

		/**
		 *  @private
		 */
		public static const ROOM_BODY:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.MsgBody.room_body", "roomBody", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.RoomBody; });

		private var room_body$field:proto.cs.RoomBody;

		public function clearRoomBody():void {
			room_body$field = null;
		}

		public function get hasRoomBody():Boolean {
			return room_body$field != null;
		}

		public function set roomBody(value:proto.cs.RoomBody):void {
			room_body$field = value;
		}

		public function get roomBody():proto.cs.RoomBody {
			return room_body$field;
		}

		/**
		 *  @private
		 */
		public static const CHAT_BODY:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.MsgBody.chat_body", "chatBody", (14 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ChatBody; });

		private var chat_body$field:proto.cs.ChatBody;

		public function clearChatBody():void {
			chat_body$field = null;
		}

		public function get hasChatBody():Boolean {
			return chat_body$field != null;
		}

		public function set chatBody(value:proto.cs.ChatBody):void {
			chat_body$field = value;
		}

		public function get chatBody():proto.cs.ChatBody {
			return chat_body$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRet) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, ret$field);
			}
			if (hasAuthBody) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, auth_body$field);
			}
			if (hasLoginBody) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, login_body$field);
			}
			if (hasRoleBody) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, role_body$field);
			}
			if (hasBattleBody) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, battle_body$field);
			}
			if (hasItemBody) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, item_body$field);
			}
			if (hasQuestBody) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, quest_body$field);
			}
			if (hasFriendBody) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, friend_body$field);
			}
			if (hasRoomBody) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, room_body$field);
			}
			if (hasChatBody) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, chat_body$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var ret$count:uint = 0;
			var auth_body$count:uint = 0;
			var login_body$count:uint = 0;
			var role_body$count:uint = 0;
			var battle_body$count:uint = 0;
			var item_body$count:uint = 0;
			var quest_body$count:uint = 0;
			var friend_body$count:uint = 0;
			var room_body$count:uint = 0;
			var chat_body$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (ret$count != 0) {
						throw new flash.errors.IOError('Bad data format: MsgBody.ret cannot be set twice.');
					}
					++ret$count;
					this.ret = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (auth_body$count != 0) {
						throw new flash.errors.IOError('Bad data format: MsgBody.authBody cannot be set twice.');
					}
					++auth_body$count;
					this.authBody = new proto.cs.AuthBody();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.authBody);
					break;
				case 3:
					if (login_body$count != 0) {
						throw new flash.errors.IOError('Bad data format: MsgBody.loginBody cannot be set twice.');
					}
					++login_body$count;
					this.loginBody = new proto.cs.LoginBody();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.loginBody);
					break;
				case 4:
					if (role_body$count != 0) {
						throw new flash.errors.IOError('Bad data format: MsgBody.roleBody cannot be set twice.');
					}
					++role_body$count;
					this.roleBody = new proto.cs.RoleBody();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.roleBody);
					break;
				case 6:
					if (battle_body$count != 0) {
						throw new flash.errors.IOError('Bad data format: MsgBody.battleBody cannot be set twice.');
					}
					++battle_body$count;
					this.battleBody = new proto.cs.BattleBody();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.battleBody);
					break;
				case 7:
					if (item_body$count != 0) {
						throw new flash.errors.IOError('Bad data format: MsgBody.itemBody cannot be set twice.');
					}
					++item_body$count;
					this.itemBody = new proto.cs.ItemBody();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.itemBody);
					break;
				case 9:
					if (quest_body$count != 0) {
						throw new flash.errors.IOError('Bad data format: MsgBody.questBody cannot be set twice.');
					}
					++quest_body$count;
					this.questBody = new proto.cs.QuestBody();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.questBody);
					break;
				case 11:
					if (friend_body$count != 0) {
						throw new flash.errors.IOError('Bad data format: MsgBody.friendBody cannot be set twice.');
					}
					++friend_body$count;
					this.friendBody = new proto.cs.FriendBody();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.friendBody);
					break;
				case 12:
					if (room_body$count != 0) {
						throw new flash.errors.IOError('Bad data format: MsgBody.roomBody cannot be set twice.');
					}
					++room_body$count;
					this.roomBody = new proto.cs.RoomBody();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.roomBody);
					break;
				case 14:
					if (chat_body$count != 0) {
						throw new flash.errors.IOError('Bad data format: MsgBody.chatBody cannot be set twice.');
					}
					++chat_body$count;
					this.chatBody = new proto.cs.ChatBody();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.chatBody);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
