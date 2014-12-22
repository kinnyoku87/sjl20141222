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
	public dynamic final class CoolTime extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CD_TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.CoolTime.cd_type", "cdType", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cd_type$field:int;

		private var hasField$0:uint = 0;

		public function clearCdType():void {
			hasField$0 &= 0xfffffffe;
			cd_type$field = new int();
		}

		public function get hasCdType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set cdType(value:int):void {
			hasField$0 |= 0x1;
			cd_type$field = value;
		}

		public function get cdType():int {
			return cd_type$field;
		}

		/**
		 *  @private
		 */
		public static const CD_TIME:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.CoolTime.cd_time", "cdTime", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cd_time$field:int;

		public function clearCdTime():void {
			hasField$0 &= 0xfffffffd;
			cd_time$field = new int();
		}

		public function get hasCdTime():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set cdTime(value:int):void {
			hasField$0 |= 0x2;
			cd_time$field = value;
		}

		public function get cdTime():int {
			return cd_time$field;
		}

		/**
		 *  @private
		 */
		public static const BEGIN_TIME:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.CoolTime.begin_time", "beginTime", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var begin_time$field:int;

		public function clearBeginTime():void {
			hasField$0 &= 0xfffffffb;
			begin_time$field = new int();
		}

		public function get hasBeginTime():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set beginTime(value:int):void {
			hasField$0 |= 0x4;
			begin_time$field = value;
		}

		public function get beginTime():int {
			return begin_time$field;
		}

		/**
		 *  @private
		 */
		public static const FROM_TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.CoolTime.from_type", "fromType", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var from_type$field:int;

		public function clearFromType():void {
			hasField$0 &= 0xfffffff7;
			from_type$field = new int();
		}

		public function get hasFromType():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set fromType(value:int):void {
			hasField$0 |= 0x8;
			from_type$field = value;
		}

		public function get fromType():int {
			return from_type$field;
		}

		/**
		 *  @private
		 */
		public static const ITEM_RES_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.CoolTime.item_res_id", "itemResId", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var item_res_id$field:int;

		public function clearItemResId():void {
			hasField$0 &= 0xffffffef;
			item_res_id$field = new int();
		}

		public function get hasItemResId():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set itemResId(value:int):void {
			hasField$0 |= 0x10;
			item_res_id$field = value;
		}

		public function get itemResId():int {
			return item_res_id$field;
		}

		/**
		 *  @private
		 */
		public static const ITEM_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.CoolTime.item_level", "itemLevel", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var item_level$field:int;

		public function clearItemLevel():void {
			hasField$0 &= 0xffffffdf;
			item_level$field = new int();
		}

		public function get hasItemLevel():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set itemLevel(value:int):void {
			hasField$0 |= 0x20;
			item_level$field = value;
		}

		public function get itemLevel():int {
			return item_level$field;
		}

		/**
		 *  @private
		 */
		public static const SKILL_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.CoolTime.skill_id", "skillId", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var skill_id$field:int;

		public function clearSkillId():void {
			hasField$0 &= 0xffffffbf;
			skill_id$field = new int();
		}

		public function get hasSkillId():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set skillId(value:int):void {
			hasField$0 |= 0x40;
			skill_id$field = value;
		}

		public function get skillId():int {
			return skill_id$field;
		}

		/**
		 *  @private
		 */
		public static const SKILL_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.CoolTime.skill_level", "skillLevel", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var skill_level$field:int;

		public function clearSkillLevel():void {
			hasField$0 &= 0xffffff7f;
			skill_level$field = new int();
		}

		public function get hasSkillLevel():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set skillLevel(value:int):void {
			hasField$0 |= 0x80;
			skill_level$field = value;
		}

		public function get skillLevel():int {
			return skill_level$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCdType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, cd_type$field);
			}
			if (hasCdTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, cd_time$field);
			}
			if (hasBeginTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, begin_time$field);
			}
			if (hasFromType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, from_type$field);
			}
			if (hasItemResId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, item_res_id$field);
			}
			if (hasItemLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, item_level$field);
			}
			if (hasSkillId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, skill_id$field);
			}
			if (hasSkillLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, skill_level$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var cd_type$count:uint = 0;
			var cd_time$count:uint = 0;
			var begin_time$count:uint = 0;
			var from_type$count:uint = 0;
			var item_res_id$count:uint = 0;
			var item_level$count:uint = 0;
			var skill_id$count:uint = 0;
			var skill_level$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (cd_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: CoolTime.cdType cannot be set twice.');
					}
					++cd_type$count;
					this.cdType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (cd_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: CoolTime.cdTime cannot be set twice.');
					}
					++cd_time$count;
					this.cdTime = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (begin_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: CoolTime.beginTime cannot be set twice.');
					}
					++begin_time$count;
					this.beginTime = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (from_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: CoolTime.fromType cannot be set twice.');
					}
					++from_type$count;
					this.fromType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (item_res_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: CoolTime.itemResId cannot be set twice.');
					}
					++item_res_id$count;
					this.itemResId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (item_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: CoolTime.itemLevel cannot be set twice.');
					}
					++item_level$count;
					this.itemLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (skill_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: CoolTime.skillId cannot be set twice.');
					}
					++skill_id$count;
					this.skillId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 9:
					if (skill_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: CoolTime.skillLevel cannot be set twice.');
					}
					++skill_level$count;
					this.skillLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
