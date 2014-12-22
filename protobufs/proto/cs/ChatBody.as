package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.cs.SendChatNtf;
	import proto.cs.TipsNtf;
	import proto.cs.SendChatRes;
	import proto.cs.SendChatReq;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ChatBody extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SEND_CHAT_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.ChatBody.send_chat_req", "sendChatReq", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.SendChatReq; });

		private var send_chat_req$field:proto.cs.SendChatReq;

		public function clearSendChatReq():void {
			send_chat_req$field = null;
		}

		public function get hasSendChatReq():Boolean {
			return send_chat_req$field != null;
		}

		public function set sendChatReq(value:proto.cs.SendChatReq):void {
			send_chat_req$field = value;
		}

		public function get sendChatReq():proto.cs.SendChatReq {
			return send_chat_req$field;
		}

		/**
		 *  @private
		 */
		public static const SEND_CHAT_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.ChatBody.send_chat_res", "sendChatRes", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.SendChatRes; });

		private var send_chat_res$field:proto.cs.SendChatRes;

		public function clearSendChatRes():void {
			send_chat_res$field = null;
		}

		public function get hasSendChatRes():Boolean {
			return send_chat_res$field != null;
		}

		public function set sendChatRes(value:proto.cs.SendChatRes):void {
			send_chat_res$field = value;
		}

		public function get sendChatRes():proto.cs.SendChatRes {
			return send_chat_res$field;
		}

		/**
		 *  @private
		 */
		public static const SEND_CHAT_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.ChatBody.send_chat_ntf", "sendChatNtf", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.SendChatNtf; });

		private var send_chat_ntf$field:proto.cs.SendChatNtf;

		public function clearSendChatNtf():void {
			send_chat_ntf$field = null;
		}

		public function get hasSendChatNtf():Boolean {
			return send_chat_ntf$field != null;
		}

		public function set sendChatNtf(value:proto.cs.SendChatNtf):void {
			send_chat_ntf$field = value;
		}

		public function get sendChatNtf():proto.cs.SendChatNtf {
			return send_chat_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const TIPS_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.ChatBody.tips_ntf", "tipsNtf", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.TipsNtf; });

		private var tips_ntf$field:proto.cs.TipsNtf;

		public function clearTipsNtf():void {
			tips_ntf$field = null;
		}

		public function get hasTipsNtf():Boolean {
			return tips_ntf$field != null;
		}

		public function set tipsNtf(value:proto.cs.TipsNtf):void {
			tips_ntf$field = value;
		}

		public function get tipsNtf():proto.cs.TipsNtf {
			return tips_ntf$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSendChatReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, send_chat_req$field);
			}
			if (hasSendChatRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, send_chat_res$field);
			}
			if (hasSendChatNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, send_chat_ntf$field);
			}
			if (hasTipsNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, tips_ntf$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var send_chat_req$count:uint = 0;
			var send_chat_res$count:uint = 0;
			var send_chat_ntf$count:uint = 0;
			var tips_ntf$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (send_chat_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChatBody.sendChatReq cannot be set twice.');
					}
					++send_chat_req$count;
					this.sendChatReq = new proto.cs.SendChatReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.sendChatReq);
					break;
				case 2:
					if (send_chat_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChatBody.sendChatRes cannot be set twice.');
					}
					++send_chat_res$count;
					this.sendChatRes = new proto.cs.SendChatRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.sendChatRes);
					break;
				case 3:
					if (send_chat_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChatBody.sendChatNtf cannot be set twice.');
					}
					++send_chat_ntf$count;
					this.sendChatNtf = new proto.cs.SendChatNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.sendChatNtf);
					break;
				case 4:
					if (tips_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChatBody.tipsNtf cannot be set twice.');
					}
					++tips_ntf$count;
					this.tipsNtf = new proto.cs.TipsNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.tipsNtf);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
