Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfktb-0002T2-06
 for ath10k@lists.infradead.org; Tue, 25 Jun 2019 12:50:00 +0000
MIME-Version: 1.0
Subject: Re: [PATCHv2] ath10k: Add wrapper function to ath10k debug
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1556283505-29539-1-git-send-email-vnaralas@codeaurora.org>
References: <1556283505-29539-1-git-send-email-vnaralas@codeaurora.org>
Message-Id: <20190625124958.AB02D601B4@smtp.codeaurora.org>
Date: Tue, 25 Jun 2019 12:49:58 +0000 (UTC)
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
To: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, Kan Yan <kyan@chromium.org>, ath10k@lists.infradead.org

Venkateswara Naralasetty <vnaralas@codeaurora.org> wrote:

> ath10k_dbg() is called in ath10k_process_rx() with huge set of arguments
> which is causing CPU overhead even when debug_mask is not set.
> Good improvement was observed in the receive side performance when call
> to ath10k_dbg() is avoided in the RX path.
> 
> Since currently all debug messages are sent via tracing infrastructure,
> we cannot entirely avoid calling ath10k_dbg. Therefore, call to
> ath10k_dbg() is made conditional based on tracing config in the driver.
> 
> Trasmit performance remains unchanged with this patch; below are some
> experimental results with this patch and tracing disabled.
> 
> mesh mode:
> 
> 		w/o this patch          with this patch
> Traffic       TP      CPU Usage      TP      CPU usage
> 
> TCP          840Mbps    76.53%      960Mbps    78.14%
> UDP          1030Mbps   74.58%      1132Mbps   74.31%
> 
> Infra mode:
> 
> 		w/o this patch          with this patch
> Traffic        TP      CPU Usage      TP      CPU usage
> 
> TCP Rx       1241Mbps   80.89%      1270Mbps   73.50%
> UDP Rx       1433Mbps   81.77%      1472Mbps   72.80%
> 
> Tested platform	: IPQ8064
> hardware used	: QCA9984
> firmware ver	: ver 10.4-3.5.3-00057
> 
> Signed-off-by: Kan Yan <kyan@chromium.org>
> Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

9d740d6380e5 ath10k: Add wrapper function to ath10k debug

-- 
https://patchwork.kernel.org/patch/10919117/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
