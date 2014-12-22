package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.cs.EventCondNtf;
	import proto.cs.CommitQuestReq;
	import proto.cs.AcceptQuestReq;
	import proto.cs.GetQuestRes;
	import proto.cs.SetCustomValueReq;
	import proto.cs.AcceptQuestRes;
	import proto.cs.SetCustomValueRes;
	import proto.cs.CommitQuestRes;
	import proto.cs.ResetQuestRes;
	import proto.cs.ResetQuestReq;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class QuestBody extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GET_QUEST_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.QuestBody.get_quest_res", "getQuestRes", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.GetQuestRes; });

		private var get_quest_res$field:proto.cs.GetQuestRes;

		public function clearGetQuestRes():void {
			get_quest_res$field = null;
		}

		public function get hasGetQuestRes():Boolean {
			return get_quest_res$field != null;
		}

		public function set getQuestRes(value:proto.cs.GetQuestRes):void {
			get_quest_res$field = value;
		}

		public function get getQuestRes():proto.cs.GetQuestRes {
			return get_quest_res$field;
		}

		/**
		 *  @private
		 */
		public static const ACCEPT_QUEST_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.QuestBody.accept_quest_req", "acceptQuestReq", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.AcceptQuestReq; });

		private var accept_quest_req$field:proto.cs.AcceptQuestReq;

		public function clearAcceptQuestReq():void {
			accept_quest_req$field = null;
		}

		public function get hasAcceptQuestReq():Boolean {
			return accept_quest_req$field != null;
		}

		public function set acceptQuestReq(value:proto.cs.AcceptQuestReq):void {
			accept_quest_req$field = value;
		}

		public function get acceptQuestReq():proto.cs.AcceptQuestReq {
			return accept_quest_req$field;
		}

		/**
		 *  @private
		 */
		public static const ACCEPT_QUEST_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.QuestBody.accept_quest_res", "acceptQuestRes", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.AcceptQuestRes; });

		private var accept_quest_res$field:proto.cs.AcceptQuestRes;

		public function clearAcceptQuestRes():void {
			accept_quest_res$field = null;
		}

		public function get hasAcceptQuestRes():Boolean {
			return accept_quest_res$field != null;
		}

		public function set acceptQuestRes(value:proto.cs.AcceptQuestRes):void {
			accept_quest_res$field = value;
		}

		public function get acceptQuestRes():proto.cs.AcceptQuestRes {
			return accept_quest_res$field;
		}

		/**
		 *  @private
		 */
		public static const COMMIT_QUEST_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.QuestBody.commit_quest_req", "commitQuestReq", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.CommitQuestReq; });

		private var commit_quest_req$field:proto.cs.CommitQuestReq;

		public function clearCommitQuestReq():void {
			commit_quest_req$field = null;
		}

		public function get hasCommitQuestReq():Boolean {
			return commit_quest_req$field != null;
		}

		public function set commitQuestReq(value:proto.cs.CommitQuestReq):void {
			commit_quest_req$field = value;
		}

		public function get commitQuestReq():proto.cs.CommitQuestReq {
			return commit_quest_req$field;
		}

		/**
		 *  @private
		 */
		public static const COMMIT_QUEST_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.QuestBody.commit_quest_res", "commitQuestRes", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.CommitQuestRes; });

		private var commit_quest_res$field:proto.cs.CommitQuestRes;

		public function clearCommitQuestRes():void {
			commit_quest_res$field = null;
		}

		public function get hasCommitQuestRes():Boolean {
			return commit_quest_res$field != null;
		}

		public function set commitQuestRes(value:proto.cs.CommitQuestRes):void {
			commit_quest_res$field = value;
		}

		public function get commitQuestRes():proto.cs.CommitQuestRes {
			return commit_quest_res$field;
		}

		/**
		 *  @private
		 */
		public static const EVENT_COND_NTF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.QuestBody.event_cond_ntf", "eventCondNtf", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.EventCondNtf; });

		private var event_cond_ntf$field:proto.cs.EventCondNtf;

		public function clearEventCondNtf():void {
			event_cond_ntf$field = null;
		}

		public function get hasEventCondNtf():Boolean {
			return event_cond_ntf$field != null;
		}

		public function set eventCondNtf(value:proto.cs.EventCondNtf):void {
			event_cond_ntf$field = value;
		}

		public function get eventCondNtf():proto.cs.EventCondNtf {
			return event_cond_ntf$field;
		}

		/**
		 *  @private
		 */
		public static const RESET_QUEST_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.QuestBody.reset_quest_req", "resetQuestReq", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ResetQuestReq; });

		private var reset_quest_req$field:proto.cs.ResetQuestReq;

		public function clearResetQuestReq():void {
			reset_quest_req$field = null;
		}

		public function get hasResetQuestReq():Boolean {
			return reset_quest_req$field != null;
		}

		public function set resetQuestReq(value:proto.cs.ResetQuestReq):void {
			reset_quest_req$field = value;
		}

		public function get resetQuestReq():proto.cs.ResetQuestReq {
			return reset_quest_req$field;
		}

		/**
		 *  @private
		 */
		public static const RESET_QUEST_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.QuestBody.reset_quest_res", "resetQuestRes", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ResetQuestRes; });

		private var reset_quest_res$field:proto.cs.ResetQuestRes;

		public function clearResetQuestRes():void {
			reset_quest_res$field = null;
		}

		public function get hasResetQuestRes():Boolean {
			return reset_quest_res$field != null;
		}

		public function set resetQuestRes(value:proto.cs.ResetQuestRes):void {
			reset_quest_res$field = value;
		}

		public function get resetQuestRes():proto.cs.ResetQuestRes {
			return reset_quest_res$field;
		}

		/**
		 *  @private
		 */
		public static const SET_CUSTOM_VALUE_REQ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.QuestBody.set_custom_value_req", "setCustomValueReq", (21 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.SetCustomValueReq; });

		private var set_custom_value_req$field:proto.cs.SetCustomValueReq;

		public function clearSetCustomValueReq():void {
			set_custom_value_req$field = null;
		}

		public function get hasSetCustomValueReq():Boolean {
			return set_custom_value_req$field != null;
		}

		public function set setCustomValueReq(value:proto.cs.SetCustomValueReq):void {
			set_custom_value_req$field = value;
		}

		public function get setCustomValueReq():proto.cs.SetCustomValueReq {
			return set_custom_value_req$field;
		}

		/**
		 *  @private
		 */
		public static const SET_CUSTOM_VALUE_RES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.cs.QuestBody.set_custom_value_res", "setCustomValueRes", (22 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.SetCustomValueRes; });

		private var set_custom_value_res$field:proto.cs.SetCustomValueRes;

		public function clearSetCustomValueRes():void {
			set_custom_value_res$field = null;
		}

		public function get hasSetCustomValueRes():Boolean {
			return set_custom_value_res$field != null;
		}

		public function set setCustomValueRes(value:proto.cs.SetCustomValueRes):void {
			set_custom_value_res$field = value;
		}

		public function get setCustomValueRes():proto.cs.SetCustomValueRes {
			return set_custom_value_res$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasGetQuestRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, get_quest_res$field);
			}
			if (hasAcceptQuestReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, accept_quest_req$field);
			}
			if (hasAcceptQuestRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, accept_quest_res$field);
			}
			if (hasCommitQuestReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, commit_quest_req$field);
			}
			if (hasCommitQuestRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, commit_quest_res$field);
			}
			if (hasEventCondNtf) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, event_cond_ntf$field);
			}
			if (hasResetQuestReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, reset_quest_req$field);
			}
			if (hasResetQuestRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, reset_quest_res$field);
			}
			if (hasSetCustomValueReq) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 21);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, set_custom_value_req$field);
			}
			if (hasSetCustomValueRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 22);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, set_custom_value_res$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var get_quest_res$count:uint = 0;
			var accept_quest_req$count:uint = 0;
			var accept_quest_res$count:uint = 0;
			var commit_quest_req$count:uint = 0;
			var commit_quest_res$count:uint = 0;
			var event_cond_ntf$count:uint = 0;
			var reset_quest_req$count:uint = 0;
			var reset_quest_res$count:uint = 0;
			var set_custom_value_req$count:uint = 0;
			var set_custom_value_res$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (get_quest_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: QuestBody.getQuestRes cannot be set twice.');
					}
					++get_quest_res$count;
					this.getQuestRes = new proto.cs.GetQuestRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.getQuestRes);
					break;
				case 4:
					if (accept_quest_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: QuestBody.acceptQuestReq cannot be set twice.');
					}
					++accept_quest_req$count;
					this.acceptQuestReq = new proto.cs.AcceptQuestReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.acceptQuestReq);
					break;
				case 5:
					if (accept_quest_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: QuestBody.acceptQuestRes cannot be set twice.');
					}
					++accept_quest_res$count;
					this.acceptQuestRes = new proto.cs.AcceptQuestRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.acceptQuestRes);
					break;
				case 6:
					if (commit_quest_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: QuestBody.commitQuestReq cannot be set twice.');
					}
					++commit_quest_req$count;
					this.commitQuestReq = new proto.cs.CommitQuestReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.commitQuestReq);
					break;
				case 7:
					if (commit_quest_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: QuestBody.commitQuestRes cannot be set twice.');
					}
					++commit_quest_res$count;
					this.commitQuestRes = new proto.cs.CommitQuestRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.commitQuestRes);
					break;
				case 8:
					if (event_cond_ntf$count != 0) {
						throw new flash.errors.IOError('Bad data format: QuestBody.eventCondNtf cannot be set twice.');
					}
					++event_cond_ntf$count;
					this.eventCondNtf = new proto.cs.EventCondNtf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.eventCondNtf);
					break;
				case 9:
					if (reset_quest_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: QuestBody.resetQuestReq cannot be set twice.');
					}
					++reset_quest_req$count;
					this.resetQuestReq = new proto.cs.ResetQuestReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.resetQuestReq);
					break;
				case 10:
					if (reset_quest_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: QuestBody.resetQuestRes cannot be set twice.');
					}
					++reset_quest_res$count;
					this.resetQuestRes = new proto.cs.ResetQuestRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.resetQuestRes);
					break;
				case 21:
					if (set_custom_value_req$count != 0) {
						throw new flash.errors.IOError('Bad data format: QuestBody.setCustomValueReq cannot be set twice.');
					}
					++set_custom_value_req$count;
					this.setCustomValueReq = new proto.cs.SetCustomValueReq();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.setCustomValueReq);
					break;
				case 22:
					if (set_custom_value_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: QuestBody.setCustomValueRes cannot be set twice.');
					}
					++set_custom_value_res$count;
					this.setCustomValueRes = new proto.cs.SetCustomValueRes();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.setCustomValueRes);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
