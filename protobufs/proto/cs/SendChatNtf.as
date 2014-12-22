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
	public dynamic final class SendChatNtf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SENDER_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.SendChatNtf.sender_id", "senderId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var sender_id$field:UInt64;

		public function clearSenderId():void {
			sender_id$field = null;
		}

		public function get hasSenderId():Boolean {
			return sender_id$field != null;
		}

		public function set senderId(value:UInt64):void {
			sender_id$field = value;
		}

		public function get senderId():UInt64 {
			return sender_id$field;
		}

		/**
		 *  @private
		 */
		public static const CHANNEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.SendChatNtf.channel", "channel", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var channel$field:int;

		private var hasField$0:uint = 0;

		public function clearChannel():void {
			hasField$0 &= 0xfffffffe;
			channel$field = new int();
		}

		public function get hasChannel():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set channel(value:int):void {
			hasField$0 |= 0x1;
			channel$field = value;
		}

		public function get channel():int {
			return channel$field;
		}

		/**
		 *  @private
		 */
		public static const CONTENT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.SendChatNtf.content", "content", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSenderId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, sender_id$field);
			}
			if (hasChannel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, channel$field);
			}
			if (hasContent) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, content$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var sender_id$count:uint = 0;
			var channel$count:uint = 0;
			var content$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (sender_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: SendChatNtf.senderId cannot be set twice.');
					}
					++sender_id$count;
					this.senderId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (channel$count != 0) {
						throw new flash.errors.IOError('Bad data format: SendChatNtf.channel cannot be set twice.');
					}
					++channel$count;
					this.channel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (content$count != 0) {
						throw new flash.errors.IOError('Bad data format: SendChatNtf.content cannot be set twice.');
					}
					++content$count;
					this.content = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
