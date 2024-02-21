# Ordered list

| 項目   | 値                                                   |
| ------ | ---------------------------------------------------- |
| 子要素 | code, delete, emphasis, image, link, satsuki, strong |

## 例

**入力**

```
|aaaa|nbbb|
|----|----|
|hoge|piyo|
|fuga|`hogepiyofuga`|
```

**出力**

```html
<table>
  <thead>
    <tr>
      <td>aaaa</td>
      <td>bbbb</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>hoge</td>
      <td>piyo</td>
    </tr>
    <tr>
      <td>fuga</td>
      <td>{code}</td>
    </tr>
  </tbody>
</table>
```
