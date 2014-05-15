Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x229.google.com ([2a00:1450:4010:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkqU8-0003JY-RH
 for ath10k@lists.infradead.org; Thu, 15 May 2014 07:53:49 +0000
Received: by mail-la0-f41.google.com with SMTP id e16so505361lan.28
 for <ath10k@lists.infradead.org>; Thu, 15 May 2014 00:53:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F109978CC@srvexch01.SODIELEC.local>
References: <1399565896-29791-1-git-send-email-greearb@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBC@srvexch01.SODIELEC.local>
 <5370F41A.70202@candelatech.com>
 <CAHqTa-1xYF=eO-Ai5UMF4BuzzLa84SrzayiGZVmt0jaGs5sZDQ@mail.gmail.com>
 <53719332.9040700@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBD@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978CC@srvexch01.SODIELEC.local>
Date: Thu, 15 May 2014 09:53:25 +0200
Message-ID: <CALhHN=pYabdKjUwBZqAr-a-uoJvn+PZvF2qDjXduoBRhyV2ybg@mail.gmail.com>
Subject: Re: ath10k: firmware crash in station mode
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 15 May 2014 09:07, Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr> wrote:
> I tried to set up station mode using ath10k and wpa_supplicant.
> If I used the firmware in branch 10.1 version firmware-2.bin_10.1.467.2-1 (which said that support STA mode but not well tested) , it crashed after associating with the access point:
>
> wlan0: SME: Trying to authenticate with 00:15:61:10:51:de (SSID='actia' freq=2457 MHz)
> wlan0: authenticate with 00:15:61:10:51:de
> wlan0: send auth to 00:15:61:10:51:de (try 1/3)
> wlan0: authenticated
> wlan0: Trying to associate with 00:15:61:10:51:de (SSID='actia' freq=2457 MHz)
> wlan0: associate with 00:15:61:10:51:de (try 1/3)
> wlan0: RX AssocResp from 00:15:61:10:51:de (capab=0x421 status=0 aid=1)
> wlan0: associated
> ath10k: firmware crashed!
> ath10k: hardware name qca988x hw2.0 version 0x4100016c
> ath10k: firmware version: 10.1.467.2-1
> ath10k: target register Dump Location: 0x00401930
> ath10k: target Register Dump
> ath10k: [00]: 0x4100016C 0x00000000 0x009A123A 0x00000000
> ath10k: [04]: 0x00000000 0x00000000 0x00000000 0x00000000
> ath10k: [08]: 0x00000000 0x00000000 0x00000000 0x00000000
> ath10k: [12]: 0x00000000 0x00000000 0x00000000 0x00000000
> ath10k: [16]: 0x00000000 0x00000000 0x00000000 0x009A123A
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
> br0: received packet on eth0 with own address as source address
> ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
> br0: port 2(wlan0) entering forwarding state
> br0: port 2(wlan0) entering forwarding state
> wlan0: Associated with 00:15:61:10:51:de
> ath10k: failed to put down monitor vdev 1: -11
> ath10k: failed to to request monitor vdev 1 stop: -11
> ath10k: failed to synchronise monitor vdev 1: -110
> ath10k: failed to stop monitor vdev: -110
> ath10k: failed to request wmi monitor vdev 1 removal: -11
> ath10k: failed to delete monitor vdev: -11
> ieee80211 phy0: Hardware restart was requested
> ath10k: failed to request monitor vdev 2 creation: -108
> ath10k: failed to create monitor vdev: -108
> ath10k: failed to start monitor (promisc): -108
> wlan0: CTRL-EVENT-CONNECTED - Connection to 00:15:61:10:51:de completed [id=0 id_str=]
> ath10k: device has crashed during init
> ath10k: failed to wait for target to init: -70
> ath10k: failed to power up target using warm reset: -70
> ath10k: trying cold reset
>
> Than I tried another version of firmware from branch 999. (which said that support STA mode) but it worse, the firmware crashed before seeing the access point. (can not associate)
> This crashed is because of my system or just only the firmware issue? And is the firmware still continue developping? (There is a debug message of my system in the attached file if any one are interested in)
>
> Btw is there anyone could set a channel (from 52 and more) that employs DFS sucessfully confirm it for me cause I can not do it until now :D
What kind of error you see?

BTW, what is your system configuration, is that PC or some other board
(openwrt ...). What kernel version are you using? Did you change/hack
ath.ko regdb?
If that is PC I would recommend to use ath10k kernel from github.

BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
