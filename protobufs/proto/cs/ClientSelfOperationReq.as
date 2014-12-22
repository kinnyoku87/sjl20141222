package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.cs.ClientMessage;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ClientSelfOperationReq extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CLIENT_MESSAGE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.ClientSelfOperationReq.client_message", "clientMessage", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ClientMessage; });

		private var client_message$field:proto.cs.ClientMessage;

		public function clearClientMessage():void {
			client_message$field = null;
		}

		public function get hasClientMessage():Boolean {
			return client_message$field != null;
		}

		public function set clientMessage(value:proto.cs.ClientMessage):void {
			client_message$field = value;
		}

		public function get clientMessage():proto.cs.ClientMessage {
			return client_message$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasClientMessage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, client_message$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var client_message$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (client_message$count != 0) {
						throw new flash.errors.IOError('Bad data format: ClientSelfOperationReq.clientMessage cannot be set twice.');
					}
					++client_message$count;
					this.clientMessage = new proto.cs.ClientMessage();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.clientMessage);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
