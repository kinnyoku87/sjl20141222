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
	import proto.com.RoomBaseInfo;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class CreateRoomReq extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ROOM_BASE_INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.CreateRoomReq.room_base_info", "roomBaseInfo", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.RoomBaseInfo; });

		private var room_base_info$field:proto.com.RoomBaseInfo;

		public function clearRoomBaseInfo():void {
			room_base_info$field = null;
		}

		public function get hasRoomBaseInfo():Boolean {
			return room_base_info$field != null;
		}

		public function set roomBaseInfo(value:proto.com.RoomBaseInfo):void {
			room_base_info$field = value;
		}

		public function get roomBaseInfo():proto.com.RoomBaseInfo {
			return room_base_info$field;
		}

		/**
		 *  @private
		 */
		public static const BATTLE_MEMBER_INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.CreateRoomReq.battle_member_info", "battleMemberInfo", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.BattleMemberInfo; });

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
			if (hasRoomBaseInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, room_base_info$field);
			}
			if (hasBattleMemberInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
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
			var room_base_info$count:uint = 0;
			var battle_member_info$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (room_base_info$count != 0) {
						throw new flash.errors.IOError('Bad data format: CreateRoomReq.roomBaseInfo cannot be set twice.');
					}
					++room_base_info$count;
					this.roomBaseInfo = new proto.com.RoomBaseInfo();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.roomBaseInfo);
					break;
				case 2:
					if (battle_member_info$count != 0) {
						throw new flash.errors.IOError('Bad data format: CreateRoomReq.battleMemberInfo cannot be set twice.');
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
