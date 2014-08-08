Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFscp-0008OP-Fx
 for ath10k@lists.infradead.org; Fri, 08 Aug 2014 22:27:03 +0000
Message-ID: <53E54E9E.4070605@candelatech.com>
Date: Fri, 08 Aug 2014 15:26:38 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH v5 2/7] ath10k: provide firmware crash info via debugfs
References: <20140808201815.20713.85582.stgit@potku.adurom.net>
 <20140808202847.20713.41211.stgit@potku.adurom.net>
In-Reply-To: <20140808202847.20713.41211.stgit@potku.adurom.net>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k@lists.infradead.org

On 08/08/2014 01:28 PM, Kalle Valo wrote:

> +
> +	getnstimeofday(&timestamp);
> +	dump_data->tv_sec = timestamp.tv_sec;
> +	dump_data->tv_nsec = timestamp.tv_nsec;

I wonder if we should take timestamp at crash time instead of crash-dump-gather time?


>  int ath10k_debug_create(struct ath10k *ar)
>  {
> +	ar->debug.fw_crash_data = vzalloc(sizeof(ar->debug.fw_crash_data));
> +	if (!ar->debug.fw_crash_data)
> +		return -ENOMEM;
> +

That sizeof looks quite wrong.


Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
