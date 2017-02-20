Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cfoxX-0005aO-Mz
 for ath10k@lists.infradead.org; Mon, 20 Feb 2017 14:29:04 +0000
References: <CACBNxUG+N7X6pxcTqTeESVt9O_KOhH0BHL9daoTmUKj8N1pt0g@mail.gmail.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <2211d504-f2e0-b498-e56c-f869e2b7bbf7@dd-wrt.com>
Date: Mon, 20 Feb 2017 15:28:23 +0100
MIME-Version: 1.0
In-Reply-To: <CACBNxUG+N7X6pxcTqTeESVt9O_KOhH0BHL9daoTmUKj8N1pt0g@mail.gmail.com>
Subject: Re: ath10k: MAC Address
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "K.Mani" <sailormani@gmail.com>, ath10k@lists.infradead.org

Am 20.02.2017 um 11:58 schrieb K.Mani:
> I'm using QCA8994, with PCIe bus the first two bytes of MAC address is
> returned as Null. This behavior is seen on all the 6 devices.
>
> log: wmi event ready sw_version 16777216 abi_version 3 mac_addr
> 00:00:79:55:a0:14
>
> Annapurna board(Alpine soc V1) on kernel-linux-3.10.20 openWRT
> FW: board-2.bin, firmware-5.bin
i ported this annapura device to dd-wrt. consider to use the correct =

board data for each indepenend wifi card
both board datas are stored in the "art" mtd partition, but you need to =

patch ath10k to use independend board data for each radio. otherwise the =

second radio will not work in 2.4 ghz

> Help needed.
>
> Thanks
> Mani
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>


-- =

Mit freundlichen Gr=FCssen / Regards

Sebastian Gottschall / CTO

NewMedia-NET GmbH - DD-WRT
Firmensitz:  Berliner Ring 101, 64625 Bensheim
Registergericht: Amtsgericht Darmstadt, HRB 25473
Gesch=E4ftsf=FChrer: Peter Steinh=E4user, Christian Scheele
http://www.dd-wrt.com
email: s.gottschall@dd-wrt.com
Tel.: +496251-582650 / Fax: +496251-5826565


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
