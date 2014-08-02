Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XDSz7-0004RX-FJ
 for ath10k@lists.infradead.org; Sat, 02 Aug 2014 06:40:06 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix wmi service bitmap debug
References: <1406628239-31322-1-git-send-email-michal.kazior@tieto.com>
Date: Sat, 2 Aug 2014 09:39:33 +0300
In-Reply-To: <1406628239-31322-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 29 Jul 2014 12:03:59 +0200")
Message-ID: <87k36r5ra2.fsf@kamboji.qca.qualcomm.com>
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
Cc: Joe Perches <joe@perches.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> The 10.x and main firmware branches have
> conflicting WMI service bitmap definitions.
>
> This also fixes WMI services parsing on big-endian
> hosts and changes debugfs output to be more human
> friendly.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> +	SVCSTR(WMI_SERVICE_TX_ENCAP)
> +	SVCSTR(WMI_SERVICE_BURST)
> +	SVCSTR(WMI_SERVICE_SMART_ANTENNA_SW_SUPPORT)
> +	SVCSTR(WMI_SERVICE_SMART_ANTENNA_HW_SUPPORT)
>  	default:
> -		return "UNKNOWN SERVICE\n";
> +		return NULL;

This introduces a new checkpatch warning:

drivers/net/wireless/ath/ath10k/wmi.h:214: ERROR: spaces required around that ':' (ctx:VxE)

But I think that's just a false warning and I should ignore it. Any
other ideas?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
