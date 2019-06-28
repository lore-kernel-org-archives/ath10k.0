Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgqvy-0003sY-Fp
 for ath10k@lists.infradead.org; Fri, 28 Jun 2019 13:28:59 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add ASUS Lyra specific BDFs
References: <20181217205951.652B2740057@dd16018.kasserver.com>
Date: Fri, 28 Jun 2019 16:28:54 +0300
In-Reply-To: <20181217205951.652B2740057@dd16018.kasserver.com>
 (mail@f0wl.cc's message of "Mon, 17 Dec 2018 21:59:51 +0100 (CET)")
Message-ID: <87pnmxet49.fsf@kamboji.qca.qualcomm.com>
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
To: mail@f0wl.cc
Cc: ath10k@lists.infradead.org

mail@f0wl.cc writes:

> This is a set of board.bin files for the ASUS Lyra MAP-AC2200 Router [0],
> which I wish to be added to the ath10k-firmware repository.
> As per the current "Submitting board files" guidelines [1]:
>
> * description for what hardware this is:
>
>   - it is a IPQ4019 based board [0]
>   - one QCA40xx radio is used as 2.4GHz radio
>   - one QCA40xx radio is used as 5GHz radio
>
> * origin of the board file (did you create it yourself or where you
>   downloaded)
>
> - All files were extracted from official vendor firmware which was on the
> device from the factory
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>   - qca4019 hw1.0
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=ASUS-MAP-AC2200
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=ASUS-MAP-AC2200
>
> * sha256sum of each new board file to add
>     - 87f35885afcb94baa30440f257e5854e5475e7516ca1fdea192f945f914b0395  bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=ASUS-MAP-AC2200.bin
>     - 15a3b3afbdf24b560618f10ff58f0c78cdff757cb4a61c59b2e1ff771499d51f  bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=ASUS-MAP-AC2200.bin
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=ASUS-MAP-AC2200
bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=ASUS-MAP-AC2200

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 41 in total

https://github.com/kvalo/ath10k-firmware/commit/437cbd27a0f65a66bc2a93dc39f9ceb983338bbc

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
