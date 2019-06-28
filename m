Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgrC4-0002bg-10
 for ath10k@lists.infradead.org; Fri, 28 Jun 2019 13:45:37 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath10k-firmware: IPQ4018 hw1.0: Add EnGenius ENS620EXT specific
 BDFs
References: <7C60B6E9-D2E1-44C6-8818-5E22D435C4BD@cablelabs.com>
Date: Fri, 28 Jun 2019 16:45:31 +0300
In-Reply-To: <7C60B6E9-D2E1-44C6-8818-5E22D435C4BD@cablelabs.com> (Steve
 Glennon's message of "Mon, 11 Mar 2019 18:41:53 +0000")
Message-ID: <875zopdds4.fsf@kamboji.qca.qualcomm.com>
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
To: Steve Glennon <S.Glennon@cablelabs.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Steve Glennon <S.Glennon@cablelabs.com> writes:

> I am adding support for this device to OpenWrt. This AP requires 
> two special BDFs to get the Wi-Fi PHYs working (correctly). The  bmi-board-
> id='s would clash with one of the the IPQ401X AP-DK boards because QCA doesn't 
> provide special IDs for customers and seems to use the AP-DK board-ids in the 
> wifi firmware to change its behavior.
>
> Now to the questions from the wiki page [1]:
>
> * description for what hardware this is:
>
>   - it is a IPQ4018 based board
>   - one QCA40xx radio is used as 2.4GHz radio
>   - one QCA40xx radio is used as 5GHz radio
>
> * origin of the board file (did you create it yourself or where you
>   downloaded)
>
>   - from stock firmware image
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - QCA4019 hw1.0
>
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=EnGenius-ENS620EXT
>       md5sum:
>       06b06ff901de575a57b054af238c1335
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=EnGenius-ENS620EXT.bin
>       md5sum:
>       7cb23e1ff21179de5c4e726552864285
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=EnGenius-ENS620EXT
bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=EnGenius-ENS620EXT

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 50 in total

https://github.com/kvalo/ath10k-firmware/commit/30a36dcd3c77668891cf12971f80b5cdb4fa851d

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
