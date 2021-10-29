# solidityTestAnswer

题目
1. 发行一个ERC20 Token，有如下要求：
    a. 名字：TestToken
    b. 符号：TT
    c. 精度：18
    d. 合约创建者为 owner 
    e. 初始化预分配 10000000 TT 给 owner
    f. owner 拥有 铸币、暂停合约的权限
    g. 可销毁，只能自己销毁自己的代币
2. 发行一个 ERC721 NFT，有如下要求：
    a. 名字：SuperHero
    b. 符号：SH
    c. 有 名字、年龄、等级等属性
    i. 等级分为三类：Low、Mid、High，使用Enum表示
    d. 合约创建者为owner
    e. owner拥有暂停合约的权限
    f. NFT id 从 1 开始
    g. 每个外部用户地址都可以铸造NFT
    i. 合约地址不行
    ii. 避免重入
    iii. 铸造NFT时，可以获得10个 TestToken，每个用户只能获取一次


```
npm i
```