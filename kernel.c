// kernel.c
void kernel_main() {
    // VGAテキストモードにアクセスしてメッセージを表示
    const char *message = "Welcome to Yuki OS Kernel!";
    char *video_memory = (char *) 0xB8000; // VGAテキストモードのメモリ開始アドレス
    
    // メッセージを表示する
    for (int i = 0; message[i] != '\0'; i++) {
        video_memory[i * 2] = message[i];       // 文字
        video_memory[i * 2 + 1] = 0x07;         // 白色の文字
    }

    // 無限ループ（カーネルが終了しないようにする）
    while (1) {}
}
