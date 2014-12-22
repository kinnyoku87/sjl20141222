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
	public dynamic final class ReceiveOnceSkillNtf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const OBJECT_GUID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.ReceiveOnceSkillNtf.object_guid", "objectGuid", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var object_guid$field:UInt64;

		public function clearObjectGuid():void {
			object_guid$field = null;
		}

		public function get hasObjectGuid():Boolean {
			return object_guid$field != null;
		}

		public function set objectGuid(value:UInt64):void {
			object_guid$field = value;
		}

		public function get objectGuid():UInt64 {
			return object_guid$field;
		}

		/**
		 *  @private
		 */
		public static const SKILL_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.ReceiveOnceSkillNtf.skill_id", "skillId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var skill_id$field:int;

		private var hasField$0:uint = 0;

		public function clearSkillId():void {
			hasField$0 &= 0xfffffffe;
			skill_id$field = new int();
		}

		public function get hasSkillId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set skillId(value:int):void {
			hasField$0 |= 0x1;
			skill_id$field = value;
		}

		public function get skillId():int {
			return skill_id$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasObjectGuid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, object_guid$field);
			}
			if (hasSkillId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, skill_id$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var object_guid$count:uint = 0;
			var skill_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (object_guid$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReceiveOnceSkillNtf.objectGuid cannot be set twice.');
					}
					++object_guid$count;
					this.objectGuid = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					if (skill_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReceiveOnceSkillNtf.skillId cannot be set twice.');
					}
					++skill_id$count;
					this.skillId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
