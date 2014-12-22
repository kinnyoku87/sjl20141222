package proto.com {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.com.ScoreInfo;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class RoleInfo extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.com.RoleInfo.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.com.RoleInfo.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const GENDER:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.RoleInfo.gender", "gender", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var gender$field:int;

		private var hasField$0:uint = 0;

		public function clearGender():void {
			hasField$0 &= 0xfffffffe;
			gender$field = new int();
		}

		public function get hasGender():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set gender(value:int):void {
			hasField$0 |= 0x1;
			gender$field = value;
		}

		public function get gender():int {
			return gender$field;
		}

		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.RoleInfo.level", "level", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level$field:int;

		public function clearLevel():void {
			hasField$0 &= 0xfffffffd;
			level$field = new int();
		}

		public function get hasLevel():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set level(value:int):void {
			hasField$0 |= 0x2;
			level$field = value;
		}

		public function get level():int {
			return level$field;
		}

		/**
		 *  @private
		 */
		public static const EXP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.RoleInfo.exp", "exp", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var exp$field:int;

		public function clearExp():void {
			hasField$0 &= 0xfffffffb;
			exp$field = new int();
		}

		public function get hasExp():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set exp(value:int):void {
			hasField$0 |= 0x4;
			exp$field = value;
		}

		public function get exp():int {
			return exp$field;
		}

		/**
		 *  @private
		 */
		public static const MONEY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.RoleInfo.money", "money", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var money$field:int;

		public function clearMoney():void {
			hasField$0 &= 0xfffffff7;
			money$field = new int();
		}

		public function get hasMoney():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set money(value:int):void {
			hasField$0 |= 0x8;
			money$field = value;
		}

		public function get money():int {
			return money$field;
		}

		/**
		 *  @private
		 */
		public static const RMB_:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.RoleInfo.rmb_", "rmb", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var rmb_$field:int;

		public function clearRmb():void {
			hasField$0 &= 0xffffffef;
			rmb_$field = new int();
		}

		public function get hasRmb():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set rmb(value:int):void {
			hasField$0 |= 0x10;
			rmb_$field = value;
		}

		public function get rmb():int {
			return rmb_$field;
		}

		/**
		 *  @private
		 */
		public static const DERIVATIVE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.RoleInfo.derivative", "derivative", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var derivative$field:int;

		public function clearDerivative():void {
			hasField$0 &= 0xffffffdf;
			derivative$field = new int();
		}

		public function get hasDerivative():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set derivative(value:int):void {
			hasField$0 |= 0x20;
			derivative$field = value;
		}

		public function get derivative():int {
			return derivative$field;
		}

		/**
		 *  @private
		 */
		public static const ICON:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.com.RoleInfo.icon", "icon", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var icon$field:String;

		public function clearIcon():void {
			icon$field = null;
		}

		public function get hasIcon():Boolean {
			return icon$field != null;
		}

		public function set icon(value:String):void {
			icon$field = value;
		}

		public function get icon():String {
			return icon$field;
		}

		/**
		 *  @private
		 */
		public static const SCORE_LIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.com.RoleInfo.score_list", "scoreList", (14 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.ScoreInfo; });

		[ArrayElementType("proto.com.ScoreInfo")]
		public var scoreList:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, id$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, name$field);
			}
			if (hasGender) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, gender$field);
			}
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, level$field);
			}
			if (hasExp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, exp$field);
			}
			if (hasMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, money$field);
			}
			if (hasRmb) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, rmb_$field);
			}
			if (hasDerivative) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, derivative$field);
			}
			if (hasIcon) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, icon$field);
			}
			for (var scoreList$index:uint = 0; scoreList$index < this.scoreList.length; ++scoreList$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.scoreList[scoreList$index]);
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
			var name$count:uint = 0;
			var gender$count:uint = 0;
			var level$count:uint = 0;
			var exp$count:uint = 0;
			var money$count:uint = 0;
			var rmb_$count:uint = 0;
			var derivative$count:uint = 0;
			var icon$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleInfo.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleInfo.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (gender$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleInfo.gender cannot be set twice.');
					}
					++gender$count;
					this.gender = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleInfo.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (exp$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleInfo.exp cannot be set twice.');
					}
					++exp$count;
					this.exp = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (money$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleInfo.money cannot be set twice.');
					}
					++money$count;
					this.money = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (rmb_$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleInfo.rmb cannot be set twice.');
					}
					++rmb_$count;
					this.rmb = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (derivative$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleInfo.derivative cannot be set twice.');
					}
					++derivative$count;
					this.derivative = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 12:
					if (icon$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleInfo.icon cannot be set twice.');
					}
					++icon$count;
					this.icon = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 14:
					this.scoreList.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.com.ScoreInfo()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
