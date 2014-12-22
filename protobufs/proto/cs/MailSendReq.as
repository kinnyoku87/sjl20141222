package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.com.Mail;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class MailSendReq extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MAIL:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.MailSendReq.mail", "mail", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.Mail; });

		private var mail$field:proto.com.Mail;

		public function clearMail():void {
			mail$field = null;
		}

		public function get hasMail():Boolean {
			return mail$field != null;
		}

		public function set mail(value:proto.com.Mail):void {
			mail$field = value;
		}

		public function get mail():proto.com.Mail {
			return mail$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasMail) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, mail$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var mail$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (mail$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailSendReq.mail cannot be set twice.');
					}
					++mail$count;
					this.mail = new proto.com.Mail();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.mail);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
