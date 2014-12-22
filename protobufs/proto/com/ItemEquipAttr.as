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
	public dynamic final class ItemEquipAttr extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const EQUIP_ATTR_TYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.com.ItemEquipAttr.equip_attr_type", "equipAttrType", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var equip_attr_type$field:uint;

		private var hasField$0:uint = 0;

		public function clearEquipAttrType():void {
			hasField$0 &= 0xfffffffe;
			equip_attr_type$field = new uint();
		}

		public function get hasEquipAttrType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set equipAttrType(value:uint):void {
			hasField$0 |= 0x1;
			equip_attr_type$field = value;
		}

		public function get equipAttrType():uint {
			return equip_attr_type$field;
		}

		/**
		 *  @private
		 */
		public static const EQUIP_ATTR_VAL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.com.ItemEquipAttr.equip_attr_val", "equipAttrVal", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var equip_attr_val$field:uint;

		public function clearEquipAttrVal():void {
			hasField$0 &= 0xfffffffd;
			equip_attr_val$field = new uint();
		}

		public function get hasEquipAttrVal():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set equipAttrVal(value:uint):void {
			hasField$0 |= 0x2;
			equip_attr_val$field = value;
		}

		public function get equipAttrVal():uint {
			return equip_attr_val$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasEquipAttrType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, equip_attr_type$field);
			}
			if (hasEquipAttrVal) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, equip_attr_val$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var equip_attr_type$count:uint = 0;
			var equip_attr_val$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (equip_attr_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemEquipAttr.equipAttrType cannot be set twice.');
					}
					++equip_attr_type$count;
					this.equipAttrType = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (equip_attr_val$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemEquipAttr.equipAttrVal cannot be set twice.');
					}
					++equip_attr_val$count;
					this.equipAttrVal = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
