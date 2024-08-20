// 方法1： 使用命名导出
export const useFoo = () => {
  return useState("foo", () => "bar");
};

// 方法2： 使用默认导出
// composables/use-foo.ts 或 composables/useFoo.ts
// // 它将作为 useFoo() 可用（文件名的驼峰形式，不包括扩展名）
// export default function () {
//   return useState('foo', () => 'bar')
// }