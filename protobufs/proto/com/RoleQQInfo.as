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
	public dynamic final class RoleQQInfo extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const OPENID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.com.RoleQQInfo.openid", "openid", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var openid$field:String;

		public function clearOpenid():void {
			openid$field = null;
		}

		public function get hasOpenid():Boolean {
			return openid$field != null;
		}

		public function set openid(value:String):void {
			openid$field = value;
		}

		public function get openid():String {
			return openid$field;
		}

		/**
		 *  @private
		 */
		public static const NICK_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.com.RoleQQInfo.nick_name", "nickName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var nick_name$field:String;

		public function clearNickName():void {
			nick_name$field = null;
		}

		public function get hasNickName():Boolean {
			return nick_name$field != null;
		}

		public function set nickName(value:String):void {
			nick_name$field = value;
		}

		public function get nickName():String {
			return nick_name$field;
		}

		/**
		 *  @private
		 */
		public static const FIGUREURL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.com.RoleQQInfo.figureurl", "figureurl", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var figureurl$field:String;

		public function clearFigureurl():void {
			figureurl$field = null;
		}

		public function get hasFigureurl():Boolean {
			return figureurl$field != null;
		}

		public function set figureurl(value:String):void {
			figureurl$field = value;
		}

		public function get figureurl():String {
			return figureurl$field;
		}

		/**
		 *  @private
		 */
		public static const IS_YELLOW_VIP:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.com.RoleQQInfo.is_yellow_vip", "isYellowVip", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_yellow_vip$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearIsYellowVip():void {
			hasField$0 &= 0xfffffffe;
			is_yellow_vip$field = new Boolean();
		}

		public function get hasIsYellowVip():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set isYellowVip(value:Boolean):void {
			hasField$0 |= 0x1;
			is_yellow_vip$field = value;
		}

		public function get isYellowVip():Boolean {
			return is_yellow_vip$field;
		}

		/**
		 *  @private
		 */
		public static const IS_YELLOW_YEAR_VIP:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.com.RoleQQInfo.is_yellow_year_vip", "isYellowYearVip", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_yellow_year_vip$field:Boolean;

		public function clearIsYellowYearVip():void {
			hasField$0 &= 0xfffffffd;
			is_yellow_year_vip$field = new Boolean();
		}

		public function get hasIsYellowYearVip():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set isYellowYearVip(value:Boolean):void {
			hasField$0 |= 0x2;
			is_yellow_year_vip$field = value;
		}

		public function get isYellowYearVip():Boolean {
			return is_yellow_year_vip$field;
		}

		/**
		 *  @private
		 */
		public static const YELLOW_VIP_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.RoleQQInfo.yellow_vip_level", "yellowVipLevel", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var yellow_vip_level$field:int;

		public function clearYellowVipLevel():void {
			hasField$0 &= 0xfffffffb;
			yellow_vip_level$field = new int();
		}

		public function get hasYellowVipLevel():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set yellowVipLevel(value:int):void {
			hasField$0 |= 0x4;
			yellow_vip_level$field = value;
		}

		public function get yellowVipLevel():int {
			return yellow_vip_level$field;
		}

		/**
		 *  @private
		 */
		public static const IS_YELLOW_HIGH_VIP:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.com.RoleQQInfo.is_yellow_high_vip", "isYellowHighVip", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_yellow_high_vip$field:Boolean;

		public function clearIsYellowHighVip():void {
			hasField$0 &= 0xfffffff7;
			is_yellow_high_vip$field = new Boolean();
		}

		public function get hasIsYellowHighVip():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set isYellowHighVip(value:Boolean):void {
			hasField$0 |= 0x8;
			is_yellow_high_vip$field = value;
		}

		public function get isYellowHighVip():Boolean {
			return is_yellow_high_vip$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasOpenid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, openid$field);
			}
			if (hasNickName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, nick_name$field);
			}
			if (hasFigureurl) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, figureurl$field);
			}
			if (hasIsYellowVip) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_yellow_vip$field);
			}
			if (hasIsYellowYearVip) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_yellow_year_vip$field);
			}
			if (hasYellowVipLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, yellow_vip_level$field);
			}
			if (hasIsYellowHighVip) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_yellow_high_vip$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var openid$count:uint = 0;
			var nick_name$count:uint = 0;
			var figureurl$count:uint = 0;
			var is_yellow_vip$count:uint = 0;
			var is_yellow_year_vip$count:uint = 0;
			var yellow_vip_level$count:uint = 0;
			var is_yellow_high_vip$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (openid$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleQQInfo.openid cannot be set twice.');
					}
					++openid$count;
					this.openid = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (nick_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleQQInfo.nickName cannot be set twice.');
					}
					++nick_name$count;
					this.nickName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (figureurl$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleQQInfo.figureurl cannot be set twice.');
					}
					++figureurl$count;
					this.figureurl = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (is_yellow_vip$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleQQInfo.isYellowVip cannot be set twice.');
					}
					++is_yellow_vip$count;
					this.isYellowVip = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 5:
					if (is_yellow_year_vip$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleQQInfo.isYellowYearVip cannot be set twice.');
					}
					++is_yellow_year_vip$count;
					this.isYellowYearVip = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 6:
					if (yellow_vip_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleQQInfo.yellowVipLevel cannot be set twice.');
					}
					++yellow_vip_level$count;
					this.yellowVipLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (is_yellow_high_vip$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoleQQInfo.isYellowHighVip cannot be set twice.');
					}
					++is_yellow_high_vip$count;
					this.isYellowHighVip = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
