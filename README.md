What's ?
===============
chef で使用する roadworker の cookbook です。

Usage
-----
cookbook なので berkshelf で取ってきて使いましょう。

* Berksfile
```ruby
source "https://supermarket.chef.io"

cookbook "roadworker", git: "https://github.com/bageljp/cookbook-roadworker.git"
```

```
berks vendor
```

Recipes
----------

#### roadworker::default
roadworker をインストールする。

Attributes
----------

主要なやつのみ。

#### roadworker::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><tt>['roadworker']['bundle_path']</tt></td>
    <td>string</td>
    <td>bundleコマンドのPATH。</td>
  </tr>
</table>

