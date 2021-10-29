# solidityTestAnswer

题目
1. 发行一个ERC20 Token，有如下要求：

    * 名字：TestToken
    * 符号：TT
    * 精度：18
    * 合约创建者为 owner 
    * 初始化预分配 10000000 TT 给 owner
    * owner 拥有 铸币、暂停合约的权限
    * 可销毁，只能自己销毁自己的代币
2. 发行一个 ERC721 NFT，有如下要求：
    * 名字：SuperHero
    * 符号：SH
    * 有 名字、年龄、等级等属性
    * 等级分为三类：Low、Mid、High，使用Enum表示
    * 合约创建者为owner
    * owner拥有暂停合约的权限
    * NFT id 从 1 开始
    * 每个外部用户地址都可以铸造NFT
        * 合约地址不行
        * 避免重入
        * 铸造NFT时，可以获得10个 TestToken，每个用户只能获取一次


安装openzeppelinn
```
npm i
```
