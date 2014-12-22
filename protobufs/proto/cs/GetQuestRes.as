package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.com.EventCond;
	import proto.com.CustomValue;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class GetQuestRes extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ACCEPTED_IDS:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("proto.cs.GetQuestRes.accepted_ids", "acceptedIds", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var acceptedIds:Array = [];

		/**
		 *  @private
		 */
		public static const COMPLETED_IDS:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("proto.cs.GetQuestRes.completed_ids", "completedIds", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var completedIds:Array = [];

		/**
		 *  @private
		 */
		public static const EVENT_CONDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.GetQuestRes.event_conds", "eventConds", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.EventCond; });

		[ArrayElementType("proto.com.EventCond")]
		public var eventConds:Array = [];

		/**
		 *  @private
		 */
		public static const CUSTOM_VALUES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.GetQuestRes.custom_values", "customValues", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.com.CustomValue; });

		[ArrayElementType("proto.com.CustomValue")]
		public var customValues:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var acceptedIds$index:uint = 0; acceptedIds$index < this.acceptedIds.length; ++acceptedIds$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.acceptedIds[acceptedIds$index]);
			}
			for (var completedIds$index:uint = 0; completedIds$index < this.completedIds.length; ++completedIds$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.completedIds[completedIds$index]);
			}
			for (var eventConds$index:uint = 0; eventConds$index < this.eventConds.length; ++eventConds$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.eventConds[eventConds$index]);
			}
			for (var customValues$index:uint = 0; customValues$index < this.customValues.length; ++customValues$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.customValues[customValues$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.acceptedIds);
						break;
					}
					this.acceptedIds.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 2:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.completedIds);
						break;
					}
					this.completedIds.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 3:
					this.eventConds.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.com.EventCond()));
					break;
				case 11:
					this.customValues.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.com.CustomValue()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
