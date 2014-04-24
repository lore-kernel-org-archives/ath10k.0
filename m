Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailhost.actiasodielec.fr ([89.91.64.97])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WdFcP-0007Pm-Bg
 for ath10k@lists.infradead.org; Thu, 24 Apr 2014 09:06:59 +0000
From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Thu, 24 Apr 2014 11:03:02 +0200
Subject: RE : RE : Report Firmware  firmware-2.bin_10.1.467.2-1 Error
Message-ID: <EE97821C81277E459BEA5C6384C6F241012F0EFBBCB0@srvexch01.SODIELEC.local>
References: <53461A8A.4030209@candelatech.com>
 <1397124355-6321-1-git-send-email-michal.kazior@tieto.com>
 <8738hkh193.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQ=gUBsw43M2at0y7iZU3VhwdjH9EBqzdOmKpxLjjqusPw@mail.gmail.com>
 <CA+BoTQ=L7Cj5V04RGEFcdGm1rxEO8NOYMEhSRiQNdoBoMTm5Pg@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F06CC4837@srvexch01.SODIELEC.local>
 <CA+BoTQkAv_OrJ5cM-wp_fhdb01KV62gLqkXaSikYv9pS9t25eQ@mail.gmail.com>
 <8738hgfi1k.fsf@kamboji.qca.qualcomm.com>
 <EE97821C81277E459BEA5C6384C6F241012F06CC4838@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F06CC4839@srvexch01.SODIELEC.local>
 <87eh0yetyx.fsf@kamboji.qca.qualcomm.com>
 <EE97821C81277E459BEA5C6384C6F241012F06CC483A@srvexch01.SODIELEC.local>,
 <87sip3mdzr.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87sip3mdzr.fsf@kamboji.qca.qualcomm.com>
Content-Language: fr-FR
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Thank you for your response, the problem is solved when I download the late=
st version of backport (3.15) and compile ath10k with it (last time my vers=
ion is 3.13 and as you said, It might not include the patch).
Now I can load the firmware 10.1.467.2-1 but I get new problem too.
Does ath10k support all the command of "iw"?
For example I set up mode access point and tried to change the txpower by t=
he command: "iw wlan0 set txpower fixed 1200" (same thing as "iwconfig wlan=
0 txpower 12dBm" , right?)
The output of "iwconfig" is:
wlan0     IEEE 802.11abgn  Mode:Master  Tx-Power=3D12 dBm                  =
       =

          Retry short limit:7   RTS thr:off   Fragment thr:off             =
     =

          Power Management:on  =


And output of "dmesg":
ath10k: mac config power 12                                                =
     =

ath10k: wmi pdev set param 3 value 24                                      =
     =

ath10k: wmi pdev set param 4 value 24 =


It seems that the command arrives until the level of driver ath10k and work=
s but when I verified by connecting a station to my access point and look a=
t the out put of "iw wlan0 station dump", the value of txpower received at =
the station didn't change even when I changed the txpower of my access poin=
t from 1dBm to 20dBm (my station is near the access point).

Same thing when I do with the command set bit rates: "iw wlan0 set bitrates=
 legacy-2.4 54 ht-mcs-2.4"

Out put of dmesg:
ath10k: mac fixed rate pream 0x00 nss 0x00 rate 0x04                       =
     =

ath10k: wmi vdev id 0x0 set param 27 value 4                               =
     =

ath10k: wmi vdev id 0x0 set param 34 value 1                               =
     =

ath10k: wmi vdev id 0x0 set param 28 value 0                               =
     =

ath10k: wmi event debug mesg len 16  =


But the out put of " iw wlan0 station dump" did not show any change when I =
varied the bit rate of my access point too. =


Do you guys have any suggestion about it?
Thanks in advance :)

NGUYEN Vu Hai
Acita-Sodielec
Route de Mayres - B.P. 9
12100 St GEORGES DE LUZENCON
FRANCE

________________________________________
De : Kalle Valo [kvalo@qca.qualcomm.com]
Date d'envoi : jeudi 24 avril 2014 08:35
=C0 : Vu Hai NGUYEN
Cc : ath10k@lists.infradead.org; Patrick CARNEIRO RODRIGUEZ
Objet : Re: RE : Report Firmware  firmware-2.bin_10.1.467.2-1 Error

Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr> writes:

> There's another problem: when I used the firmware version 999.999 some
> times when I ran my program and change the parameter of configuration,
> the firmware crash and I got a output dmesg which indicate a strange
> version of firmware (1.0.0.636 ???) :
>
> ath10k: firmware crashed!
> ath10k: hardware name qca988x hw2.0 version 0x4100016c
> ath10k: firmware version: 1.0.0.636
> ath10k: target register Dump Location: 0x00401930
> ath10k: target Register Dump
> ath10k: [00]: 0x4100016C 0x00000000 0x0098E3A9 0x00000000
> ath10k: [04]: 0x00000000 0x00000000 0x00000000 0x00000000
> ath10k: [08]: 0x00000000 0x00000000 0x00000000 0x00000000
> ath10k: [12]: 0x00000000 0x00000000 0x00000000 0x00000000
> ath10k: [16]: 0x00000000 0x00000000 0x00000000 0x0098E3A9
> ath10k: [20]: 0x00000000 0x00401930 0x00000000 0x00000000
> ath10k: [24]: 0x00000000 0x00000000 0x00000000 0x00000000
> ath10k: [28]: 0x00000000 0x00000000 0x00000000 0x00000000
> ath10k: [32]: 0x00000000 0x00000000 0x00000000 0x00000000
> ath10k: [36]: 0x00000000 0x00000000 0x00000000 0x00000000
> ath10k: [40]: 0x00000000 0x00000000 0x00000000 0x00000000
> ath10k: [44]: 0x00000000 0x00000000 0x00000000 0x00000000
> ath10k: [48]: 0x00000000 0x00000000 0x00000000 0x00000000
> ath10k: [52]: 0x00000000 0x00000000 0x00000000 0x00000000
> ath10k: [56]: 0x00000000 0x00000000 0x00000000 0x00000000
>
> and then It reload the firmware 999.999.  :
>
> ath10k: firmware 999.999.0.636 booted
>
> You can see the output of my dmesg

The patch below should fix it. I suspect you don't have that.

commit 5ba88b395cb447af756d12411456024d65a07814
Author: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
Date:   Tue Jan 21 17:21:21 2014 +0800

    ath10k: fix the printing of 10.x FW version when FW crashed

    10.x FW has no structure member sw_version_1. Thus,
    both fw_version_release and fw_version_build are not
    available. The provided fw_version_major is also wrong.
    Fix this by using the fw_version from struct wiphy.

    Signed-off-by: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
    Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>


--
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
