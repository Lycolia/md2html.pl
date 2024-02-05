use strict;
use Test::More;

subtest "codefence: 言語指定なし" => sub {
    my $param = <<EOF;
```
hoge
  piyo
    fuga
hpf
```
EOF
    # 言語指定なしはtext
    my $expected = <<EOF;
```
<pre><code class="language-text">
hoge
  piyo
    fuga
hpf
</code></pre>
```
EOF
    my $actual = "";

    is $actual, $expected;
};

subtest "codefence: 言語抽出" => sub {
    my $param = <<EOF;
```bash
hoge
  piyo
    fuga
hpf
```
EOF

    my $expected = <<EOF;
```
<pre><code class="language-bash">
hoge
  piyo
    fuga
hpf
</code></pre>
```
EOF
    my $actual = "";

    is $actual, $expected;
};

subtest "codefence: アウトラインインデント削除" => sub {
    my $param = <<EOF;
   ```bash
   hoge
     piyo
       fuga
   hpf
   ```
EOF

    my $expected = <<EOF;
```
<pre><code class="language-bash">
hoge
  piyo
    fuga
hpf
</code></pre>
```
EOF
    my $actual = "";

    is $actual, $expected;
};


subtest "codefence: インラインバッククォート" => sub {
    my $param = <<EOF;
````bash
```
hoge
  piyo
    fuga
```
hpf
````
EOF

    my $expected = <<EOF;
```
<pre><code class="language-bash">
```
hoge
  piyo
    fuga
```
hpf
</code></pre>
```
EOF
    my $actual = "";

    is $actual, $expected;
};
