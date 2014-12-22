package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.cs.SkillUseRes;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SkillUseNtf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SKILL_USE_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.SkillUseNtf.skill_use_res", "skillUseRes", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.SkillUseRes; });

		private var skill_use_res$field:proto.cs.SkillUseRes;

		public function clearSkillUseRes():void {
			skill_use_res$field = null;
		}

		public function get hasSkillUseRes():Boolean {
			return skill_use_res$field != null;
		}

		public function set skillUseRes(value:proto.cs.SkillUseRes):void {
			skill_use_res$field = value;
		}

		public function get skillUseRes():proto.cs.SkillUseRes {
			return skill_use_res$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSkillUseRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, skill_use_res$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var skill_use_res$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (skill_use_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: SkillUseNtf.skillUseRes cannot be set twice.');
					}
					++skill_use_res$count;
					this.skillUseRes = new proto.cs.SkillUseRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.skillUseRes);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
