Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgr3I-00071g-Ka
 for ath10k@lists.infradead.org; Fri, 28 Jun 2019 13:36:33 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add Qxwlan E2600AC specific BDFs
References: <tencent_65F0DF86E55F2622C233457975F99096AF06@qq.com>
Date: Fri, 28 Jun 2019 16:36:18 +0300
In-Reply-To: <tencent_65F0DF86E55F2622C233457975F99096AF06@qq.com> (Theone's
 message of "Thu, 10 Jan 2019 18:18:50 +0800")
Message-ID: <875zopesrx.fsf@kamboji.qca.qualcomm.com>
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

> For the questions from the wiki page:
>
> * description for what hardware this is:
>
>   - it is a IPQ4019 based board (AP-DK07-C1)
>   - one QCA40xx radio is used as 5 GHz radio
>   - one QCA40xx radio is used as 5GHz radio
>
> * origin of the board file (did you create it yourself or where you
>   downloaded)
>
>   - The board file(s) where extracted from the Qxwlan firmware. 
>   - The files in this email are:
>     * board-wifi0-5g.bin
>     * board-wifi1-5g.bin
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - QCA4019 hw1.0
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=29,variant=Qxwlan-E2600AC
>       sha256sum:
>       6706954c7b363911bb84d4b70f90312e665701acca2dba40f2397e6cd6d6c000
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=30,variant=Qxwlan-E2600AC
>       sha256sum:
>      70dd461cf1dd44b443d903ea5d3aa4efbaa376dfbb3d7983dcbcf9b125e8a9d5
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
