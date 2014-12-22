package proto.cs {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import proto.cs.ChessPos;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class MoveChessRes extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CHESS_UID:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("proto.cs.MoveChessRes.chess_uid", "chessUid", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var chess_uid$field:UInt64;

		public function clearChessUid():void {
			chess_uid$field = null;
		}

		public function get hasChessUid():Boolean {
			return chess_uid$field != null;
		}

		public function set chessUid(value:UInt64):void {
			chess_uid$field = value;
		}

		public function get chessUid():UInt64 {
			return chess_uid$field;
		}

		/**
		 *  @private
		 */
		public static const MOVE_PATH:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.cs.MoveChessRes.move_path", "movePath", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return proto.cs.ChessPos; });

		[ArrayElementType("proto.cs.ChessPos")]
		public var movePath:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasChessUid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT64(output, chess_uid$field);
			}
			for (var movePath$index:uint = 0; movePath$index < this.movePath.length; ++movePath$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.movePath[movePath$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var chess_uid$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (chess_uid$count != 0) {
						throw new flash.errors.IOError('Bad data format: MoveChessRes.chessUid cannot be set twice.');
					}
					++chess_uid$count;
					this.chessUid = com.netease.protobuf.ReadUtils.read$TYPE_UINT64(input);
					break;
				case 2:
					this.movePath.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new proto.cs.ChessPos()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
