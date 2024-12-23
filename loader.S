/* loader.S */
.global _start
.section .text
_start:
    /* GRUBはカーネルをロードした後、エントリポイントを指示します */
    /* _start はカーネルのエントリポイントです */

    cli                          /* 割り込み禁止 */
    cld                          /* 文字列命令に対して方向フラグをクリア */

    mov $0x0, %ebx              /* グラブの引数を設定 */
    mov $0x0, %ecx
    mov $0x0, %edx
    mov $0x0, %esi

    /* カーネルのメイン関数へジャンプ */
    call kernel_main

    hlt                          /* 無限ループ */
