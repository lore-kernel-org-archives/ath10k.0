Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x22f.google.com ([2a00:1450:4010:c07::22f])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cNmYT-0002dy-6h
 for ath10k@lists.infradead.org; Sun, 01 Jan 2017 20:16:35 +0000
Received: by mail-lf0-x22f.google.com with SMTP id c13so262187801lfg.0
 for <ath10k@lists.infradead.org>; Sun, 01 Jan 2017 12:16:12 -0800 (PST)
Received: from [192.168.1.198] (90-227-62-61-no75.tbcn.telia.com.
 [90.227.62.61])
 by smtp.gmail.com with ESMTPSA id v9sm15305687lja.0.2017.01.01.12.16.09
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 01 Jan 2017 12:16:09 -0800 (PST)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: ath10k usb support
Message-ID: <fcab0b26-7e9b-51cc-da4a-dd227d829206@gmail.com>
Date: Sun, 1 Jan 2017 21:16:08 +0100
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hi all,



I am currently working on implementing high latency support to ath10k,

and as a part of that work I decided to add USB support to the driver.

The implementation is heavily based on the existing ath6kl implementation

with a few tweaks to make it fit into the ath10k code base.



I have also used qcacld2.0 as a reference.



The device I have been using is a usb wifi dongle from Linksys: WUSB6100M

It is based on the QCA9377 chipset.



I have obtained firmware from:

http://www.linksys.com/us/support-article?articleNum=198580



It has been converted into ath10k-firmware using the below options:



API_VER=5

HTT_OP_VERSION="tlv"

WMI_OP_VERSION="tlv"

FW="linksys-wusb6100m/athwlan_AR6320.bin"

OTP="linksys-wusb6100m/otp_AR6320.bin"

FEATURES="ignore-otp-result"



ath10k-fwencoder --create \

--otp=$OTP \

--firmware=$FW \

--set-wmi-op-version=$WMI_OP_VERSION \

--set-htt-op-version=$HTT_OP_VERSION \

--set-fw-api=$API_VER \

--features=$FEATURES



A fork of the ath10k-firmware repo with usb fw file is available here:



https://github.com/erstrom/ath10k-firmware.git

branch: usb



The firmware package from linksys contains board files for different

regions, athwlan.bin, otp.bin and another bin-file named utf.bin.

I have noticed that the utf.bin file seems to be related to some kind of test mode,

so I am unsure if it is needed at all.

Does anyone know what this file could be used for?



A modified ath10k driver with USB support can be found here:



https://github.com/erstrom/linux-ath

branch: ath-201612300921-ath10k-sdio-and-usb



Unfortunately I have run into some problems when configuring the device.



Everything seems to work fine until I issue the HTT RX ring config command.

After that, I start to receive a lot of strange non HTC messages from the device.

I suspect this is some kind of dump-report but I am not sure.



Does anyone recognize the data at the end of this mail (does it make any sense)?



Another problem I have encountered is that I get a non-zero result from the OTP-

execute.



I have tried different OTP exe-params, but I get the same result (3).

Because of this, I added the "ignore-otp-result" parameter to the fw file.



Does anyone know what OTP result 3 mean?



So, in order to summarize:

I don't have a clue what OTP execute result 3 mean (perhaps this is the reason

why the device crashes after the HTT RX ring config message).

Does anyone recognize the below data transmitted from the device after the HTT

RX ring config message has been issued?



All ideas are welcome!



Message from device (extract only since there is a lot of data):



msg 1 244 bytes

[  658.924478] usb 1-2: htc msg 00000000: 00 c6 00 00 01 00 02 05 b3 15 00 00 75 28 91 00  ............u(..

[  658.924481] usb 1-2: htc msg 00000010: 31 5b 95 00 75 28 91 00 30 01 06 00 1f 00 00 00  1[..u(..0.......

[  658.924485] usb 1-2: htc msg 00000020: b4 8a 40 00 a8 5f 46 00 40 40 02 00 00 00 40 00  ..@.._F.@@....@.

[  658.924488] usb 1-2: htc msg 00000030: 00 00 00 00 09 00 00 00 00 00 00 00 6c 2f 95 00  ............l/..

[  658.924491] usb 1-2: htc msg 00000040: 77 2f 95 00 c4 2c 95 00 0d 08 91 00 12 07 91 00  w/...,..........

[  658.924494] usb 1-2: htc msg 00000050: 00 00 00 00 75 28 91 40 e8 e7 40 00 40 1f 40 00  ....u(.@..@.@.@.

[  658.924497] usb 1-2: htc msg 00000060: 60 1f 40 00 51 18 9f 80 48 e8 40 00 b4 8a 40 00  `.@.Q...H.@...@.

[  658.924501] usb 1-2: htc msg 00000070: 75 28 91 c0 ff a0 9b 80 88 e8 40 00 a0 1d 00 01  u(........@.....

[  658.924504] usb 1-2: htc msg 00000080: 00 00 00 00 84 a4 9b 80 a8 e8 40 00 00 00 00 00  ..........@.....

[  658.924507] usb 1-2: htc msg 00000090: 50 00 00 00 31 97 9b 80 d8 e8 40 00 68 f3 41 00  P...1.....@.h.A.

[  658.924510] usb 1-2: htc msg 000000a0: c0 58 40 00 b7 97 9b 80 18 e9 40 00 88 e9 40 00  .X@.......@...@.

[  658.924513] usb 1-2: htc msg 000000b0: c8 eb 0b 00 d6 84 9b 80 48 e9 40 00 01 00 00 00  ........H.@.....

[  658.924516] usb 1-2: htc msg 000000c0: 88 e9 40 00 16 79 9b 80 68 e9 40 00 08 6d 42 00  ..@..y..h.@..mB.

[  658.924520] usb 1-2: htc msg 000000d0: 2c 6d 42 00 7c db 91 80 88 e9 40 00 2c 6d 42 00  ,mB.|.....@.,mB.

[  658.924523] usb 1-2: htc msg 000000e0: 01 00 00 00 4c e7 9e 80 38 ea 40 00 5c ea 40 00  ....L...8.@.\.@.

[  658.924526] usb 1-2: htc msg 000000f0: 04 4d 40 00                                      .M@.



msg 2 520 bytes

[  658.934750] usb 1-2: htc msg 00000000: 00 d6 00 00 98 ab 40 00 a5 a5 a5 a5 5a 5a 5a 5a  ......@.....ZZZZ

[  658.934757] usb 1-2: htc msg 00000010: a5 a5 a5 a5 5a 5a 5a 5a 00 00 00 00 00 00 00 00  ....ZZZZ........

[  658.934762] usb 1-2: htc msg 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[  658.934768] usb 1-2: htc msg 00000030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[  658.934774] usb 1-2: htc msg 00000040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[  658.934779] usb 1-2: htc msg 00000050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[  658.934785] usb 1-2: htc msg 00000060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[  658.934791] usb 1-2: htc msg 00000070: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[  658.934796] usb 1-2: htc msg 00000080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[  658.934802] usb 1-2: htc msg 00000090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[  658.934808] usb 1-2: htc msg 000000a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[  658.934814] usb 1-2: htc msg 000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[  658.934820] usb 1-2: htc msg 000000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[  658.934825] usb 1-2: htc msg 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[  658.934831] usb 1-2: htc msg 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[  658.934837] usb 1-2: htc msg 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

[  658.934843] usb 1-2: htc msg 00000100: 00 00 00 00 00 00 00 00 e3 d7 73 90 50 b2 b4 62  ..........s.P..b

[  658.934849] usb 1-2: htc msg 00000110: cb 12 36 26 14 6c 94 55 3d 7c 84 eb 81 8c 1d 1e  ..6&.l.U=|......

[  658.934855] usb 1-2: htc msg 00000120: 32 33 b0 87 a2 d7 28 66 ee 40 cb b3 f2 0a 0d de  23....(f.@......

[  658.934861] usb 1-2: htc msg 00000130: 91 70 b5 83 94 86 b4 80 34 08 fd b4 f3 19 a8 be  .p......4.......

[  658.934867] usb 1-2: htc msg 00000140: d2 b9 cb 3f 72 86 0d e1 13 6e 1a 5f 48 ba b8 6d  ...?r....n._H..m

[  658.934873] usb 1-2: htc msg 00000150: 05 0d e3 68 2d 25 15 58 c7 d9 ef ee 29 ac de d8  ...h-%.X....)...

[  658.934879] usb 1-2: htc msg 00000160: a4 d4 b1 f7 a4 05 97 54 1e 64 bb 3b 0b 0e 87 98  .......T.d.;....

[  658.934885] usb 1-2: htc msg 00000170: d6 6f db a2 a6 17 90 b9 6f db cf eb a9 8c 09 fa  .o......o.......

[  658.934891] usb 1-2: htc msg 00000180: 80 19 d9 76 a0 60 3e 2d 45 5b e3 bd 97 66 51 cf  ...v.`>-E[...fQ.

[  658.934897] usb 1-2: htc msg 00000190: d7 c7 17 3f 26 42 1c b4 10 9c 8b f3 36 3f d9 99  ...?&B......6?..

[  658.934903] usb 1-2: htc msg 000001a0: 46 6f 9e ab 08 40 8d 44 a4 e2 82 93 f9 3a e3 a6  Fo...@.D.....:..

[  658.934909] usb 1-2: htc msg 000001b0: 3e c7 27 da dd 3b 10 58 87 00 9c ec d4 0d 81 a0  >.'..;.X........

[  658.934915] usb 1-2: htc msg 000001c0: 8c 73 89 be 50 92 29 08 82 7d 6d ad df f7 e5 48  .s..P.)..}m....H

[  658.934921] usb 1-2: htc msg 000001d0: 45 00 2c d0 13 e2 5e 18 b4 76 22 e2 69 15 d0 18  E.,...^..v".i...

[  658.934927] usb 1-2: htc msg 000001e0: 54 2d 45 cc 8c 66 be 60 11 10 b3 d2 99 fe 75 26  T-E..f.`......u&

[  658.934933] usb 1-2: htc msg 000001f0: ce 9d 60 b9 9c 86 19 08 13 9b 3e 79 36 4f 09 12  ..`.......>y6O..

[  658.934939] usb 1-2: htc msg 00000200: e5 75 8c de c2 ee ec 57                          .u.....W



msg 3 520 bytes

[  658.944948] usb 1-2: htc msg 00000000: 00 d6 00 00 98 ad 40 00 4e 34 6f ae 17 01 08 06  ......@.N4o.....

[  658.944952] usb 1-2: htc msg 00000010: 76 2e 5d 51 bb cb 2f a6 f6 cf 6d f9 87 02 bd ec  v.]Q../...m.....

[  658.944955] usb 1-2: htc msg 00000020: 95 63 7f f9 a9 87 fd 2c f0 f9 59 6c bd e4 84 89  .c.....,..Yl....

[  658.944959] usb 1-2: htc msg 00000030: 8f ca ef 4d 1d 82 c5 08 a2 e4 79 c1 01 69 55 4a  ...M......y..iUJ

[  658.944962] usb 1-2: htc msg 00000040: a1 34 c7 f3 1e 01 18 0c 13 29 57 42 6e 42 10 08  .4.......)WBnB..

[  658.944965] usb 1-2: htc msg 00000050: 65 a5 d4 c4 ea 27 da 84 cd 19 1f 11 0c 04 1d 2a  e....'.........*

[  658.944968] usb 1-2: htc msg 00000060: 83 7f 70 3d 1f 41 e4 b0 40 22 b8 1c a3 66 28 04  ..p=.A..@"...f(.

[  658.944971] usb 1-2: htc msg 00000070: 28 fd 4c d8 91 4b 8a 00 0a de 97 ec 29 e0 6b 62  (.L..K......).kb

[  658.944975] usb 1-2: htc msg 00000080: 9b 25 ef 6d 95 98 e7 4a 89 1e a7 84 e3 3a 39 c2  .%.m...J.....:9.

[  658.944978] usb 1-2: htc msg 00000090: 23 90 bd 18 d4 c8 18 18 99 32 19 73 97 d2 af 82  #........2.s....

[  658.944981] usb 1-2: htc msg 000000a0: 2c 75 f2 63 b0 2b 45 b5 28 5c 4a 4b 00 17 1c 4c  ,u.c.+E.(\JK...L

[  658.944984] usb 1-2: htc msg 000000b0: 5a b1 d5 a6 9f e0 27 3e f0 ad 8a aa d0 e3 02 ab  Z.....'>........

[  658.944987] usb 1-2: htc msg 000000c0: a3 61 3e 30 ee c2 1c 37 8b 2a 55 47 d2 78 01 67  .a>0...7.*UG.x.g

[  658.944991] usb 1-2: htc msg 000000d0: 5b ef 11 fc 29 59 e9 05 80 85 a5 ad a8 1a 99 88  [...)Y..........

[  658.944994] usb 1-2: htc msg 000000e0: aa f6 6a fc 4e a1 28 aa 6d 74 77 d5 d5 d5 8d 63  ..j.N.(.mtw....c

[  658.944997] usb 1-2: htc msg 000000f0: e1 f2 7a 5f e5 ee 8c a2 fa d4 07 97 36 bd 8f 24  ..z_........6..$

[  658.945000] usb 1-2: htc msg 00000100: ae 9c 0d 1c fd c1 bb 8a 6c 10 e9 3b 39 81 8d 07  ........l..;9...

[  658.945004] usb 1-2: htc msg 00000110: d5 8d 46 60 58 03 48 0a fa 88 c0 f9 ac 7a e2 42  ..F`X.H......z.B

[  658.945007] usb 1-2: htc msg 00000120: 65 94 6a c3 e1 cb a3 1e 07 a6 f3 a7 1d 8a d4 08  e.j.............

[  658.945010] usb 1-2: htc msg 00000130: 2d 5a 67 c4 bf 90 1e 82 b8 51 d5 bd f6 39 46 c4  -Zg......Q...9F.

[  658.945013] usb 1-2: htc msg 00000140: 6d de 8c 68 08 a4 9f 00 e1 0a ae 69 79 62 d1 41  m..h.......iyb.A

[  658.945017] usb 1-2: htc msg 00000150: e0 47 df 12 61 7f 4e 35 96 7b e8 b4 f6 2e d5 42  .G..a.N5.{.....B

[  658.945020] usb 1-2: htc msg 00000160: c5 20 20 62 71 0e 10 00 b8 e6 76 64 2e 23 50 ad  .  bq.....vd.#P.

[  658.945023] usb 1-2: htc msg 00000170: 7b e7 ce 39 d8 aa f0 25 50 d9 e1 1f 5f dd 8a 6c  {..9...%P..._..l

[  658.945026] usb 1-2: htc msg 00000180: f3 d1 0b b4 60 d4 92 21 0b 81 c8 ee d5 8a d7 cb  ....`..!........

[  658.945030] usb 1-2: htc msg 00000190: d6 1a d2 c4 58 c5 aa 7b b9 68 e7 22 99 f9 7b d2  ....X..{.h."..{.

[  658.945033] usb 1-2: htc msg 000001a0: cd 7f 75 e0 fa 6e f4 9f dd f1 f1 da 8a 74 5d 31  ..u..n.......t]1

[  658.945036] usb 1-2: htc msg 000001b0: f6 fd e9 08 ba 7c c0 b8 80 48 be ea cb 81 76 56  .....|...H....vV

[  658.945039] usb 1-2: htc msg 000001c0: 6b 9b e4 08 e1 91 76 b8 ab 59 ec 6a 01 32 7d 44  k.....v..Y.j.2}D

[  658.945042] usb 1-2: htc msg 000001d0: 04 d9 4c aa 8b 4e 9c 84 91 1b 09 b8 ae 36 50 98  ..L..N.......6P.

[  658.945046] usb 1-2: htc msg 000001e0: d2 7b bd 8b 08 c9 16 c8 3d fe 41 62 b9 ae 22 21  .{......=.Ab.."!

[  658.945049] usb 1-2: htc msg 000001f0: 89 d0 5e 58 9e 38 a3 20 ee 9a 3d b1 60 56 61 7f  ..^X.8. ..=.`Va.

[  658.945052] usb 1-2: htc msg 00000200: 3f 98 2f d7 21 2f a0 0e                          ?./.!/..

...

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
