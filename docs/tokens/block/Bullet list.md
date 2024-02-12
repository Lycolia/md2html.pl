# Bullet list

| 項目   | 値                                                                                                  |
| ------ | --------------------------------------------------------------------------------------------------- |
| 子要素 | code, delete, emphasis, horizontal line, image, link, strong, blockquote, bullet list, ordered list |

## 終端判定

-   最後の`- `から一行以上空行があった場合

## 例

**入力**

```
- hoge
  - piyo
    - fuga
- foo
```

**出力**

```
<ul>
  <li>hoge</li>
  <ul>
    <li>piyo</li>
    <ul>
      <li>fuga</li>
    </ul>
  </ul>
  <li>foo</li>
</ul>
```
