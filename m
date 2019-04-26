Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK148-0006s3-Hu
 for ath10k@lists.infradead.org; Fri, 26 Apr 2019 13:39:02 +0000
Subject: RE: [PATCHv2] ath10k: Add wrapper function to ath10k debug
From: Venkateswara Naralasetty <vnaralas@qti.qualcomm.com>
Date: Fri, 26 Apr 2019 13:38:53 +0000
Message-ID: <be151755e771423eaa0ad6e6e2e81c2b@APSANEXR01F.ap.qualcomm.com>
References: <1556283505-29539-1-git-send-email-vnaralas@codeaurora.org>
 <b9f263a4-e9da-18bb-5932-941a018ee860@candelatech.com>
In-Reply-To: <b9f263a4-e9da-18bb-5932-941a018ee860@candelatech.com>
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
To: Ben Greear <greearb@candelatech.com>, Venkateswara Naralasetty <vnaralas@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: Kan Yan <kyan@chromium.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>



> -----Original Message-----
> From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Ben
> Greear
> Sent: Friday, April 26, 2019 6:52 PM
> To: Venkateswara Naralasetty <vnaralas@codeaurora.org>;
> ath10k@lists.infradead.org
> Cc: Kan Yan <kyan@chromium.org>; linux-wireless@vger.kernel.org
> Subject: [EXT] Re: [PATCHv2] ath10k: Add wrapper function to ath10k debug
> 
> On 4/26/19 5:58 AM, Venkateswara Naralasetty wrote:
> > ath10k_dbg() is called in ath10k_process_rx() with huge set of
> > arguments which is causing CPU overhead even when debug_mask is not
> set.
> > Good improvement was observed in the receive side performance when
> > call to ath10k_dbg() is avoided in the RX path.
> >
> > Since currently all debug messages are sent via tracing
> > infrastructure, we cannot entirely avoid calling ath10k_dbg.
> > Therefore, call to
> > ath10k_dbg() is made conditional based on tracing config in the driver.
> >
> > Trasmit performance remains unchanged with this patch; below are some
> > experimental results with this patch and tracing disabled.
> >
> > mesh mode:
> >
> > 		w/o this patch          with this patch
> > Traffic       TP      CPU Usage      TP      CPU usage
> >
> > TCP          840Mbps    76.53%      960Mbps    78.14%
> > UDP          1030Mbps   74.58%      1132Mbps   74.31%
> >
> > Infra mode:
> >
> > 		w/o this patch          with this patch
> > Traffic        TP      CPU Usage      TP      CPU usage
> >
> > TCP Rx       1241Mbps   80.89%      1270Mbps   73.50%
> > UDP Rx       1433Mbps   81.77%      1472Mbps   72.80%
> >
> > Tested platform	: IPQ8064
> > hardware used	: QCA9984
> > firmware ver	: ver 10.4-3.5.3-00057
> >
> > Signed-off-by: Kan Yan <kyan@chromium.org>
> > Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
> > ---
> > v2:
> >   * changed trace enabled check from
> IS_ENABLED(CONFIG_ATH10K_TRACING)
> >   * to trace_ath10k_log_dbg_enabled().
> >
> >   drivers/net/wireless/ath/ath10k/core.c  |  2 ++
> >   drivers/net/wireless/ath/ath10k/debug.c |  8 ++++----
> >   drivers/net/wireless/ath/ath10k/debug.h | 22 ++++++++++++++++------
> >   drivers/net/wireless/ath/ath10k/trace.c |  1 +
> >   drivers/net/wireless/ath/ath10k/trace.h |  6 +++++-
> >   5 files changed, 28 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath10k/core.c
> > b/drivers/net/wireless/ath/ath10k/core.c
> > index cfd7bb2..ab709bf 100644
> > --- a/drivers/net/wireless/ath/ath10k/core.c
> > +++ b/drivers/net/wireless/ath/ath10k/core.c
> > @@ -26,6 +26,8 @@
> >   #include "coredump.h"
> >
> >   unsigned int ath10k_debug_mask;
> > +EXPORT_SYMBOL(ath10k_debug_mask);
> > +
> >   static unsigned int ath10k_cryptmode_param;
> >   static bool uart_print;
> >   static bool skip_otp;
> > diff --git a/drivers/net/wireless/ath/ath10k/debug.c
> > b/drivers/net/wireless/ath/ath10k/debug.c
> > index 32d967a..1b63929 100644
> > --- a/drivers/net/wireless/ath/ath10k/debug.c
> > +++ b/drivers/net/wireless/ath/ath10k/debug.c
> > @@ -2620,8 +2620,8 @@ void ath10k_debug_unregister(struct ath10k *ar)
> >   #endif /* CONFIG_ATH10K_DEBUGFS */
> >
> >   #ifdef CONFIG_ATH10K_DEBUG
> > -void ath10k_dbg(struct ath10k *ar, enum ath10k_debug_mask mask,
> > -		const char *fmt, ...)
> > +void __ath10k_dbg(struct ath10k *ar, enum ath10k_debug_mask mask,
> > +		  const char *fmt, ...)
> >   {
> >   	struct va_format vaf;
> >   	va_list args;
> 
> Do you still need the check later in this method:
> 
> if (ath10k_debug_mask & mask)
> 
> since you already checked in the ath10k_dbg() macro?
Yes, we need this check.
Otherwise all debug messages will be printed even without any debug mask set in case of tracing enabled. 
> 
> Thanks,
> Ben
> 
> 
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
> 
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
