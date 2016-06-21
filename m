Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x231.google.com ([2a00:1450:4010:c07::231])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFM0Z-0002n5-7e
 for ath10k@lists.infradead.org; Tue, 21 Jun 2016 13:46:27 +0000
Received: by mail-lf0-x231.google.com with SMTP id h129so24789411lfh.1
 for <ath10k@lists.infradead.org>; Tue, 21 Jun 2016 06:46:06 -0700 (PDT)
Subject: Re: [PATCH 1/2] ath10k: remove unused <linux/semaphore.h>
References: <20160621114539.15313-1-chaehyun.lim@gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <bf7b2008-b333-2d79-a952-fda895da8479@cogentembedded.com>
Date: Tue, 21 Jun 2016 16:46:00 +0300
MIME-Version: 1.0
In-Reply-To: <20160621114539.15313-1-chaehyun.lim@gmail.com>
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
To: Chaehyun Lim <chaehyun.lim@gmail.com>, kvalo@qca.qualcomm.com
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hello.

On 6/21/2016 2:45 PM, Chaehyun Lim wrote:

> <linux/semaphore.h> is not used anymore, so just remove it.

    s/it/#include/?

> Signed-off-by: Chaehyun Lim <chaehyun.lim@gmail.com>
[...]

> diff --git a/drivers/net/wireless/ath/ath10k/htc.h b/drivers/net/wireless/ath/ath10k/htc.h
> index cc82718..0c55cd9 100644
> --- a/drivers/net/wireless/ath/ath10k/htc.h
> +++ b/drivers/net/wireless/ath/ath10k/htc.h
> @@ -22,7 +22,6 @@
>  #include <linux/list.h>
>  #include <linux/bug.h>
>  #include <linux/skbuff.h>
> -#include <linux/semaphore.h>
>  #include <linux/timer.h>
>
>  struct ath10k;

MBR, Sergei


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
