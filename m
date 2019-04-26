Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from [208.74.158.174] (helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK0nG-0001aT-Da
 for ath10k@lists.infradead.org; Fri, 26 Apr 2019 13:21:36 +0000
Subject: Re: [PATCHv2] ath10k: Add wrapper function to ath10k debug
References: <1556283505-29539-1-git-send-email-vnaralas@codeaurora.org>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <b9f263a4-e9da-18bb-5932-941a018ee860@candelatech.com>
Date: Fri, 26 Apr 2019 06:21:31 -0700
MIME-Version: 1.0
In-Reply-To: <1556283505-29539-1-git-send-email-vnaralas@codeaurora.org>
Content-Language: en-US
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Venkateswara Naralasetty <vnaralas@codeaurora.org>, ath10k@lists.infradead.org
Cc: Kan Yan <kyan@chromium.org>, linux-wireless@vger.kernel.org

On 4/26/19 5:58 AM, Venkateswara Naralasetty wrote:
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
> ---
> v2:
>   * changed trace enabled check from IS_ENABLED(CONFIG_ATH10K_TRACING)
>   * to trace_ath10k_log_dbg_enabled().
> 
>   drivers/net/wireless/ath/ath10k/core.c  |  2 ++
>   drivers/net/wireless/ath/ath10k/debug.c |  8 ++++----
>   drivers/net/wireless/ath/ath10k/debug.h | 22 ++++++++++++++++------
>   drivers/net/wireless/ath/ath10k/trace.c |  1 +
>   drivers/net/wireless/ath/ath10k/trace.h |  6 +++++-
>   5 files changed, 28 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index cfd7bb2..ab709bf 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -26,6 +26,8 @@
>   #include "coredump.h"
>   
>   unsigned int ath10k_debug_mask;
> +EXPORT_SYMBOL(ath10k_debug_mask);
> +
>   static unsigned int ath10k_cryptmode_param;
>   static bool uart_print;
>   static bool skip_otp;
> diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
> index 32d967a..1b63929 100644
> --- a/drivers/net/wireless/ath/ath10k/debug.c
> +++ b/drivers/net/wireless/ath/ath10k/debug.c
> @@ -2620,8 +2620,8 @@ void ath10k_debug_unregister(struct ath10k *ar)
>   #endif /* CONFIG_ATH10K_DEBUGFS */
>   
>   #ifdef CONFIG_ATH10K_DEBUG
> -void ath10k_dbg(struct ath10k *ar, enum ath10k_debug_mask mask,
> -		const char *fmt, ...)
> +void __ath10k_dbg(struct ath10k *ar, enum ath10k_debug_mask mask,
> +		  const char *fmt, ...)
>   {
>   	struct va_format vaf;
>   	va_list args;

Do you still need the check later in this method:

if (ath10k_debug_mask & mask)

since you already checked in the ath10k_dbg() macro?

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
