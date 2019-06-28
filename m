Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgr8k-0000ZQ-FD
 for ath10k@lists.infradead.org; Fri, 28 Jun 2019 13:42:11 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add ALFA Network AP120C-AC
 specific BDF
References: <39b9616c-592c-1560-b3df-e39598e61db8@gmail.com>
Date: Fri, 28 Jun 2019 16:42:06 +0300
In-Reply-To: <39b9616c-592c-1560-b3df-e39598e61db8@gmail.com> (Piotr Dymacz's
 message of "Wed, 23 Jan 2019 01:38:03 +0100")
Message-ID: <87mui1ddxt.fsf@kamboji.qca.qualcomm.com>
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
To: Piotr Dymacz <pepe2k@gmail.com>
Cc: ath10k@lists.infradead.org

Piotr Dymacz <pepe2k@gmail.com> writes:

> This is a special BDF for 5 GHz radio inside ALFA Network AP120C-AC
> [0]. In case of 2.4 GHz radio, BDF used by the vendor firmware is the
> same as the one already embedded in the upstream board-2.bin file:
>
> root@AP120C-AC:/# dmesg | grep -i board
> [   32.198686] Board extended Data download address: 0x0
> [   32.223026]  Board data initialized
> [   32.337060] ol_ath_download_firmware:##Board Id 18 , CHIP Id 0
> [   32.343005] ol_ath_download_firmware: BOARDDATA DOWNLOAD TO address
> 0xc0000
> [   32.349831]  wifi0: Selecting board data file name
> boardData_1_0_IPQ4019_DK03_wifi0.bin
> [   32.359265] ol_transfer_bin_file: Board Data File download to
> address=0xc0000 file
> name=IPQ4019/hw.1/boardData_1_0_IPQ4019_DK03_wifi0.bin
> [...]
>
> root@AP120C-AC:/# md5sum
> /lib/firmware/IPQ4019/hw.1/boardData_1_0_IPQ4019_DK03_w
> ifi0.bin
> 11c70b64c714c30d040fcd7b0ef3f53f
> /lib/firmware/IPQ4019/hw.1/boardData_1_0_IPQ4019_DK03_wifi0.bin
>
>
> And the same (checksum and board/chip-id match) file inside upstream
> board-2.bin:
>
> ath10k-bdencoder -i board-2.bin
> [...]
> BoardNames[2]: 'bus=ahb,bmi-chip-id=0,bmi-board-id=18'
> BoardLength[2]: 12064
> BoardCRC32[2]: 628eba64
> BoardMD5[2]: 11c70b64c714c30d040fcd7b0ef3f53f
> [...]
>
>
> Thus, only one additional BDF has to be included in board-2.bin.
> As per the current "Submitting board files" guidelines [1]:
>
> * description for what hardware this is:
>
>   - this is an IPQ4018 based indoor ceiling AP
>   - one QCA40xx radio is used as 2.4GHz radio
>   - one QCA40xx radio is used as 5GHz radio
>
> * origin of the board file (did you create it yourself or where you
>   downloaded)
>
>   - file was extracted from a running vendor firmware the device was
>     delivered with
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - QCA4019 hw1.0:
>     bus=ahb,bmi-chip-id=0,bmi-board-id=25,variant=ALFA-Network-AP120C-AC
>     md5sum: e676f159de8afd74df3fecc8ecf94389
>
>
> * attach the actual board file (board.bin)
>
>   - the name of the file is equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=25,variant=ALFA-Network-AP120C-AC

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 42 in total

https://github.com/kvalo/ath10k-firmware/commit/36d375992210ffe5b6e44aab5910eeb83967072c

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
