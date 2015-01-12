Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAdJl-0002JF-8e
 for ath10k@lists.infradead.org; Mon, 12 Jan 2015 11:37:58 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 5/8] ath10k: Implement sta_add_debugfs
References: <1419407949-32367-1-git-send-email-rmanohar@qti.qualcomm.com>
 <1419407949-32367-6-git-send-email-rmanohar@qti.qualcomm.com>
Date: Mon, 12 Jan 2015 13:37:25 +0200
In-Reply-To: <1419407949-32367-6-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Wed, 24 Dec 2014 13:29:06 +0530")
Message-ID: <877fwsfcwa.fsf@kamboji.qca.qualcomm.com>
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

> Add per station debugfs files when a station is added to mac80211's
> station list. This helps to group peer specific debugfs entries
> altogether. Right now this callback adds support to test aggregation
> procedures (addba/addba_resp/delba) manually.
>
> To enable automatic aggregation in target,
> echo 0 >/sys/kernel/debug/ieee80211/phyX/netdev:wlanX/
> 	stations/XX:XX:XX:XX:XX:XX/aggr_mode
>
> For manual mode,
> echo 1 >/sys/kernel/debug/ieee80211/phyX/netdev:wlanX/
> 	stations/XX:XX:XX:XX:XX:XX/aggr_mode
>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

[...]

> diff --git a/drivers/net/wireless/ath/ath10k/debugfs_sta.c b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
> new file mode 100644
> index 0000000..d5fca70
> --- /dev/null
> +++ b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
> @@ -0,0 +1,89 @@
> +/*
> + * Copyright (c) 2014 Qualcomm Atheros, Inc.
> + *
> + * Permission to use, copy, modify, and/or distribute this software for any
> + * purpose with or without fee is hereby granted, provided that the above
> + * copyright notice and this permission notice appear in all copies.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
> + * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
> + * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
> + * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
> + * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
> + * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
> + * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
> + */
> +#include <linux/utsname.h>

Why include utsname.h? I don't see it used anywhere.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
