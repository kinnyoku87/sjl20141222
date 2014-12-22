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
	public dynamic final class MatchJoinRes extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MOD:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.MatchJoinRes.mod", "mod", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const CAMP_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.MatchJoinRes.camp_id", "campId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var camp_id$field:int;

		public function clearCampId():void {
			hasField$0 &= 0xfffffffd;
			camp_id$field = new int();
		}

		public function get hasCampId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set campId(value:int):void {
			hasField$0 |= 0x2;
			camp_id$field = value;
		}

		public function get campId():int {
			return camp_id$field;
		}

		/**
		 *  @private
		 */
		public static const BAG_INDEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.MatchJoinRes.bag_index", "bagIndex", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var bag_index$field:int;

		public function clearBagIndex():void {
			hasField$0 &= 0xfffffffb;
			bag_index$field = new int();
		}

		public function get hasBagIndex():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set bagIndex(value:int):void {
			hasField$0 |= 0x4;
			bag_index$field = value;
		}

		public function get bagIndex():int {
			return bag_index$field;
		}

		/**
		 *  @private
		 */
		public static const USE_BAG_CARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.cs.MatchJoinRes.use_bag_card", "useBagCard", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var use_bag_card$field:Boolean;

		public function clearUseBagCard():void {
			hasField$0 &= 0xfffffff7;
			use_bag_card$field = new Boolean();
		}

		public function get hasUseBagCard():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set useBagCard(value:Boolean):void {
			hasField$0 |= 0x8;
			use_bag_card$field = value;
		}

		public function get useBagCard():Boolean {
			return use_bag_card$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasMod) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, mod$field);
			}
			if (hasCampId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, camp_id$field);
			}
			if (hasBagIndex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, bag_index$field);
			}
			if (hasUseBagCard) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
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
			var mod$count:uint = 0;
			var camp_id$count:uint = 0;
			var bag_index$count:uint = 0;
			var use_bag_card$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (mod$count != 0) {
						throw new flash.errors.IOError('Bad data format: MatchJoinRes.mod cannot be set twice.');
					}
					++mod$count;
					this.mod = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (camp_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: MatchJoinRes.campId cannot be set twice.');
					}
					++camp_id$count;
					this.campId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (bag_index$count != 0) {
						throw new flash.errors.IOError('Bad data format: MatchJoinRes.bagIndex cannot be set twice.');
					}
					++bag_index$count;
					this.bagIndex = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (use_bag_card$count != 0) {
						throw new flash.errors.IOError('Bad data format: MatchJoinRes.useBagCard cannot be set twice.');
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
