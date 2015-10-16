Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zn4Ul-0006S6-RW
 for ath10k@lists.infradead.org; Fri, 16 Oct 2015 12:52:28 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/7] ath10k: add copy engine fast path support
References: <1444654626-3290-1-git-send-email-rmanohar@qti.qualcomm.com>
Date: Fri, 16 Oct 2015 15:51:44 +0300
In-Reply-To: <1444654626-3290-1-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Mon, 12 Oct 2015 18:26:59 +0530")
Message-ID: <87pp0fgen3.fsf@kamboji.qca.qualcomm.com>
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> Below patchset adds fast path support for uplink traffic by bypassing
> HTC layer processing. This is enabled by making use of unused copy
> engine 5 to receive HTT messages directly from HIF layer. From initial
> validation in VHT80/5G mode TCP UL is improved to 900Mbps from ~840Mbps
> in conducted test.
>
> -Rajkumar
>
> v2:
>  * fix invalid dma memory access (ATH10K_SKB_RXCB is used instead of
>    ATH10K_SKB_CB in htt_tx_cb)
>  * register either send_cb or recv_cb callback not both for
>    appropriate CE.
>  * Process CE 4 send completion first before processing rx
>  
> Rajkumar Manoharan (7):
>   ath10k: export htc tx rx handlers
>   ath10k: register per copy engine send completion callbacks
>   ath10k: register per copy engine receive callbacks
>   ath10k: export htt tx rx handlers
>   ath10k: Configure copy engine 5 for HTT messages
>   ath10k: remove unused dl_is_polled
>   ath10k: remove htc polling for tx completion

All 7 applied, thanks. I wasn't able to reproduce the warning anymore,
tested with both qca988x and qca99x0.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
