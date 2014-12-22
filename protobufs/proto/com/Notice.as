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
	public dynamic final class Notice extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FROM_ID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.com.Notice.from_id", "fromId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const SEND_TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("proto.com.Notice.send_time", "sendTime", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var send_time$field:uint;

		private var hasField$0:uint = 0;

		public function clearSendTime():void {
			hasField$0 &= 0xfffffffe;
			send_time$field = new uint();
		}

		public function get hasSendTime():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set sendTime(value:uint):void {
			hasField$0 |= 0x1;
			send_time$field = value;
		}

		public function get sendTime():uint {
			return send_time$field;
		}

		/**
		 *  @private
		 */
		public static const NOTICE_TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.Notice.notice_type", "noticeType", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var notice_type$field:int;

		public function clearNoticeType():void {
			hasField$0 &= 0xfffffffd;
			notice_type$field = new int();
		}

		public function get hasNoticeType():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set noticeType(value:int):void {
			hasField$0 |= 0x2;
			notice_type$field = value;
		}

		public function get noticeType():int {
			return notice_type$field;
		}

		/**
		 *  @private
		 */
		public static const TITLE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.com.Notice.title", "title", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const CONTENT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.com.Notice.content", "content", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const IS_READ:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.com.Notice.is_read", "isRead", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_read$field:Boolean;

		public function clearIsRead():void {
			hasField$0 &= 0xfffffffb;
			is_read$field = new Boolean();
		}

		public function get hasIsRead():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set isRead(value:Boolean):void {
			hasField$0 |= 0x4;
			is_read$field = value;
		}

		public function get isRead():Boolean {
			return is_read$field;
		}

		/**
		 *  @private
		 */
		public static const ROUND_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.com.Notice.round_id", "roundId", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var round_id$field:int;

		public function clearRoundId():void {
			hasField$0 &= 0xfffffff7;
			round_id$field = new int();
		}

		public function get hasRoundId():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set roundId(value:int):void {
			hasField$0 |= 0x8;
			round_id$field = value;
		}

		public function get roundId():int {
			return round_id$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasFromId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, from_id$field);
			}
			if (hasSendTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, send_time$field);
			}
			if (hasNoticeType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, notice_type$field);
			}
			if (hasTitle) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, title$field);
			}
			if (hasContent) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, content$field);
			}
			if (hasIsRead) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_read$field);
			}
			if (hasRoundId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, round_id$field);
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
			var send_time$count:uint = 0;
			var notice_type$count:uint = 0;
			var title$count:uint = 0;
			var content$count:uint = 0;
			var is_read$count:uint = 0;
			var round_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (from_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: Notice.fromId cannot be set twice.');
					}
					++from_id$count;
					this.fromId = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (send_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: Notice.sendTime cannot be set twice.');
					}
					++send_time$count;
					this.sendTime = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 3:
					if (notice_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: Notice.noticeType cannot be set twice.');
					}
					++notice_type$count;
					this.noticeType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (title$count != 0) {
						throw new flash.errors.IOError('Bad data format: Notice.title cannot be set twice.');
					}
					++title$count;
					this.title = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 5:
					if (content$count != 0) {
						throw new flash.errors.IOError('Bad data format: Notice.content cannot be set twice.');
					}
					++content$count;
					this.content = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 6:
					if (is_read$count != 0) {
						throw new flash.errors.IOError('Bad data format: Notice.isRead cannot be set twice.');
					}
					++is_read$count;
					this.isRead = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 7:
					if (round_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: Notice.roundId cannot be set twice.');
					}
					++round_id$count;
					this.roundId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
