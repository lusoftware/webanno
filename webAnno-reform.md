1. 改造的功能
    - 优化标注重叠样式
    - 实现跨行标注
    - 增加标注批改
    - 增加标注类型切换
2. 改造的代码
    - 修改的文件：目前只修改brat下visualizer，后续可能需要对annotation_ui和visualizer_ui进修改
    - 具体需要修改的地方：
        - 去除标注花括号 01 remove curly
        - 去除高亮 10 remove fragment highlight
        - 去除fragment矩形 02 remove fragment rect
        - 去除标注类型文字 03 remove annotation type text
        - 每个token增加标注矩形 08 add token rect
            给每个chunk添加token 04 add token to chunk
            计算token间space 05 add space to token
            计算token相对chunk的位置 06 evaluate token position
            给fragment添加token 07 add token to fragment
        - 两侧增加标注范围括号 09 add both curly
            修复同一文字下的fragment curly只渲染一次 11 Modify overlap algorithm

        - 修改标注重叠算法 11 Modify overlap algorithm
        - 修改跨行算法
            - 增加token curly 15
            - 按照token划分新行 row添加token 16 evaluate row by token width
            - 计算token X值 包含space 17  evaluate token X position
            - 按token绘制text 18 draw token text
            - 绘制文字高亮 19 draw text highlight
            - 给chunk添加transform修改为给token添加transform 20 translate token
            - 跨行添加空间 21 add row space

        - 增加标注类型切换 12 add class select
        - 增加标注批注 13 add approve select
        - 增加标注shape和approve 14

3.遗留问题
    - 两侧括号位置
    - token增加floor 计算渲染位置
    - 计算fragment height有bug