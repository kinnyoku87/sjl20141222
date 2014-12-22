package proto.com {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.com.CardHoldUnit;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class CampBattleCard extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CAMP_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.CampBattleCard.camp_id", "campId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const CARD_IDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.com.CampBattleCard.card_ids", "cardIds", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.CardHoldUnit; });

		[ArrayElementType("proto.com.CardHoldUnit")]
		public var cardIds:Array = [];

		/**
		 *  @private
		 */
		public static const BAG_INDEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.CampBattleCard.bag_index", "bagIndex", (3 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.com.CampBattleCard.name", "name", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const SORT_INDEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.CampBattleCard.sort_index", "sortIndex", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var sort_index$field:int;

		public function clearSortIndex():void {
			hasField$0 &= 0xfffffffb;
			sort_index$field = new int();
		}

		public function get hasSortIndex():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set sortIndex(value:int):void {
			hasField$0 |= 0x4;
			sort_index$field = value;
		}

		public function get sortIndex():int {
			return sort_index$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCampId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, camp_id$field);
			}
			for (var cardIds$index:uint = 0; cardIds$index < this.cardIds.length; ++cardIds$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.cardIds[cardIds$index]);
			}
			if (hasBagIndex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, bag_index$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, name$field);
			}
			if (hasSortIndex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, sort_index$field);
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
			var name$count:uint = 0;
			var sort_index$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (camp_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: CampBattleCard.campId cannot be set twice.');
					}
					++camp_id$count;
					this.campId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					this.cardIds.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.com.CardHoldUnit()));
					break;
				case 3:
					if (bag_index$count != 0) {
						throw new flash.errors.IOError('Bad data format: CampBattleCard.bagIndex cannot be set twice.');
					}
					++bag_index$count;
					this.bagIndex = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: CampBattleCard.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 5:
					if (sort_index$count != 0) {
						throw new flash.errors.IOError('Bad data format: CampBattleCard.sortIndex cannot be set twice.');
					}
					++sort_index$count;
					this.sortIndex = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
