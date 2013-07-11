Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UxCcL-0001Zd-Gv
 for ath10k@lists.infradead.org; Thu, 11 Jul 2013 08:52:51 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: wmi service ready event not received
References: <1373438217.73020278@f256.mail.ru>
Date: Thu, 11 Jul 2013 11:52:19 +0300
In-Reply-To: <1373438217.73020278@f256.mail.ru> (Nikolay Dyatchenko's message
 of "Wed, 10 Jul 2013 10:36:57 +0400")
Message-ID: <877ggx7a2k.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Nikolay Dyatchenko <cybernik@bk.ru>
Cc: ath10k <ath10k@lists.infradead.org>

Nikolay Dyatchenko <cybernik@bk.ru> writes:

> I try use mini pci-e card (from WDR-7500) with firmware for hw1.0, but i get error "wmi service ready event not received":
> [root@localhost ~]# lspci | grep Atheros
> 02:00.0 Network controller: Atheros Communications Inc. AR9300 Wireless LAN adaptor (rev 01)
> 03:00.0 Network controller: Atheros Communications Inc. Device 003c
> [root@localhost ~]# dmesg | grep ath10
> [ 34.712886] ath10k_pci 0000:03:00.0: BAR 0: assigned [mem 0xc0600000-0xc07fffff 64bit]
> [ 34.713762] ath10k: MSI-X didn't succeed (1), trying MSI
> [ 34.713820] ath10k_pci 0000:03:00.0: irq 48 for MSI/MSI-X
> [ 34.713896] ath10k: MSI interrupt handling
> [ 34.742881] ath10k: Hardware name qca988x hw1.0 version 0x4000002c
> [ 38.377544] ath10k: UART prints disabled
> [ 38.382971] ath10k: HTC Service HTT Data does not allocate target credits
> [ 38.384918] ath10k: Unknown eventid: 32768
> [ 43.388470] ath10k: wmi service ready event not received
> [ 43.389917] ath10k: could not register driver core (-110)
> [ 43.390241] ath10k_pci: probe of 0000:03:00.0 failed with error -110
>
> I'ts normal situation? I get firmware for hw1.0 from Archer C7 tp-link firmware.

The unknown event id 32768 implies that you are using wrong firmware
version. Where did you get it?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
