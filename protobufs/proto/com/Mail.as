package proto.com {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.com.ItemInfo;
	import proto.com.Mail_Type;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class Mail extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FROM_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.com.Mail.from_id", "fromId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var from_id$field:UInt64;

		public function clearFromId():void {
			from_id$field = null;
		}

		public function get hasFromId():Boolean {
			return from_id$field != null;
		}

		public function set fromId(value:UInt64):void {
			from_id$field = value;
		}

		public function get fromId():UInt64 {
			return from_id$field;
		}

		/**
		 *  @private
		 */
		public static const FROM_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.com.Mail.from_name", "fromName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var from_name$field:String;

		public function clearFromName():void {
			from_name$field = null;
		}

		public function get hasFromName():Boolean {
			return from_name$field != null;
		}

		public function set fromName(value:String):void {
			from_name$field = value;
		}

		public function get fromName():String {
			return from_name$field;
		}

		/**
		 *  @private
		 */
		public static const TARGET_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.com.Mail.target_id", "targetId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var target_id$field:UInt64;

		public function clearTargetId():void {
			target_id$field = null;
		}

		public function get hasTargetId():Boolean {
			return target_id$field != null;
		}

		public function set targetId(value:UInt64):void {
			target_id$field = value;
		}

		public function get targetId():UInt64 {
			return target_id$field;
		}

		/**
		 *  @private
		 */
		public static const TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.com.Mail.time", "time", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var time$field:uint;

		private var hasField$0:uint = 0;

		public function clearTime():void {
			hasField$0 &= 0xfffffffe;
			time$field = new uint();
		}

		public function get hasTime():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set time(value:uint):void {
			hasField$0 |= 0x1;
			time$field = value;
		}

		public function get time():uint {
			return time$field;
		}

		/**
		 *  @private
		 */
		public static const MAIL_TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("proto.com.Mail.mail_type", "mailType", (5 << 3) | com.netease.protobuf.WireType.VARINT, proto.com.Mail_Type);

		private var mail_type$field:int;

		public function clearMailType():void {
			hasField$0 &= 0xfffffffd;
			mail_type$field = new int();
		}

		public function get hasMailType():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set mailType(value:int):void {
			hasField$0 |= 0x2;
			mail_type$field = value;
		}

		public function get mailType():int {
			return mail_type$field;
		}

		/**
		 *  @private
		 */
		public static const TITLE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.com.Mail.title", "title", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var title$field:String;

		public function clearTitle():void {
			title$field = null;
		}

		public function get hasTitle():Boolean {
			return title$field != null;
		}

		public function set title(value:String):void {
			title$field = value;
		}

		public function get title():String {
			return title$field;
		}

		/**
		 *  @private
		 */
		public static const CONTENT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.com.Mail.content", "content", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var content$field:String;

		public function clearContent():void {
			content$field = null;
		}

		public function get hasContent():Boolean {
			return content$field != null;
		}

		public function set content(value:String):void {
			content$field = value;
		}

		public function get content():String {
			return content$field;
		}

		/**
		 *  @private
		 */
		public static const ITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.com.Mail.items", "items", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.ItemInfo; });

		[ArrayElementType("proto.com.ItemInfo")]
		public var items:Array = [];

		/**
		 *  @private
		 */
		public static const MONEY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.Mail.money", "money", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var money$field:int;

		public function clearMoney():void {
			hasField$0 &= 0xfffffffb;
			money$field = new int();
		}

		public function get hasMoney():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set money(value:int):void {
			hasField$0 |= 0x4;
			money$field = value;
		}

		public function get money():int {
			return money$field;
		}

		/**
		 *  @private
		 */
		public static const IS_READ:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.com.Mail.is_read", "isRead", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_read$field:Boolean;

		public function clearIsRead():void {
			hasField$0 &= 0xfffffff7;
			is_read$field = new Boolean();
		}

		public function get hasIsRead():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set isRead(value:Boolean):void {
			hasField$0 |= 0x8;
			is_read$field = value;
		}

		public function get isRead():Boolean {
			return is_read$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasFromId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, from_id$field);
			}
			if (hasFromName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, from_name$field);
			}
			if (hasTargetId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, target_id$field);
			}
			if (hasTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, time$field);
			}
			if (hasMailType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, mail_type$field);
			}
			if (hasTitle) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, title$field);
			}
			if (hasContent) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, content$field);
			}
			for (var items$index:uint = 0; items$index < this.items.length; ++items$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.items[items$index]);
			}
			if (hasMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, money$field);
			}
			if (hasIsRead) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_read$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var from_id$count:uint = 0;
			var from_name$count:uint = 0;
			var target_id$count:uint = 0;
			var time$count:uint = 0;
			var mail_type$count:uint = 0;
			var title$count:uint = 0;
			var content$count:uint = 0;
			var money$count:uint = 0;
			var is_read$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (from_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: Mail.fromId cannot be set twice.');
					}
					++from_id$count;
					this.fromId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (from_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: Mail.fromName cannot be set twice.');
					}
					++from_name$count;
					this.fromName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (target_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: Mail.targetId cannot be set twice.');
					}
					++target_id$count;
					this.targetId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 4:
					if (time$count != 0) {
						throw new flash.errors.IOError('Bad data format: Mail.time cannot be set twice.');
					}
					++time$count;
					this.time = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 5:
					if (mail_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: Mail.mailType cannot be set twice.');
					}
					++mail_type$count;
					this.mailType = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 6:
					if (title$count != 0) {
						throw new flash.errors.IOError('Bad data format: Mail.title cannot be set twice.');
					}
					++title$count;
					this.title = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 7:
					if (content$count != 0) {
						throw new flash.errors.IOError('Bad data format: Mail.content cannot be set twice.');
					}
					++content$count;
					this.content = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 8:
					this.items.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.com.ItemInfo()));
					break;
				case 9:
					if (money$count != 0) {
						throw new flash.errors.IOError('Bad data format: Mail.money cannot be set twice.');
					}
					++money$count;
					this.money = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (is_read$count != 0) {
						throw new flash.errors.IOError('Bad data format: Mail.isRead cannot be set twice.');
					}
					++is_read$count;
					this.isRead = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
