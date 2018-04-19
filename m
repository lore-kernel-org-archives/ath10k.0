Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9850-0000Ww-Lz
 for ath10k@lists.infradead.org; Thu, 19 Apr 2018 11:50:24 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add FRITZ!Box 4040 specific BDFs
References: <10659485.WSGLUWTQ6L@bentobox>
Date: Thu, 19 Apr 2018 14:50:06 +0300
In-Reply-To: <10659485.WSGLUWTQ6L@bentobox> (Sven Eckelmann's message of "Tue, 
 17 Apr 2018 10:15:42 +0200")
Message-ID: <87vacnl8k1.fsf@kamboji.qca.qualcomm.com>
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
Cc: Christian Lamparter <chunkeey@googlemail.com>, ath10k@lists.infradead.org

Sven Eckelmann <sven.eckelmann@openmesh.com> writes:

> The support for this device was added a while ago to OpenWrt. This AP requires 
> two special BDFs to get the Wi-Fi PHYs working (correctly). The  bmi-board-
> id='s would clash with one of the the IPQ401X AP-DK boards because QCA doesn't 
> provide special IDs for customers and seems to use the AP-DK board-ids in the 
> wifi firmware to change its behavior.
>
> Now to the questions from the wiki page [1]:
>
> * description for what hardware this is:
>
>   - it is a QCA401x based board (most likely on qcom-ipq4019-ap.dk01.1)
>   - one QCA40xx radio is used as 2.4GHz radio
>   - one QCA40xx radio is used as 5GHz radio
>
> * origin of the board file (did you create it yourself or where you
>   downloaded)
>
>   - Christian didn't include this info in the OpenWrt commit (maybe he can add
>     it here)
>   - most likely taken from stock firmware image
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - QCA4019 hw1.0
>
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=AVM-FRITZBox-4040
>       sha256sum:
>       eb866d036149fe4ba35f3f9d0d97e51969b1f1dbac6ea962daf9012ffa75427a
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=AVM-FRITZBox-4040
>       sha256sum:
>       f3dc3c2f10037722006e9e7e5173a7468649e9a554f564323f9580f4a8bba10a
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Added, please check the results:

https://github.com/kvalo/ath10k-firmware/commit/81a745e6a529565438ee4aea357a8a59e9564848

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=AVM-FRITZBox-4040

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 17 in total



New:
bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=AVM-FRITZBox-4040

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 18 in total

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
