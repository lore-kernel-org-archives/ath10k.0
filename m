Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-185.smtp-out.us-west-2.amazonses.com ([54.240.27.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibicD-0005dD-5n
 for ath10k@lists.infradead.org; Mon, 02 Dec 2019 10:07:38 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: change bundle count for max rx bundle for sdio
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <0101016ea72cd3fc-d998517d-4033-4659-b1f8-2b6dd2717682-000000@us-west-2.amazonses.com>
References: <0101016ea72cd3fc-d998517d-4033-4659-b1f8-2b6dd2717682-000000@us-west-2.amazonses.com>
Message-ID: <0101016ec614610c-2702f676-611d-4d34-b5e5-cb4f665a87aa-000000@us-west-2.amazonses.com>
Date: Mon, 2 Dec 2019 10:07:34 +0000
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wen Gong <wgong@codeaurora.org> wrote:

> For max bundle size 32, the bundle mask is not same with 8/16.
> Change it to match the max bundle size of htc. Otherwise it
> will not match with firmware, for example, when bundle count
> is 17, then flags of ath10k_htc_hdr is 0x4, if without this
> patch, it will be considered as non-bundled packet because it
> does not have mask 0xF0, then trigger error message later:
> payload length 56747 exceeds max htc length: 4088.
> 
> htc->max_msgs_per_htc_bundle is the min value of
> HTC_HOST_MAX_MSG_PER_RX_BUNDLE and
> msg->ready_ext.max_msgs_per_htc_bundle of ath10k_htc_wait_target,
> it will be sent to firmware later in ath10k_htc_start, then
> firmware will use it as the final max rx bundle count, in
> WLAN.RMH.4.4.1-00029, msg->ready_ext.max_msgs_per_htc_bundle
> is 32, it is same with HTC_HOST_MAX_MSG_PER_RX_BUNDLE, so the
> final max rx bundle count will be set to 32 in firmware.
> 
> This patch only effect sdio chips.
> 
> Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00029.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Fixes: 224776520ead69e ("ath10k: change max RX bundle size from 8 to 32 for sdio")
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

4a9912451630 ath10k: change bundle count for max rx bundle for sdio

-- 
https://patchwork.kernel.org/patch/11261779/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
