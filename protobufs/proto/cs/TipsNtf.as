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
	public dynamic final class TipsNtf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MODLE_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.TipsNtf.modle_id", "modleId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var modle_id$field:int;

		private var hasField$0:uint = 0;

		public function clearModleId():void {
			hasField$0 &= 0xfffffffe;
			modle_id$field = new int();
		}

		public function get hasModleId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set modleId(value:int):void {
			hasField$0 |= 0x1;
			modle_id$field = value;
		}

		public function get modleId():int {
			return modle_id$field;
		}

		/**
		 *  @private
		 */
		public static const TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.TipsNtf.type", "type", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var type$field:int;

		public function clearType():void {
			hasField$0 &= 0xfffffffd;
			type$field = new int();
		}

		public function get hasType():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set type(value:int):void {
			hasField$0 |= 0x2;
			type$field = value;
		}

		public function get type():int {
			return type$field;
		}

		/**
		 *  @private
		 */
		public static const EFFECT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.TipsNtf.effect", "effect", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var effect$field:int;

		public function clearEffect():void {
			hasField$0 &= 0xfffffffb;
			effect$field = new int();
		}

		public function get hasEffect():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set effect(value:int):void {
			hasField$0 |= 0x4;
			effect$field = value;
		}

		public function get effect():int {
			return effect$field;
		}

		/**
		 *  @private
		 */
		public static const TIMES:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.TipsNtf.times", "times", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var times$field:int;

		public function clearTimes():void {
			hasField$0 &= 0xfffffff7;
			times$field = new int();
		}

		public function get hasTimes():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set times(value:int):void {
			hasField$0 |= 0x8;
			times$field = value;
		}

		public function get times():int {
			return times$field;
		}

		/**
		 *  @private
		 */
		public static const SHOW_POS:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.TipsNtf.show_pos", "showPos", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var show_pos$field:int;

		public function clearShowPos():void {
			hasField$0 &= 0xffffffef;
			show_pos$field = new int();
		}

		public function get hasShowPos():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set showPos(value:int):void {
			hasField$0 |= 0x10;
			show_pos$field = value;
		}

		public function get showPos():int {
			return show_pos$field;
		}

		/**
		 *  @private
		 */
		public static const X:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.TipsNtf.x", "x", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var x$field:int;

		public function clearX():void {
			hasField$0 &= 0xffffffdf;
			x$field = new int();
		}

		public function get hasX():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set x(value:int):void {
			hasField$0 |= 0x20;
			x$field = value;
		}

		public function get x():int {
			return x$field;
		}

		/**
		 *  @private
		 */
		public static const Y:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("proto.cs.TipsNtf.y", "y", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var y$field:int;

		public function clearY():void {
			hasField$0 &= 0xffffffbf;
			y$field = new int();
		}

		public function get hasY():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set y(value:int):void {
			hasField$0 |= 0x40;
			y$field = value;
		}

		public function get y():int {
			return y$field;
		}

		/**
		 *  @private
		 */
		public static const TITLE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.TipsNtf.title", "title", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const TEXT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("proto.cs.TipsNtf.text", "text", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var text$field:String;

		public function clearText():void {
			text$field = null;
		}

		public function get hasText():Boolean {
			return text$field != null;
		}

		public function set text(value:String):void {
			text$field = value;
		}

		public function get text():String {
			return text$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasModleId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, modle_id$field);
			}
			if (hasType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, type$field);
			}
			if (hasEffect) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, effect$field);
			}
			if (hasTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, times$field);
			}
			if (hasShowPos) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, show_pos$field);
			}
			if (hasX) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, x$field);
			}
			if (hasY) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, y$field);
			}
			if (hasTitle) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, title$field);
			}
			if (hasText) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, text$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var modle_id$count:uint = 0;
			var type$count:uint = 0;
			var effect$count:uint = 0;
			var times$count:uint = 0;
			var show_pos$count:uint = 0;
			var x$count:uint = 0;
			var y$count:uint = 0;
			var title$count:uint = 0;
			var text$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (modle_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: TipsNtf.modleId cannot be set twice.');
					}
					++modle_id$count;
					this.modleId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (type$count != 0) {
						throw new flash.errors.IOError('Bad data format: TipsNtf.type cannot be set twice.');
					}
					++type$count;
					this.type = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (effect$count != 0) {
						throw new flash.errors.IOError('Bad data format: TipsNtf.effect cannot be set twice.');
					}
					++effect$count;
					this.effect = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (times$count != 0) {
						throw new flash.errors.IOError('Bad data format: TipsNtf.times cannot be set twice.');
					}
					++times$count;
					this.times = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (show_pos$count != 0) {
						throw new flash.errors.IOError('Bad data format: TipsNtf.showPos cannot be set twice.');
					}
					++show_pos$count;
					this.showPos = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (x$count != 0) {
						throw new flash.errors.IOError('Bad data format: TipsNtf.x cannot be set twice.');
					}
					++x$count;
					this.x = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (y$count != 0) {
						throw new flash.errors.IOError('Bad data format: TipsNtf.y cannot be set twice.');
					}
					++y$count;
					this.y = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (title$count != 0) {
						throw new flash.errors.IOError('Bad data format: TipsNtf.title cannot be set twice.');
					}
					++title$count;
					this.title = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 9:
					if (text$count != 0) {
						throw new flash.errors.IOError('Bad data format: TipsNtf.text cannot be set twice.');
					}
					++text$count;
					this.text = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
