Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dG2C6-0006Te-Gm
 for ath10k@lists.infradead.org; Wed, 31 May 2017 11:53:44 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: add configurable debugging.
Date: Wed, 31 May 2017 11:53:13 +0000
Message-ID: <8737blnsz6.fsf@kamboji.qca.qualcomm.com>
References: <20170510211925.17468-1-adrian@freebsd.org>
In-Reply-To: <20170510211925.17468-1-adrian@freebsd.org> (Adrian Chadd's
 message of "Wed, 10 May 2017 14:19:25 -0700")
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Adrian Chadd <adrian@freebsd.org> writes:

> This adds a few configurable debugging options:
>
> * driver debugging and tracing is now configurable per device

So this means that there's a debugfs file
/sys/kernel/debug/ieee80211/phy0/ath10k/debug for every ath10k device.
Sounds like a good idea. I just don't like the name of file, would
debug_mask be more descriptive?

> * driver debugging and tracing is now configurable at runtime

Correction, debug_mask has been always to possible change via
/sys/module/ath10k_core/parameters/debug_mask file. Now it doesn't work
anymore, which is ok, but I think we should make it clear for users as
well.

I wonder would that work if we change the mask to 0444:

module_param_named(debug_mask, ath10k_debug_mask, uint, 0644);

> * the debugging / tracing is not run at all (besides a mask check)
>   unless the specific debugging bitmap field is configured.

So I guess with this you mean that the function ath10k_dbg() is not
called if debug messages are disabled? This is something which is good
to do in another patch. And the original assumption was that if you care
about performance you won't even enable CONFIG_ATH10K_DEBUG, so that
path was not optimised in any way. How much benefit does this bring?

> --- a/drivers/net/wireless/ath/ath10k/debug.c
> +++ b/drivers/net/wireless/ath/ath10k/debug.c
> @@ -2418,6 +2418,79 @@ int ath10k_debug_create(struct ath10k *ar)
>  	return 0;
>  }
>  
> +#ifdef	CONFIG_ATH10K_DEBUGFS
> +static ssize_t ath10k_write_debug_mask(struct file *file,
> +				       const char __user *ubuf,
> +				       size_t count, loff_t *ppos)
> +{

The ifdef looks wrong, it's already inside CONFIG_ATH10K_DEBUGFS. Was it
supposed to be CONFIG_ATH10K_DEBUG?

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
