Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9ArY-0000D9-Aj
 for ath10k@lists.infradead.org; Thu, 19 Apr 2018 14:48:53 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: QCA4019 hw1.0 - BDFs for Netgear EX6100v2 and EX6150v2
References: <5d098a2a-6f51-3be6-53c5-1ac7927f8edf@gmail.com>
Date: Thu, 19 Apr 2018 17:48:25 +0300
In-Reply-To: <5d098a2a-6f51-3be6-53c5-1ac7927f8edf@gmail.com> (Thomas Hebb's
 message of "Tue, 20 Feb 2018 19:13:11 -0500")
Message-ID: <87efjbl0au.fsf@kamboji.qca.qualcomm.com>
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
To: Thomas Hebb <tommyhebb@gmail.com>
Cc: ath10k@lists.infradead.org

Thomas Hebb <tommyhebb@gmail.com> writes:

> This is a set of board.bin files for the Netgear EX6100v2 [1] and
> EX6150v2 [2] Wi-Fi range extenders. There are two files per device,
> one for the 2.4GHz radio and one for the 5GHz one. All files were
> extracted from Netgear's official v1.0.1.54 software update [3], which
> runs on both devices.
>
> The IDs to add are as follows (attachments named accordingly):
>
> - bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=Netgear-EX6100v2
>   sha1: ad3a4a9ad144805b78d057e2009c1012546aa9d6
> - bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=Netgear-EX6100v2
>   sha1: 8eccb56666c804bd95577211c843cdc5c060c98f
> - bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=Netgear-EX6150v2
>   sha1: 319cad95f0b9605065cff3a21bed96a4c6af0dfa
> - bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=Netgear-EX6150v2
>   sha1: 19a00b2ae2ff9560329c3d65697ee1d738211181
>
> Let me know if you need any more information.

Added now, please check carefully:

https://github.com/kvalo/ath10k-firmware/commit/dfe4b7de42e1c40dfd03526ffe7955089c4eef63

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=Netgear-EX6100v2

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 20 in total

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=Netgear-EX6150v2

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 21 in total

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=Netgear-EX6100v2

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 22 in total

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=Netgear-EX6150v2

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 23 in total


-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
