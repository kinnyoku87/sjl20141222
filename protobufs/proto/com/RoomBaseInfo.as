package proto.com {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class RoomBaseInfo extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ROOM_ID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("proto.com.RoomBaseInfo.room_id", "roomId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var room_id$field:Int64;

		public function clearRoomId():void {
			room_id$field = null;
		}

		public function get hasRoomId():Boolean {
			return room_id$field != null;
		}

		public function set roomId(value:Int64):void {
			room_id$field = value;
		}

		public function get roomId():Int64 {
			return room_id$field;
		}

		/**
		 *  @private
		 */
		public static const OWER_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.com.RoomBaseInfo.ower_id", "owerId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ower_id$field:UInt64;

		public function clearOwerId():void {
			ower_id$field = null;
		}

		public function get hasOwerId():Boolean {
			return ower_id$field != null;
		}

		public function set owerId(value:UInt64):void {
			ower_id$field = value;
		}

		public function get owerId():UInt64 {
			return ower_id$field;
		}

		/**
		 *  @private
		 */
		public static const STATE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.RoomBaseInfo.state", "state", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var state$field:int;

		private var hasField$0:uint = 0;

		public function clearState():void {
			hasField$0 &= 0xfffffffe;
			state$field = new int();
		}

		public function get hasState():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set state(value:int):void {
			hasField$0 |= 0x1;
			state$field = value;
		}

		public function get state():int {
			return state$field;
		}

		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.com.RoomBaseInfo.name", "name", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var name$field:String;

		public function clearName():void {
			name$field = null;
		}

		public function get hasName():Boolean {
			return name$field != null;
		}

		public function set name(value:String):void {
			name$field = value;
		}

		public function get name():String {
			return name$field;
		}

		/**
		 *  @private
		 */
		public static const PWD:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.com.RoomBaseInfo.pwd", "pwd", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var pwd$field:String;

		public function clearPwd():void {
			pwd$field = null;
		}

		public function get hasPwd():Boolean {
			return pwd$field != null;
		}

		public function set pwd(value:String):void {
			pwd$field = value;
		}

		public function get pwd():String {
			return pwd$field;
		}

		/**
		 *  @private
		 */
		public static const MOD:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.RoomBaseInfo.mod", "mod", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var mod$field:int;

		public function clearMod():void {
			hasField$0 &= 0xfffffffd;
			mod$field = new int();
		}

		public function get hasMod():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set mod(value:int):void {
			hasField$0 |= 0x2;
			mod$field = value;
		}

		public function get mod():int {
			return mod$field;
		}

		/**
		 *  @private
		 */
		public static const ROUND_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.RoomBaseInfo.round_id", "roundId", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var round_id$field:int;

		public function clearRoundId():void {
			hasField$0 &= 0xfffffffb;
			round_id$field = new int();
		}

		public function get hasRoundId():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set roundId(value:int):void {
			hasField$0 |= 0x4;
			round_id$field = value;
		}

		public function get roundId():int {
			return round_id$field;
		}

		/**
		 *  @private
		 */
		public static const STAGE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.RoomBaseInfo.stage", "stage", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var stage$field:int;

		public function clearStage():void {
			hasField$0 &= 0xfffffff7;
			stage$field = new int();
		}

		public function get hasStage():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set stage(value:int):void {
			hasField$0 |= 0x8;
			stage$field = value;
		}

		public function get stage():int {
			return stage$field;
		}

		/**
		 *  @private
		 */
		public static const MEMBER_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.RoomBaseInfo.member_count", "memberCount", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var member_count$field:int;

		public function clearMemberCount():void {
			hasField$0 &= 0xffffffef;
			member_count$field = new int();
		}

		public function get hasMemberCount():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set memberCount(value:int):void {
			hasField$0 |= 0x10;
			member_count$field = value;
		}

		public function get memberCount():int {
			return member_count$field;
		}

		/**
		 *  @private
		 */
		public static const PVP_IP:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.com.RoomBaseInfo.pvp_ip", "pvpIp", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var pvp_ip$field:String;

		public function clearPvpIp():void {
			pvp_ip$field = null;
		}

		public function get hasPvpIp():Boolean {
			return pvp_ip$field != null;
		}

		public function set pvpIp(value:String):void {
			pvp_ip$field = value;
		}

		public function get pvpIp():String {
			return pvp_ip$field;
		}

		/**
		 *  @private
		 */
		public static const IS_CHAT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.com.RoomBaseInfo.is_chat", "isChat", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_chat$field:Boolean;

		public function clearIsChat():void {
			hasField$0 &= 0xffffffdf;
			is_chat$field = new Boolean();
		}

		public function get hasIsChat():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set isChat(value:Boolean):void {
			hasField$0 |= 0x20;
			is_chat$field = value;
		}

		public function get isChat():Boolean {
			return is_chat$field;
		}

		/**
		 *  @private
		 */
		public static const PLAY_CARD_TIME:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.RoomBaseInfo.play_card_time", "playCardTime", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var play_card_time$field:int;

		public function clearPlayCardTime():void {
			hasField$0 &= 0xffffffbf;
			play_card_time$field = new int();
		}

		public function get hasPlayCardTime():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set playCardTime(value:int):void {
			hasField$0 |= 0x40;
			play_card_time$field = value;
		}

		public function get playCardTime():int {
			return play_card_time$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRoomId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, room_id$field);
			}
			if (hasOwerId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, ower_id$field);
			}
			if (hasState) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, state$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, name$field);
			}
			if (hasPwd) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, pwd$field);
			}
			if (hasMod) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, mod$field);
			}
			if (hasRoundId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, round_id$field);
			}
			if (hasStage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, stage$field);
			}
			if (hasMemberCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, member_count$field);
			}
			if (hasPvpIp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, pvp_ip$field);
			}
			if (hasIsChat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_chat$field);
			}
			if (hasPlayCardTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, play_card_time$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var room_id$count:uint = 0;
			var ower_id$count:uint = 0;
			var state$count:uint = 0;
			var name$count:uint = 0;
			var pwd$count:uint = 0;
			var mod$count:uint = 0;
			var round_id$count:uint = 0;
			var stage$count:uint = 0;
			var member_count$count:uint = 0;
			var pvp_ip$count:uint = 0;
			var is_chat$count:uint = 0;
			var play_card_time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (room_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBaseInfo.roomId cannot be set twice.');
					}
					++room_id$count;
					this.roomId = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 2:
					if (ower_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBaseInfo.owerId cannot be set twice.');
					}
					++ower_id$count;
					this.owerId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 3:
					if (state$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBaseInfo.state cannot be set twice.');
					}
					++state$count;
					this.state = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBaseInfo.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 5:
					if (pwd$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBaseInfo.pwd cannot be set twice.');
					}
					++pwd$count;
					this.pwd = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 6:
					if (mod$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBaseInfo.mod cannot be set twice.');
					}
					++mod$count;
					this.mod = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (round_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBaseInfo.roundId cannot be set twice.');
					}
					++round_id$count;
					this.roundId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (stage$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBaseInfo.stage cannot be set twice.');
					}
					++stage$count;
					this.stage = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 9:
					if (member_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBaseInfo.memberCount cannot be set twice.');
					}
					++member_count$count;
					this.memberCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (pvp_ip$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBaseInfo.pvpIp cannot be set twice.');
					}
					++pvp_ip$count;
					this.pvpIp = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 11:
					if (is_chat$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBaseInfo.isChat cannot be set twice.');
					}
					++is_chat$count;
					this.isChat = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 12:
					if (play_card_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomBaseInfo.playCardTime cannot be set twice.');
					}
					++play_card_time$count;
					this.playCardTime = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
