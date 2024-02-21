# Ordered list

| 項目   | 値                                                                                                  |
| ------ | --------------------------------------------------------------------------------------------------- |
| 子要素 | code, delete, emphasis, horizontal line, image, link, strong, blockquote, bullet list, ordered list |

## 例

**入力**

```
1. hoge
  1. piyo
    1. fuga
2. foo
```

**出力**

```html
<ol>
  <li>hoge</li>
  <ol>
    <li>piyo</li>
    <ol>
      <li>fuga</li>
    </ol>
  </ol>
  <li>foo</li>
</ol>
```
