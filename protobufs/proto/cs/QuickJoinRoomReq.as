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
	public dynamic final class QuickJoinRoomReq extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MOD:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.QuickJoinRoomReq.mod", "mod", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var mod$field:int;

		private var hasField$0:uint = 0;

		public function clearMod():void {
			hasField$0 &= 0xfffffffe;
			mod$field = new int();
		}

		public function get hasMod():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set mod(value:int):void {
			hasField$0 |= 0x1;
			mod$field = value;
		}

		public function get mod():int {
			return mod$field;
		}

		/**
		 *  @private
		 */
		public static const STAGE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.QuickJoinRoomReq.stage", "stage", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var stage$field:int;

		public function clearStage():void {
			hasField$0 &= 0xfffffffd;
			stage$field = new int();
		}

		public function get hasStage():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set stage(value:int):void {
			hasField$0 |= 0x2;
			stage$field = value;
		}

		public function get stage():int {
			return stage$field;
		}

		/**
		 *  @private
		 */
		public static const BATTLE_MEMBER_INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.QuickJoinRoomReq.battle_member_info", "battleMemberInfo", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.BattleMemberInfo; });

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
			if (hasMod) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, mod$field);
			}
			if (hasStage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, stage$field);
			}
			if (hasBattleMemberInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
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
			var mod$count:uint = 0;
			var stage$count:uint = 0;
			var battle_member_info$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (mod$count != 0) {
						throw new flash.errors.IOError('Bad data format: QuickJoinRoomReq.mod cannot be set twice.');
					}
					++mod$count;
					this.mod = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (stage$count != 0) {
						throw new flash.errors.IOError('Bad data format: QuickJoinRoomReq.stage cannot be set twice.');
					}
					++stage$count;
					this.stage = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (battle_member_info$count != 0) {
						throw new flash.errors.IOError('Bad data format: QuickJoinRoomReq.battleMemberInfo cannot be set twice.');
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
