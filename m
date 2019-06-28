Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgrBR-0001Ik-2P
 for ath10k@lists.infradead.org; Fri, 28 Jun 2019 13:44:58 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add AVM FRITZ!Repeater 3000
 specific BDFs
References: <154c0e78-e6df-ffe3-035b-d1e11d35f36f@david-bauer.net>
Date: Fri, 28 Jun 2019 16:44:52 +0300
In-Reply-To: <154c0e78-e6df-ffe3-035b-d1e11d35f36f@david-bauer.net> (David
 Bauer's message of "Sat, 9 Mar 2019 00:26:56 +0100")
Message-ID: <87a7e1ddt7.fsf@kamboji.qca.qualcomm.com>
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
To: David Bauer <mail@david-bauer.net>
Cc: ath10k@lists.infradead.org

David Bauer <mail@david-bauer.net> writes:

> this is a set of board.bin files for the AVM FRITZ!Repeater 3000 [0],
> which I wish to be added to the ath10k-firmware repository.
>
> As per the current "Submitting board files" guidelines [1]:
>
> * description for what hardware this is:
>   - it is a IPQ4019 based board [0]
>     - one QCA40xx radio is used as 2.4 GHz radio
>     - one QCA40xx radio is used as 5 GHz radio
>
> * origin of the board file (did you create it yourself or where you
>   downloaded)
>   - all files were extracted from official vendor firmware which was on
> the device and can be downloaded from AVM [2]
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>   - qca4019 hw1.0
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=AVM-FRITZRepeater-3000
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=AVM-FRITZRepeater-3000
> * sha256sum of each new board file to add
>   - bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=AVM-FRITZRepeater-3000
>     - c7b6026635bd32fe0709600edb024e1752151a0d038a1a8830f847bb815ad32b
>   - bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=AVM-FRITZRepeater-3000
>     - 5191621ea04058dad1709c492c559de24454374c9d286582154ff94a1978d248
>
> * attach the actual board file (board.bin)
>   - the name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=AVM-FRITZRepeater-3000
bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=AVM-FRITZRepeater-3000

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 48 in total

https://github.com/kvalo/ath10k-firmware/commit/1d86284494beb1f796bf7a5fddac04b4e7f5c302

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
