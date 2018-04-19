Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9BBS-0005OV-E7
 for ath10k@lists.infradead.org; Thu, 19 Apr 2018 15:09:22 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add 8devices Jalapeno specific
 BDFs
References: <6639675.YhR1lM3HRH@bentobox>
Date: Thu, 19 Apr 2018 18:08:57 +0300
In-Reply-To: <6639675.YhR1lM3HRH@bentobox> (Sven Eckelmann's message of "Thu, 
 01 Mar 2018 11:39:04 +0100")
Message-ID: <871sfbkzcm.fsf@kamboji.qca.qualcomm.com>
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
To: Sven Eckelmann <sven@narfation.org>
Cc: Robert Marko <robimarko@gmail.com>, ath10k@lists.infradead.org, Mantas Pucka <mantas@8devices.com>

Sven Eckelmann <sven@narfation.org> writes:

> Robert Marko is currently trying to integrate the support for 8devices 
> Jalapeno in OpenWrt [1]. This module/board requires two special BDFs to get 
> the Wi-Fi PHYs working (correctly). The bmi-board-id='s would clash with one 
> of the the IPQ401X AP-DK boards because QCA doesn't provide special IDs for 
> customers and seems to use the AP-DK board-ids in the wifi firmware to change 
> its behavior.
>
> Now to the questions from the wiki page [2]:
>
> * description for what hardware this is:
>
>   - it is a QCA401x based module (based on qcom-ipq4019-ap.dk01.1)
>   - see OpenWrt pull request for more information [1]
>
> * origin of the board file (did you create it yourself or where you
>   downloaded)
>
>   - it was given to us by 8devices for upstreaming [3]
>   - https://github.com/mantas-p/files/tree/master/jalapeno_bdf
>   - it is the version 1.6
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=8devices-Jalapeno
>     sha256sum:
>     2f45bd90243558a98df02abf8d29fb4975bac72b25bc21ccdaae5910c18e9d67
>   - bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=8devices-Jalapeno
>     sha256sum:
>     7721b7f26e15291b007774e7dd93e9b750a06778c27304263ef6899ecbcfd5ee
>
> * attach the actual board file (board.bin)
>
>   - see attachments (except the board-8dev_jalapeno.bin which is for Robert's
>     OpenWrt tests)
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

I added these now, please check:

https://github.com/kvalo/ath10k-firmware/commit/71e50312b54cc972657a7b08c470088447cb9676

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=8devices-Jalapeno

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 26 in total

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=8devices-Jalapeno

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 27 in total

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
