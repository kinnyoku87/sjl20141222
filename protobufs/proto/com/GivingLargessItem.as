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
	public dynamic final class GivingLargessItem extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ROLE_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.com.GivingLargessItem.role_id", "roleId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const ITEM_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.GivingLargessItem.item_id", "itemId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var item_id$field:int;

		private var hasField$0:uint = 0;

		public function clearItemId():void {
			hasField$0 &= 0xfffffffe;
			item_id$field = new int();
		}

		public function get hasItemId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set itemId(value:int):void {
			hasField$0 |= 0x1;
			item_id$field = value;
		}

		public function get itemId():int {
			return item_id$field;
		}

		/**
		 *  @private
		 */
		public static const ITEM_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.GivingLargessItem.item_count", "itemCount", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var item_count$field:int;

		public function clearItemCount():void {
			hasField$0 &= 0xfffffffd;
			item_count$field = new int();
		}

		public function get hasItemCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set itemCount(value:int):void {
			hasField$0 |= 0x2;
			item_count$field = value;
		}

		public function get itemCount():int {
			return item_count$field;
		}

		/**
		 *  @private
		 */
		public static const RAND_UID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.com.GivingLargessItem.rand_uid", "randUid", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var rand_uid$field:UInt64;

		public function clearRandUid():void {
			rand_uid$field = null;
		}

		public function get hasRandUid():Boolean {
			return rand_uid$field != null;
		}

		public function set randUid(value:UInt64):void {
			rand_uid$field = value;
		}

		public function get randUid():UInt64 {
			return rand_uid$field;
		}

		/**
		 *  @private
		 */
		public static const TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.com.GivingLargessItem.time", "time", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var time$field:uint;

		public function clearTime():void {
			hasField$0 &= 0xfffffffb;
			time$field = new uint();
		}

		public function get hasTime():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set time(value:uint):void {
			hasField$0 |= 0x4;
			time$field = value;
		}

		public function get time():uint {
			return time$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRoleId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, role_id$field);
			}
			if (hasItemId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, item_id$field);
			}
			if (hasItemCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, item_count$field);
			}
			if (hasRandUid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, rand_uid$field);
			}
			if (hasTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, time$field);
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
			var item_id$count:uint = 0;
			var item_count$count:uint = 0;
			var rand_uid$count:uint = 0;
			var time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (role_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: GivingLargessItem.roleId cannot be set twice.');
					}
					++role_id$count;
					this.roleId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (item_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: GivingLargessItem.itemId cannot be set twice.');
					}
					++item_id$count;
					this.itemId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (item_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: GivingLargessItem.itemCount cannot be set twice.');
					}
					++item_count$count;
					this.itemCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (rand_uid$count != 0) {
						throw new flash.errors.IOError('Bad data format: GivingLargessItem.randUid cannot be set twice.');
					}
					++rand_uid$count;
					this.randUid = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 5:
					if (time$count != 0) {
						throw new flash.errors.IOError('Bad data format: GivingLargessItem.time cannot be set twice.');
					}
					++time$count;
					this.time = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
