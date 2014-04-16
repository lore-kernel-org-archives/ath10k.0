Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailhost.actiasodielec.fr ([89.91.64.97])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaOQ2-0004Qb-Mg
 for ath10k@lists.infradead.org; Wed, 16 Apr 2014 11:54:23 +0000
Received: (from uucp@localhost) by mailhost.actiasodielec.fr id s3GBr1Ri001984
 for <ath10k@lists.infradead.org>; Wed, 16 Apr 2014 13:53:01 +0200
From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Wed, 16 Apr 2014 13:51:04 +0200
Subject: RE : Report Firmware  firmware-2.bin_10.1.467.2-1 Error
Message-ID: <EE97821C81277E459BEA5C6384C6F241012F06CC483A@srvexch01.SODIELEC.local>
References: <53461A8A.4030209@candelatech.com>
 <1397124355-6321-1-git-send-email-michal.kazior@tieto.com>
 <8738hkh193.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQ=gUBsw43M2at0y7iZU3VhwdjH9EBqzdOmKpxLjjqusPw@mail.gmail.com>
 <CA+BoTQ=L7Cj5V04RGEFcdGm1rxEO8NOYMEhSRiQNdoBoMTm5Pg@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F06CC4837@srvexch01.SODIELEC.local>
 <CA+BoTQkAv_OrJ5cM-wp_fhdb01KV62gLqkXaSikYv9pS9t25eQ@mail.gmail.com>
 <8738hgfi1k.fsf@kamboji.qca.qualcomm.com>
 <EE97821C81277E459BEA5C6384C6F241012F06CC4838@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F06CC4839@srvexch01.SODIELEC.local>,
 <87eh0yetyx.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87eh0yetyx.fsf@kamboji.qca.qualcomm.com>
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>

Thank you for your response,
I didn't power down my cible to reboot, I just upload new program with new =
firmware and run it. The problem is when that error appear my console keep =
print it and I Have no longer access to my system, I can not type another c=
ommand (dmesg) , then I have to reset my platform. I'll try to get the dmes=
g and sent you later.
My host platform is using processor Marvell Armada 370 and my module of wif=
i is Compex WLE900VX.
There's another problem: when I used the firmware version 999.999 some time=
s when I ran my program and change the parameter of configuration, the firm=
ware crash and I got a output dmesg which indicate a strange version of fir=
mware (1.0.0.636 ???) : =


ath10k: firmware crashed!                                                  =
     =

ath10k: hardware name qca988x hw2.0 version 0x4100016c                     =
     =

ath10k: firmware version: 1.0.0.636 =

ath10k: target register Dump Location: 0x00401930                          =
     =

ath10k: target Register Dump                                               =
     =

ath10k: [00]: 0x4100016C 0x00000000 0x0098E3A9 0x00000000                  =
     =

ath10k: [04]: 0x00000000 0x00000000 0x00000000 0x00000000                  =
     =

ath10k: [08]: 0x00000000 0x00000000 0x00000000 0x00000000                  =
     =

ath10k: [12]: 0x00000000 0x00000000 0x00000000 0x00000000                  =
     =

ath10k: [16]: 0x00000000 0x00000000 0x00000000 0x0098E3A9                  =
     =

ath10k: [20]: 0x00000000 0x00401930 0x00000000 0x00000000                  =
     =

ath10k: [24]: 0x00000000 0x00000000 0x00000000 0x00000000                  =
     =

ath10k: [28]: 0x00000000 0x00000000 0x00000000 0x00000000                  =
     =

ath10k: [32]: 0x00000000 0x00000000 0x00000000 0x00000000                  =
     =

ath10k: [36]: 0x00000000 0x00000000 0x00000000 0x00000000                  =
     =

ath10k: [40]: 0x00000000 0x00000000 0x00000000 0x00000000                  =
     =

ath10k: [44]: 0x00000000 0x00000000 0x00000000 0x00000000                  =
     =

ath10k: [48]: 0x00000000 0x00000000 0x00000000 0x00000000                  =
     =

ath10k: [52]: 0x00000000 0x00000000 0x00000000 0x00000000                  =
     =

ath10k: [56]: 0x00000000 0x00000000 0x00000000 0x00000000    =


and then It reload the firmware 999.999.  :

ath10k: firmware 999.999.0.636 booted

You can see the output of my dmesg =



NGUYEN Vu Hai
Acita-Sodielec
Route de Mayres - B.P. 9
12100 St GEORGES DE LUZENCON
FRANCE

________________________________________
De : Kalle Valo [kvalo@qca.qualcomm.com]
Date d'envoi : mardi 15 avril 2014 13:02
=C0 : Vu Hai NGUYEN
Cc : ath10k@lists.infradead.org; Patrick CARNEIRO RODRIGUEZ
Objet : Re: Report Firmware  firmware-2.bin_10.1.467.2-1 Error

Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr> writes:

> When I load the firmware-2.bin_10.1.467.2-1 I got this error when I
> put my device in mode ACCESS POINT: "PCI express error: irq - 228, Pex
> number: 0, Interrupt Cause Register value: 10" But if I use the
> version 999.999.0.x. I don't have this error.

I wonder if this has something to do with cold reset causing PCI bus
errors? But we need more information to say more. Can you send the full
dmesg output (from the beginning of kernel boot) along with detailed
descriptions of your host platform and what kind qca98xx board you have.

Even better is if you can also send a debug log output using debug mask
value 0x432. More info:

http://wireless.kernel.org/en/users/Drivers/ath10k/debug#Useful_debug_masks

--
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
