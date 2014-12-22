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
	public dynamic final class FindRoomReq extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const OFFSET:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.FindRoomReq.offset", "offset", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var offset$field:int;

		private var hasField$0:uint = 0;

		public function clearOffset():void {
			hasField$0 &= 0xfffffffe;
			offset$field = new int();
		}

		public function get hasOffset():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set offset(value:int):void {
			hasField$0 |= 0x1;
			offset$field = value;
		}

		public function get offset():int {
			return offset$field;
		}

		/**
		 *  @private
		 */
		public static const ROOM_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.FindRoomReq.room_count", "roomCount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var room_count$field:int;

		public function clearRoomCount():void {
			hasField$0 &= 0xfffffffd;
			room_count$field = new int();
		}

		public function get hasRoomCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set roomCount(value:int):void {
			hasField$0 |= 0x2;
			room_count$field = value;
		}

		public function get roomCount():int {
			return room_count$field;
		}

		/**
		 *  @private
		 */
		public static const ROOM_ID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("proto.cs.FindRoomReq.room_id", "roomId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var room_id$field:Int64;

		public function clearRoomId():void {
			room_id$field = null;
		}

		public function get hasRoomId():Boolean {
			return room_id$field != null;
		}

		public function set roomId(value:Int64):void {
			room_id$field = value;
		}

		public function get roomId():Int64 {
			return room_id$field;
		}

		/**
		 *  @private
		 */
		public static const MOD:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.FindRoomReq.mod", "mod", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var mod$field:int;

		public function clearMod():void {
			hasField$0 &= 0xfffffffb;
			mod$field = new int();
		}

		public function get hasMod():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set mod(value:int):void {
			hasField$0 |= 0x4;
			mod$field = value;
		}

		public function get mod():int {
			return mod$field;
		}

		/**
		 *  @private
		 */
		public static const STAGE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.FindRoomReq.stage", "stage", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var stage$field:int;

		public function clearStage():void {
			hasField$0 &= 0xfffffff7;
			stage$field = new int();
		}

		public function get hasStage():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set stage(value:int):void {
			hasField$0 |= 0x8;
			stage$field = value;
		}

		public function get stage():int {
			return stage$field;
		}

		/**
		 *  @private
		 */
		public static const IS_ABSENCE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("proto.cs.FindRoomReq.is_absence", "isAbsence", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_absence$field:Boolean;

		public function clearIsAbsence():void {
			hasField$0 &= 0xffffffef;
			is_absence$field = new Boolean();
		}

		public function get hasIsAbsence():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set isAbsence(value:Boolean):void {
			hasField$0 |= 0x10;
			is_absence$field = value;
		}

		public function get isAbsence():Boolean {
			return is_absence$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasOffset) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, offset$field);
			}
			if (hasRoomCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, room_count$field);
			}
			if (hasRoomId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, room_id$field);
			}
			if (hasMod) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, mod$field);
			}
			if (hasStage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, stage$field);
			}
			if (hasIsAbsence) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_absence$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var offset$count:uint = 0;
			var room_count$count:uint = 0;
			var room_id$count:uint = 0;
			var mod$count:uint = 0;
			var stage$count:uint = 0;
			var is_absence$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (offset$count != 0) {
						throw new flash.errors.IOError('Bad data format: FindRoomReq.offset cannot be set twice.');
					}
					++offset$count;
					this.offset = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (room_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: FindRoomReq.roomCount cannot be set twice.');
					}
					++room_count$count;
					this.roomCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (room_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: FindRoomReq.roomId cannot be set twice.');
					}
					++room_id$count;
					this.roomId = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 4:
					if (mod$count != 0) {
						throw new flash.errors.IOError('Bad data format: FindRoomReq.mod cannot be set twice.');
					}
					++mod$count;
					this.mod = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (stage$count != 0) {
						throw new flash.errors.IOError('Bad data format: FindRoomReq.stage cannot be set twice.');
					}
					++stage$count;
					this.stage = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (is_absence$count != 0) {
						throw new flash.errors.IOError('Bad data format: FindRoomReq.isAbsence cannot be set twice.');
					}
					++is_absence$count;
					this.isAbsence = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
