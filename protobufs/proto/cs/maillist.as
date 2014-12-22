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
	public dynamic final class maillist extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const THEME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.maillist.theme", "theme", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var theme$field:String;

		public function clearTheme():void {
			theme$field = null;
		}

		public function get hasTheme():Boolean {
			return theme$field != null;
		}

		public function set theme(value:String):void {
			theme$field = value;
		}

		public function get theme():String {
			return theme$field;
		}

		/**
		 *  @private
		 */
		public static const TIME:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.maillist.time", "time", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var time$field:int;

		private var hasField$0:uint = 0;

		public function clearTime():void {
			hasField$0 &= 0xfffffffe;
			time$field = new int();
		}

		public function get hasTime():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set time(value:int):void {
			hasField$0 |= 0x1;
			time$field = value;
		}

		public function get time():int {
			return time$field;
		}

		/**
		 *  @private
		 */
		public static const IS_READ:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.cs.maillist.is_read", "isRead", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_read$field:Boolean;

		public function clearIsRead():void {
			hasField$0 &= 0xfffffffd;
			is_read$field = new Boolean();
		}

		public function get hasIsRead():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set isRead(value:Boolean):void {
			hasField$0 |= 0x2;
			is_read$field = value;
		}

		public function get isRead():Boolean {
			return is_read$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTheme) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, theme$field);
			}
			if (hasTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, time$field);
			}
			if (hasIsRead) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
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
			var theme$count:uint = 0;
			var time$count:uint = 0;
			var is_read$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (theme$count != 0) {
						throw new flash.errors.IOError('Bad data format: maillist.theme cannot be set twice.');
					}
					++theme$count;
					this.theme = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (time$count != 0) {
						throw new flash.errors.IOError('Bad data format: maillist.time cannot be set twice.');
					}
					++time$count;
					this.time = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (is_read$count != 0) {
						throw new flash.errors.IOError('Bad data format: maillist.isRead cannot be set twice.');
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
