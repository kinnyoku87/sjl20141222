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
	public dynamic final class ItemBaseInfo extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.com.ItemBaseInfo.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var id$field:UInt64;

		public function clearId():void {
			id$field = null;
		}

		public function get hasId():Boolean {
			return id$field != null;
		}

		public function set id(value:UInt64):void {
			id$field = value;
		}

		public function get id():UInt64 {
			return id$field;
		}

		/**
		 *  @private
		 */
		public static const RES_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.ItemBaseInfo.res_id", "resId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var res_id$field:int;

		private var hasField$0:uint = 0;

		public function clearResId():void {
			hasField$0 &= 0xfffffffe;
			res_id$field = new int();
		}

		public function get hasResId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set resId(value:int):void {
			hasField$0 |= 0x1;
			res_id$field = value;
		}

		public function get resId():int {
			return res_id$field;
		}

		/**
		 *  @private
		 */
		public static const OVERLAPP_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.ItemBaseInfo.overlapp_count", "overlappCount", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var overlapp_count$field:int;

		public function clearOverlappCount():void {
			hasField$0 &= 0xfffffffd;
			overlapp_count$field = new int();
		}

		public function get hasOverlappCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set overlappCount(value:int):void {
			hasField$0 |= 0x2;
			overlapp_count$field = value;
		}

		public function get overlappCount():int {
			return overlapp_count$field;
		}

		/**
		 *  @private
		 */
		public static const CREATE_TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.com.ItemBaseInfo.create_time", "createTime", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var create_time$field:uint;

		public function clearCreateTime():void {
			hasField$0 &= 0xfffffffb;
			create_time$field = new uint();
		}

		public function get hasCreateTime():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set createTime(value:uint):void {
			hasField$0 |= 0x4;
			create_time$field = value;
		}

		public function get createTime():uint {
			return create_time$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, id$field);
			}
			if (hasResId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, res_id$field);
			}
			if (hasOverlappCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, overlapp_count$field);
			}
			if (hasCreateTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, create_time$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var id$count:uint = 0;
			var res_id$count:uint = 0;
			var overlapp_count$count:uint = 0;
			var create_time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemBaseInfo.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (res_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemBaseInfo.resId cannot be set twice.');
					}
					++res_id$count;
					this.resId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (overlapp_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemBaseInfo.overlappCount cannot be set twice.');
					}
					++overlapp_count$count;
					this.overlappCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (create_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemBaseInfo.createTime cannot be set twice.');
					}
					++create_time$count;
					this.createTime = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
