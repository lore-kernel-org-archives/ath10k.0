Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eSQ8q-0001K5-9E
 for ath10k@lists.infradead.org; Fri, 22 Dec 2017 16:25:50 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 00/11] SDIO support for ath10k
Date: Fri, 22 Dec 2017 16:25:31 +0000
Message-ID: <87608y91c5.fsf@kamboji.qca.qualcomm.com>
References: <1506793068-27445-1-git-send-email-alagusankar@silex-india.com>
In-Reply-To: <1506793068-27445-1-git-send-email-alagusankar@silex-india.com>
 (silexcommon@gmail.com's message of "Sat, 30 Sep 2017 23:07:37 +0530")
Content-Language: en-US
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
To: "silexcommon@gmail.com" <silexcommon@gmail.com>
Cc: Alagu Sankar <alagusankar@silex-india.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

silexcommon@gmail.com writes:

> From: Alagu Sankar <alagusankar@silex-india.com>
>
> This patchset, generated against master-pending branch, enables a fully
> functional SDIO interface driver for ath10k.  Patches have been verified on
> QCA9377-3 WB396 and Silex's SX-SDCAC reference cards with Station, Access Point
> and P2P modes.
>
> The driver is verified with the firmware WLAN.TF.1.1.1-00061-QCATFSWPZ-1
> with the board data from respective SDIO card vendors. Receive performance
> matches the QCA reference driver when used with SDIO3.0 enabled platforms.
> iperf tests indicate a downlink UDP of 275Mbit/s and TCP of 150Mbit/s
>
> This patchset differs from the previous high latency patches, specific to SDIO.
> HI_ACS_FLAGS_SDIO_REDUCE_TX_COMPL_SET is enabled for HI_ACS. This instructs the
> firmware to use HTT_T2H_MSG_TYPE_TX_COMPL_IND for outgoing packets. Without
> this flag, the management frames are not sent out by the firmware. Possibility
> of management frames being sent via WMI and data frames through the reduced Tx
> completion needs to be probed further.
>
> Further improvements can be done on the transmit path by implementing packet
> bundle. Scatter Gather is another area of improvement for both Transmit and
> Receive, but may not work on all platforms
>
> Known issues: Surprise removal of the card, when the device is in connected
> state, delays sdio function remove due to delayed WMI command failures.
> Existing ath10k framework can not differentiate between a kernel module
> removal and the surprise removal of teh card.
>
> Alagu Sankar (11):
>   ath10k_sdio: sdio htt data transfer fixes
>   ath10k_sdio: wb396 reference card fix
>   ath10k_sdio: DMA bounce buffers for read write
>   ath10k_sdio: reduce transmit msdu count
>   ath10k_sdio: use clean packet headers
>   ath10k_sdio: high latency fixes for beacon buffer
>   ath10k_sdio: fix rssi indication
>   ath10k_sdio: common read write
>   ath10k_sdio: virtual scatter gather for receive
>   ath10k_sdio: enable firmware crash dump
>   ath10k_sdio: hif start once addition

Sorry, I run out of time to review this in detail. To make the review
easier I recommend to split this patchset into two sets, first set
containing only the bare essential to get basic functionality working
(for example ping working on x86) and the second set containing all the
optimisations (the bounce buffer stuff etc).

And try to make the first set as small as possible so that we can get it
faster applied.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
