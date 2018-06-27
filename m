Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYCgu-0001J2-A7
 for ath10k@lists.infradead.org; Wed, 27 Jun 2018 15:49:09 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add ZyXEL WRE6606 specific BDFs
References: <ab6baeb5-3f07-78a0-e62e-4b4154b8c82d@darmstadt.ccc.de>
Date: Wed, 27 Jun 2018 18:48:53 +0300
In-Reply-To: <ab6baeb5-3f07-78a0-e62e-4b4154b8c82d@darmstadt.ccc.de>
 (skorpy@darmstadt.ccc.de's message of "Tue, 19 Jun 2018 22:06:32
 +0200")
Message-ID: <87vaa4s00q.fsf@kamboji.qca.qualcomm.com>
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
To: Skorpy <skorpy@darmstadt.ccc.de>
Cc: ath10k@lists.infradead.org

Skorpy <skorpy@darmstadt.ccc.de> writes:

> Hi,
>
> This is a set of board.bin files for the ZyXEL WRE6606 Router [0],
> which I wish to be added to the ath10k-firmware repository.
>
>
> As per the current "Submitting board files" guidelines [1]:
>
> * description for what hardware this is:
>
>   - it is a IPQ4018 based board [0]
>   - one QCA40xx radio is used as 2.4GHz radio
>   - one QCA40xx radio is used as 5GHz radio
>
> * origin of the board file (did you create it yourself or where you
>   downloaded)
>
>   - All files were extracted from official vendor firmware which was
> on the device from the factory
>   - Boardfiles also included in the vendor firmware image of the NBG6617
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>   - qca4019 hw1.0
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=24,variant=ZyXEL-WRE6606
>
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=25,variant=ZyXEL-WRE6606
>
> * sha256sum of each new board file to add
>    - bus=ahb,bmi-chip-id=0,bmi-board-id=24,variant=ZyXEL-WRE6606
>      has sha256sum:
> 1aeae4981217b63883e20ecbab6380aff404985485bf1e881fb0fc874f2a0883
>
>    - bus=ahb,bmi-chip-id=0,bmi-board-id=25,variant=ZyXEL-WRE6606
>      has sha256sum:
> 469e81fd2593cba442c0d810ce92309bb92eaa42bbddbbbf4ec051fabd345ecf
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")
>
> Kind regards,
> Magnus

Please resubmit using your full name.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
