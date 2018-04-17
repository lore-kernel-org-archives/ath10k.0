Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x234.google.com ([2a00:1450:400c:c0c::234])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f8O0C-000861-0o
 for ath10k@lists.infradead.org; Tue, 17 Apr 2018 10:38:21 +0000
Received: by mail-wr0-x234.google.com with SMTP id s18so34076652wrg.9
 for <ath10k@lists.infradead.org>; Tue, 17 Apr 2018 03:38:09 -0700 (PDT)
From: Christian Lamparter <chunkeey@gmail.com>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add FRITZ!Box 4040 specific BDFs
Date: Tue, 17 Apr 2018 12:38:05 +0200
Message-ID: <1732844.fSHK0DcULO@debian64>
In-Reply-To: <10659485.WSGLUWTQ6L@bentobox>
References: <10659485.WSGLUWTQ6L@bentobox>
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
Cc: Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org

On Tuesday, 17. April 2018 10:15:42 CEST Sven Eckelmann wrote:
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
Yes, the files are coming from the stock firmware image. The firmware image:
FRITZ.Box_4040.en-de-es-it-fr-pl.155.06.83.image can be found here [0].

In order to extract board data files:
 0. Download FRITZ.Box_4040.en-de-es-it-fr-pl.155.06.83.image
 1. tar xf FRITZ.Box_4040.en-de-es-it-fr-pl.155.06.83.image
 2. binwalk -e ./var/tmp/kernel.image

The boarddata_0.bin and boarddata_1.bin are located in:
 ./_kernel.image.extracted/squashfs-root/lib/firmware/IPQ4019/hw.1

eb866d036149fe4ba35f3f9d0d97e51969b1f1dbac6ea962daf9012ffa75427a  boarddata_0.bin
f3dc3c2f10037722006e9e7e5173a7468649e9a554f564323f9580f4a8bba10a  boarddata_1.bin

The boarddata_0.bin file matches the
"bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=AVM-FRITZBox-4040" 
file Sven attached (see checksums down below). And the boarddata_1.bin 
file matches the 
"bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=AVM-FRITZBox-4040" file
 
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
> 
> Kind regards,
>         Sven
> 
> [1] https://wireless.wiki.kernel.org/en/users/drivers/ath10k/boardfiles

[0] <http://ftp.avm.de/fritzbox/fritzbox-4040/deutschland/fritz.os/FRITZ.Box_4040.en-de-es-it-fr-pl.155.06.83.image>



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
