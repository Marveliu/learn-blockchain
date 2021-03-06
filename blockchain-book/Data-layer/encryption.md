
# 区块链加密算法

非对称加密是区块链技术中用于安全性需求和所有权认证时采用的加密技术，常见的非对称 加密算法有RSA、Elgamal、背包算法、Rabin、D-H、ECC（椭圆曲线加密算法）和ECDSA（椭 圆曲线数字签名算法），等等 [9][26] 。与对称加密算法不同的是，非对称加密算法需要两个秘钥： 公开秘钥（public key）和私有秘钥（private key）。基于非对称加密算法可使通信双方在不安全的 媒体上交换信息，安全地达成信息的一致。公开秘钥是对外公开的，而私有秘钥是保密的，其他 人不能通过公钥推算出对应的私钥。每一个公开秘钥都有其相对应的私有秘钥，如果我们使用公 开秘钥对信息进行了加密，那么则必须要对应的私有秘钥才能对加密后的信息进行解密；而如果 是用私有秘钥加密信息，则只有对应的公开秘钥才可以进行解密。在区块链中，非对称加密主要 用于信息加密、数字签名等场景。

## Hash算法介绍

散列表,它是基于高速存取的角度设计的，也是一种典型的“空间换时间”的做法。顾名思义，该数据结构能够理解为一个线性表，可是当中的元素不是紧密排列的，而是可能存在空隙。

散列表（Hash table，也叫哈希表），是依据关键码值(Key value)而直接进行訪问的数据结构。也就是说，它通过把关键码值映射到表中一个位置来訪问记录，以加快查找的速度。这个映射函数叫做散列函数，存放记录的数组叫做散列表。

### hash种类

1. 直接寻址法：取keyword或keyword的某个线性函数值为散列地址。即H(key)=key或H(key) = a•key + b，当中a和b为常数（这样的散列函数叫做自身函数）
2. 数字分析法：分析一组数据，比方一组员工的出生年月日，这时我们发现出生年月日的前几位数字大体同样，这种话，出现冲突的几率就会非常大，可是我们发现年月日的后几位表示月份和详细日期的数字区别非常大，假设用后面的数字来构成散列地址，则冲突的几率会明显减少。因此数字分析法就是找出数字的规律，尽可能利用这些数据来构造冲突几率较低的散列地址。
3. 平方取中法：取keyword平方后的中间几位作为散列地址。
4. 折叠法：将keyword切割成位数同样的几部分，最后一部分位数能够不同，然后取这几部分的叠加和（去除进位）作为散列地址。
5. 随机数法：选择一随机函数，取keyword的随机值作为散列地址，通经常使用于keyword长度不同的场合。
6. 除留余数法：取keyword被某个不大于散列表表长m的数p除后所得的余数为散列地址。即 H(key) = key MOD p, p<=m。不仅能够对keyword直接取模，也可在折叠、平方取中等运算之后取模。对p的选择非常重要，一般取素数或m，若p选的不好，easy产生同义词。
查找的性能分析

- MD4：MD4(RFC 1320)是 MIT 的 Ronald L. Rivest 在 1990 年设计的，MD 是 Message Digest 的缩写。它适用在32位字长的处理器上用快速软件实现--它是基于 32 位操作数的位操作来实现的。
- MD5：MD5(RFC 1321)是 Rivest 于1991年对MD4的改进版本号。它对输入仍以512位分组，其输出是4个32位字的级联，与 MD4 同样。MD5比MD4来得复杂，而且速度较之要慢一点，但更安全，在抗分析和抗差分方面表现更好
- SHA-1：SHA1是由NIST NSA设计为同DSA一起使用的，它对长度小于264的输入，产生长度为160bit的散列值，因此抗穷举(brute-force)性更好。SHA-1 设计时基于和MD4同样原理,而且模仿了该算法。*被谷歌破解不安全*

区块链是基于sha256哈希算法

### hash冲突

一些关键码可通过散列函数转换的地址直接找到，还有一些关键码在散列函数得到的地址上产生了冲突，须要按处理冲突的方法进行查找。

1. 散列函数是否均匀；
2. 处理冲突的方法；
3. 散列表的装填因子。

**散列算法（Hash Algorithm）**，又称哈希算法，杂凑算法，是一种从任意文件中创造小的数字「指纹」的方法。与指纹一样，散列算法就是一种以较短的信息来保证文件唯一性的标志，这种标志与文件的每一个字节都相关，而且难以找到逆向规律。因此，当原有文件发生改变时，其标志值也会发生改变，从而告诉文件使用者当前的文件已经不是你所需求的文件。

## 非对称加密算法

在信息加密场景中，如图1.7所示，信息发送者A需要发送一个信息给信息接收者B，需要先 使用B的公钥对信息进行加密，B收到后，使用自己的私钥就可以对这一信息进行解密，而其他 人没有私钥，是没办法对这个加密信息进行解密的。

![](http://opm06mqes.bkt.clouddn.com/18-4-21/70563916.jpg)

而在数字签名场景中，如图1.8所示，发送者A先用哈希函数对原文生成一个摘要（Digest）， 然后使用私钥对摘要进行加密，生成数字签名（Signature），之后将数字签名与原文一起发送给 接收者B；B收到信息后使用A的公钥对数字签名进行解密得到摘要，由此确保信息是A发出的， 然后再对收到的原文使用哈希函数产生摘要，并与解密得到的摘要进行对比，如果相同，则说明 收到的信息在传输过程中没有被修改过。

### 椭圆曲线加密技术

椭圆曲线密码学（Elliptic curve cryptography），简称ECC，是一种建立公开密钥加密的算法，也就是非对称加密。类似的还有RSA，ElGamal算法等。ECC被公认为在给定密钥长度下最安全的加密算法。比特币中的公私钥生成以及签名算法ECDSA都是基于ECC的。下面简单介绍ECC以及ECDSA的原理。

## 数字签名技术

![](http://opm06mqes.bkt.clouddn.com/18-4-21/56148849.jpg)

### 数字签名：椭圆曲线DSA（ECDSA）

## 时间戳技术

区块链通过时间戳保证每个区块依次顺序相连。时间戳使区块链上每一笔数据都具有时间标记。简单来说，时间戳证明了区块链上什么时候发生了什么事情，且任何人无法篡改。

时间戳在区块链中扮演公证人的角色，而且比传统的公证制度更为可信，因为区块链上记录的信息无法被任何人以任何方式修改。

因为运用了时间戳，区块链技术很适合用于知识产权保护等领域。举个例子，你写了一篇论文，在发布之前想先找行业专家指点一下，但是你担心专家直接用他的名义发表。这时候你只需先保存在链上，便可以轻松证明版权。




