Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from f256.mail.ru ([94.100.178.221])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uwo1m-0003fr-LN
 for ath10k@lists.infradead.org; Wed, 10 Jul 2013 06:37:29 +0000
Received: from mail by f256.mail.ru with local (envelope-from <cybernik@bk.ru>)
 id 1Uwo1J-0003Ja-6o
 for ath10k@lists.infradead.org; Wed, 10 Jul 2013 10:37:04 +0400
From: =?UTF-8?B?Tmlrb2xheSBEeWF0Y2hlbmtv?= <cybernik@bk.ru>
Subject: =?UTF-8?B?d21pIHNlcnZpY2UgcmVhZHkgZXZlbnQgbm90IHJlY2VpdmVk?=
Mime-Version: 1.0
Date: Wed, 10 Jul 2013 10:36:57 +0400
Message-ID: <1373438217.73020278@f256.mail.ru>
Reply-To: =?UTF-8?B?Tmlrb2xheSBEeWF0Y2hlbmtv?= <cybernik@bk.ru>
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
To: =?UTF-8?B?YXRoMTBr?= <ath10k@lists.infradead.org>

Hello!

I try use mini pci-e card (from WDR-7500) with firmware for hw1.0, but i get error "wmi service ready event not received":
[root@localhost ~]# lspci | grep Atheros
02:00.0 Network controller: Atheros Communications Inc. AR9300 Wireless LAN adaptor (rev 01)
03:00.0 Network controller: Atheros Communications Inc. Device 003c
[root@localhost ~]# dmesg | grep ath10
[ 34.712886] ath10k_pci 0000:03:00.0: BAR 0: assigned [mem 0xc0600000-0xc07fffff 64bit]
[ 34.713762] ath10k: MSI-X didn't succeed (1), trying MSI
[ 34.713820] ath10k_pci 0000:03:00.0: irq 48 for MSI/MSI-X
[ 34.713896] ath10k: MSI interrupt handling
[ 34.742881] ath10k: Hardware name qca988x hw1.0 version 0x4000002c
[ 38.377544] ath10k: UART prints disabled
[ 38.382971] ath10k: HTC Service HTT Data does not allocate target credits
[ 38.384918] ath10k: Unknown eventid: 32768
[ 43.388470] ath10k: wmi service ready event not received
[ 43.389917] ath10k: could not register driver core (-110)
[ 43.390241] ath10k_pci: probe of 0000:03:00.0 failed with error -110

I'ts normal situation? I get firmware for hw1.0 from Archer C7 tp-link firmware.


wbr,
Nikolay Dyatchenko 
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
