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
	public dynamic final class RoundTotalStarRank extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ROLE_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.com.RoundTotalStarRank.role_id", "roleId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var role_id$field:UInt64;

		public function clearRoleId():void {
			role_id$field = null;
		}

		public function get hasRoleId():Boolean {
			return role_id$field != null;
		}

		public function set roleId(value:UInt64):void {
			role_id$field = value;
		}

		public function get roleId():UInt64 {
			return role_id$field;
		}

		/**
		 *  @private
		 */
		public static const ROUND_STAR:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.RoundTotalStarRank.round_star", "roundStar", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var round_star$field:int;

		private var hasField$0:uint = 0;

		public function clearRoundStar():void {
			hasField$0 &= 0xfffffffe;
			round_star$field = new int();
		}

		public function get hasRoundStar():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set roundStar(value:int):void {
			hasField$0 |= 0x1;
			round_star$field = value;
		}

		public function get roundStar():int {
			return round_star$field;
		}

		/**
		 *  @private
		 */
		public static const UPDATE_TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.com.RoundTotalStarRank.update_time", "updateTime", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var update_time$field:uint;

		public function clearUpdateTime():void {
			hasField$0 &= 0xfffffffd;
			update_time$field = new uint();
		}

		public function get hasUpdateTime():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set updateTime(value:uint):void {
			hasField$0 |= 0x2;
			update_time$field = value;
		}

		public function get updateTime():uint {
			return update_time$field;
		}

		/**
		 *  @private
		 */
		public static const RANK:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.RoundTotalStarRank.rank", "rank", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var rank$field:int;

		public function clearRank():void {
			hasField$0 &= 0xfffffffb;
			rank$field = new int();
		}

		public function get hasRank():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set rank(value:int):void {
			hasField$0 |= 0x4;
			rank$field = value;
		}

		public function get rank():int {
			return rank$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRoleId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, role_id$field);
			}
			if (hasRoundStar) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, round_star$field);
			}
			if (hasUpdateTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, update_time$field);
			}
			if (hasRank) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, rank$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var role_id$count:uint = 0;
			var round_star$count:uint = 0;
			var update_time$count:uint = 0;
			var rank$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (role_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoundTotalStarRank.roleId cannot be set twice.');
					}
					++role_id$count;
					this.roleId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (round_star$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoundTotalStarRank.roundStar cannot be set twice.');
					}
					++round_star$count;
					this.roundStar = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (update_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoundTotalStarRank.updateTime cannot be set twice.');
					}
					++update_time$count;
					this.updateTime = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 4:
					if (rank$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoundTotalStarRank.rank cannot be set twice.');
					}
					++rank$count;
					this.rank = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
