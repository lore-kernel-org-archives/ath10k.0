Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgr2d-0006o0-5t
 for ath10k@lists.infradead.org; Fri, 28 Jun 2019 13:35:52 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add Qxwlan E2600AC specific BDFs
References: <tencent_9DDF95DF96EF68F50B6B6DC8FE5D21E63C0A@qq.com>
Date: Fri, 28 Jun 2019 16:35:47 +0300
In-Reply-To: <tencent_9DDF95DF96EF68F50B6B6DC8FE5D21E63C0A@qq.com> (Theone's
 message of "Sat, 5 Jan 2019 10:26:44 +0800")
Message-ID: <87ef3desss.fsf@kamboji.qca.qualcomm.com>
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
To: Theone <1805692831@qq.com>
Cc: ath10k <ath10k@lists.infradead.org>

"Theone" <1805692831@qq.com> writes:

> * description for what hardware this is:
>
>   - it is a IPQ4018 based board (AP-DK07-C1)
>   - one QCA40xx radio is used as 2.4/5 GHz radio
>   - one QCA40xx radio is used as 5GHz radio
>
> * origin of the board file (did you create it yourself or where you
>   downloaded)
>
>   - The board file(s) where extracted from the Qxwlan firmware. 
>   - The files in this email are:
>     * board_wifi0_2g.bin
>     * board_wifi0_5g.bin
>     * board_wifi1_5g.bin
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - QCA4019 hw1.0
>
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=28,variant=Qxwlan-E2600AC
>       sha256sum:
>       4d8d5ca0f2de7bdf4dc6e3c65c381ffa7eea16bd42dd5b74b0a30f1a41b49e5b
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=29,variant=Qxwlan-E2600AC
>       sha256sum:
>       07363a402ac058ddb96f2f4938bae88e89260b52df3af8a6fd6cd2575d93294f
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=30,variant=Qxwlan-E2600AC
>       sha256sum:
>       8ba890b8b34f6ac0cd4c3504bcecad001c8c7bc329d19f4627ecddc5b099e586
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

I dropped this due to duplicate submissions.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
