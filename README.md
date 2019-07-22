# SimpleBootkit
Не знаю, можно ли это вообще назвать буткитом. Блокируем загрузку Windows, ксоря оригинальный mbr на 0x90, и давая доступ к нему, только если пароль введен правильно. В массив в самом начале, вставляем байты нашего payload'а. Как его туда вставить, думайте сами.
Недо буткит создавался с целью большего ознакомления с OS Windows, а не для того, что бы вредить другим. 
[Это](https://github.com/Whiroo/SimpleBootkit/blob/master/payload.asm) payload для этого эксплойта

Возможно повреждение MBR. Восстановить можно обычным средствами восстановки Windows.

# Используйте его только в образовательных целях


# EN:

I do not know if it can even be called a bootkit. We block Windows booting, by xor the original mbr to 0x90, and giving access to it only if the password is entered correctly. In the array at the very beginning, insert the bytes of our payload'a. How to insert it, think for yourself.
"Bootkit" was created in order to get more familiar with the OS Windows, and not to harm others.
[This](https://github.com/Whiroo/SimpleBootkit/blob/master/payload.asm) payload for this exploit

Possible damage to the MBR. You can restore it using standard Windows recovery tools.

# Use it for educational purposes only.
