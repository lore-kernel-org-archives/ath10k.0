Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xsvch-0005ms-6c
 for ath10k@lists.infradead.org; Mon, 24 Nov 2014 15:32:19 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Add the target register access and memory dump
 debugfs interface
References: <1416656922-6645-1-git-send-email-yanbol@qti.qualcomm.com>
Date: Mon, 24 Nov 2014 17:31:51 +0200
In-Reply-To: <1416656922-6645-1-git-send-email-yanbol@qti.qualcomm.com> (Yanbo
 Li's message of "Sat, 22 Nov 2014 19:48:42 +0800")
Message-ID: <87wq6k4ntk.fsf@kamboji.qca.qualcomm.com>
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
To: Yanbo Li <yanbol@qti.qualcomm.com>
Cc: dreamfly281@gmail.com, linux-wireless@vger.kernel.org, michal.kazior@tieto.com, ath10k@lists.infradead.org

Yanbo Li <yanbol@qti.qualcomm.com> writes:

> --- a/drivers/net/wireless/ath/ath10k/debug.c
> +++ b/drivers/net/wireless/ath/ath10k/debug.c
> @@ -22,6 +22,7 @@
>  #include <linux/vmalloc.h>
>  
>  #include "core.h"
> +#include "hif.h"
>  #include "debug.h"
>  #include "hif.h"

hif.h is now included twice.

Let me send a v2. I'll also try splitting the patches as then it makes
it easier to write the commit log.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
