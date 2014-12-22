package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.com.BattleMemberInfo;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class JoinRoomReq extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ROOM_ID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("proto.cs.JoinRoomReq.room_id", "roomId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const PWD:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.JoinRoomReq.pwd", "pwd", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const BATTLE_MEMBER_INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.JoinRoomReq.battle_member_info", "battleMemberInfo", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.BattleMemberInfo; });

		private var battle_member_info$field:proto.com.BattleMemberInfo;

		public function clearBattleMemberInfo():void {
			battle_member_info$field = null;
		}

		public function get hasBattleMemberInfo():Boolean {
			return battle_member_info$field != null;
		}

		public function set battleMemberInfo(value:proto.com.BattleMemberInfo):void {
			battle_member_info$field = value;
		}

		public function get battleMemberInfo():proto.com.BattleMemberInfo {
			return battle_member_info$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRoomId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, room_id$field);
			}
			if (hasPwd) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, pwd$field);
			}
			if (hasBattleMemberInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, battle_member_info$field);
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
			var pwd$count:uint = 0;
			var battle_member_info$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (room_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: JoinRoomReq.roomId cannot be set twice.');
					}
					++room_id$count;
					this.roomId = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 3:
					if (pwd$count != 0) {
						throw new flash.errors.IOError('Bad data format: JoinRoomReq.pwd cannot be set twice.');
					}
					++pwd$count;
					this.pwd = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (battle_member_info$count != 0) {
						throw new flash.errors.IOError('Bad data format: JoinRoomReq.battleMemberInfo cannot be set twice.');
					}
					++battle_member_info$count;
					this.battleMemberInfo = new proto.com.BattleMemberInfo();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.battleMemberInfo);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
