Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f96YL-0002VH-EH
 for ath10k@lists.infradead.org; Thu, 19 Apr 2018 10:12:34 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath10k-firmware: QCA4019 hw1.0/QCA9888 hw2.0: Add OpenMesh A62
 specific BDFs
References: <3706510.gbe5VexPLA@bentobox>
Date: Thu, 19 Apr 2018 13:12:19 +0300
In-Reply-To: <3706510.gbe5VexPLA@bentobox> (Sven Eckelmann's message of "Thu, 
 29 Mar 2018 12:11:02 +0200")
Message-ID: <874lk7mrng.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath10k@lists.infradead.org

Sven Eckelmann <sven.eckelmann@openmesh.com> writes:

> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - QCA4019 hw1.0
>
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=OM-A62
>       sha256sum:
>       df5dc5a55506e2a58dcb0b8542f40226d3bfd530a6fc0bc90c728ab18a57144c
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=OM-A62
>       sha256sum:
>       96c3d044fe26522c75313c210ace6f85d5bdcdbce3350214d92467501a01fb88
>
>   - QCA9888 hw2.0
>
>     + bus=pci,bmi-chip-id=0,bmi-board-id=16,variant=OM-A62
>       sha256sum:
>       c85b23763e748abeb7e8c42e243dab1fc58d1bff94111e4058bdf31ddb14cefa

BTW, in the future md5sum would be more useful as ath10k-bdencoder
--info prints that. I added that to the wiki as well:

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/boardfiles

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
