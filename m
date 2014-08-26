Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XMAlh-0007qb-8p
 for ath10k@lists.infradead.org; Tue, 26 Aug 2014 07:02:13 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: improve logging to include dev id
References: <1408961378-1390-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 26 Aug 2014 10:01:45 +0300
In-Reply-To: <1408961378-1390-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 25 Aug 2014 12:09:38 +0200")
Message-ID: <87vbpf3fae.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> This makes it a lot easier to log and debug
> messages if there's more than 1 ath10k device on a
> system.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

A comment for the future, no need to change anything in this patch:

> -int ath10k_info(const char *fmt, ...)
> +int ath10k_info(struct ath10k *ar, const char *fmt, ...)
>  {
>  	struct va_format vaf = {
>  		.fmt = fmt,
> @@ -134,7 +116,7 @@ int ath10k_info(const char *fmt, ...)
>  
>  	va_start(args, fmt);
>  	vaf.va = &args;
> -	ret = ath10k_printk(KERN_INFO, "%pV", &vaf);
> +	ret = dev_info(ar->dev, "%pV", &vaf);
>  	trace_ath10k_log_info(&vaf);
>  	va_end(args);
>  

So how should we handle tracing? We would want to provide same
information through logging trace events, right?

One idea I had is that we modify the tracing logging macros to take
struct ath10k (or struct device) and use dev_driver_string() &
dev_name() to provide the same info via trace events.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
