Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gS0RZ-0002Ee-0L
 for ath10k@lists.infradead.org; Wed, 28 Nov 2018 14:03:59 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: missing firmware in debian 9
References: <20181116133851.czjhgfmttodnudzg@adell35>
 <6892054.LxBMB1ZCDT@bentobox>
Date: Wed, 28 Nov 2018 16:03:42 +0200
In-Reply-To: <6892054.LxBMB1ZCDT@bentobox> (Sven Eckelmann's message of "Mon, 
 26 Nov 2018 09:48:17 +0100")
Message-ID: <87h8g170zl.fsf@kamboji.qca.qualcomm.com>
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
To: Sven Eckelmann <sven.eckelmann@openmesh.com>
Cc: Anil Duggirala <anilduggirala@fastmail.fm>, ath10k@lists.infradead.org, debian-kernel@lists.debian.org

Sven Eckelmann <sven.eckelmann@openmesh.com> writes:

> On Freitag, 16. November 2018 08:38:51 CET Anil Duggirala wrote:
>> hello,
>> I am getting this message at boot.
>> 
>> [ 10.678576] ath10k_pci 0000:03:00.0: firmware: failed to load
>> ath10k/pre-cal-pci-0000:03:00.0.bin (-2)
>> [ 10.678631] ath10k_pci 0000:03:00.0: Direct firmware load for
>> ath10k/pre-cal-pci-0000:03:00.0.bin failed with error -2
>> [ 10.678655] ath10k_pci 0000:03:00.0: firmware: failed to load
>> ath10k/cal-pci-0000:03:00.0.bin (-2)
>> [ 10.678699] ath10k_pci 0000:03:00.0: Direct firmware load for
>> ath10k/cal-pci-0000:03:00.0.bin failed with error -2
>> [ 10.681081] ath10k_pci 0000:03:00.0: firmware: failed to load
>> ath10k/QCA6174/hw3.0/firmware-5.bin (-2)
>> [ 10.681127] ath10k_pci 0000:03:00.0: Direct firmware load for
>> ath10k/QCA6174/hw3.0/firmware-5.bin failed with error -2
>> [ 10.681131] ath10k_pci 0000:03:00.0: could not fetch firmware file
>> 'ath10k/QCA6174/hw3.0/firmware-5.bin': -2
>> 
>> I have installed the firmware-atheros package from backports in
>> Debian 9, I had installed the package from the main repository
>> before but I was also getting this message. I have also installed
>> the firmware-linux-free package.
>
> Where should Debian take it when QCA is not providing a firmware-5.bin? Kalle 
> Valo's repo [1] contains different firmware-6.bin (which your ath10k version 
> doesn't seem to support yet) and firmware-4.bin. And Debian ships both - I 
> think the ones which were in linux-firmware [2] at the time of the release.
>
> I don't have a QCA6174 hw3.0 but I would guess that ath10k loaded the
> firmware-4.bin after it failed to load the firmware-5.bin.

That's what I'm guessing as well. And these warnings should be visible
anymore with this commit:

c8e028026387 ath10k: use firmware_request_nowarn() to load firmware

https://git.kernel.org/linus/c8e028026387

It was introduced in v4.18 so once you upgrade the kernel to v4.18 or
later you should not see the warnings anymore.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
