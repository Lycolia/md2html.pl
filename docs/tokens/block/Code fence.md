# Code fence

| 項目   | 値  |
| ------ | --- |
| 子要素 | -   |

## 終端判定

-   開始のバッククォートと同じ数のバッククォートを検出したとき
-   文字列の終端

## 例

**入力**

`````
```
hoge
piyo
fuga
```

```perl
my $hoge = <<EOF;
foo
bar
EOF
print $hoge;
```

````markdown
```perl
my $hoge = <<EOF;
foo
bar
EOF
print $hoge;
```
````

`````

**出力**

````
<p><pre><code class="language-plaintext">hoge
piyo
fuga</code></pre></p>

<p><pre><code class="language-perl">my $hoge = &lt;&lt;EOF;
foo
bar
EOF
print $hoge;</code></pre></p>

<p><pre><code class="language-markdown">```perl
my $hoge = &lt;&lt;EOF;
foo
bar
EOF
print $hoge;
```</code></pre></p>
````
