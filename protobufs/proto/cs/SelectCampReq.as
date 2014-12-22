package proto.cs {
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
	public dynamic final class SelectCampReq extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CAMP_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.SelectCampReq.camp_id", "campId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var camp_id$field:int;

		private var hasField$0:uint = 0;

		public function clearCampId():void {
			hasField$0 &= 0xfffffffe;
			camp_id$field = new int();
		}

		public function get hasCampId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set campId(value:int):void {
			hasField$0 |= 0x1;
			camp_id$field = value;
		}

		public function get campId():int {
			return camp_id$field;
		}

		/**
		 *  @private
		 */
		public static const BAG_INDEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.SelectCampReq.bag_index", "bagIndex", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var bag_index$field:int;

		public function clearBagIndex():void {
			hasField$0 &= 0xfffffffd;
			bag_index$field = new int();
		}

		public function get hasBagIndex():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set bagIndex(value:int):void {
			hasField$0 |= 0x2;
			bag_index$field = value;
		}

		public function get bagIndex():int {
			return bag_index$field;
		}

		/**
		 *  @private
		 */
		public static const USE_BAG_CARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.cs.SelectCampReq.use_bag_card", "useBagCard", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var use_bag_card$field:Boolean;

		public function clearUseBagCard():void {
			hasField$0 &= 0xfffffffb;
			use_bag_card$field = new Boolean();
		}

		public function get hasUseBagCard():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set useBagCard(value:Boolean):void {
			hasField$0 |= 0x4;
			use_bag_card$field = value;
		}

		public function get useBagCard():Boolean {
			return use_bag_card$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCampId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, camp_id$field);
			}
			if (hasBagIndex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, bag_index$field);
			}
			if (hasUseBagCard) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, use_bag_card$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var camp_id$count:uint = 0;
			var bag_index$count:uint = 0;
			var use_bag_card$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (camp_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: SelectCampReq.campId cannot be set twice.');
					}
					++camp_id$count;
					this.campId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (bag_index$count != 0) {
						throw new flash.errors.IOError('Bad data format: SelectCampReq.bagIndex cannot be set twice.');
					}
					++bag_index$count;
					this.bagIndex = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (use_bag_card$count != 0) {
						throw new flash.errors.IOError('Bad data format: SelectCampReq.useBagCard cannot be set twice.');
					}
					++use_bag_card$count;
					this.useBagCard = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
