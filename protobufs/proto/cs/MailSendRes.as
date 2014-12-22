package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.cs.MailError;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class MailSendRes extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SUCCESS:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.cs.MailSendRes.success", "success", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var success$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearSuccess():void {
			hasField$0 &= 0xfffffffe;
			success$field = new Boolean();
		}

		public function get hasSuccess():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set success(value:Boolean):void {
			hasField$0 |= 0x1;
			success$field = value;
		}

		public function get success():Boolean {
			return success$field;
		}

		/**
		 *  @private
		 */
		public static const ERROR:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("proto.cs.MailSendRes.error", "error", (2 << 3) | com.netease.protobuf.WireType.VARINT, proto.cs.MailError);

		private var error$field:int;

		public function clearError():void {
			hasField$0 &= 0xfffffffd;
			error$field = new int();
		}

		public function get hasError():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set error(value:int):void {
			hasField$0 |= 0x2;
			error$field = value;
		}

		public function get error():int {
			return error$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSuccess) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, success$field);
			}
			if (hasError) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, error$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var success$count:uint = 0;
			var error$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (success$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailSendRes.success cannot be set twice.');
					}
					++success$count;
					this.success = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 2:
					if (error$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailSendRes.error cannot be set twice.');
					}
					++error$count;
					this.error = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
