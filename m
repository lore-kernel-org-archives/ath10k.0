Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1WVW-00067S-NW
 for ath10k@lists.infradead.org; Mon, 30 Jun 2014 08:00:11 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC/RFT 2/2] ath10k: fix Rx aggregation reordering
References: <1403860015-31601-1-git-send-email-michal.kazior@tieto.com>
 <1403860015-31601-3-git-send-email-michal.kazior@tieto.com>
 <8761jmtp1y.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQ=n-NGGbJ9tJ+Q=7Lhnd2XxWTWRZLBV-q1gDoc7bFitrA@mail.gmail.com>
Date: Mon, 30 Jun 2014 10:59:44 +0300
In-Reply-To: <CA+BoTQ=n-NGGbJ9tJ+Q=7Lhnd2XxWTWRZLBV-q1gDoc7bFitrA@mail.gmail.com>
 (Michal Kazior's message of "Mon, 30 Jun 2014 07:41:07 +0200")
Message-ID: <8738emsu8f.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Denton Gentry <denton.gentry@gmail.com>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 27 June 2014 16:17, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Michal Kazior <michal.kazior@tieto.com> writes:
>>
>>> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
>>> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
>>> @@ -21,6 +21,7 @@
>>>  #include "txrx.h"
>>>  #include "debug.h"
>>>  #include "trace.h"
>>> +#include "mac.h"
>>
>> Why this? At least from a quick search I didn't see any reason to add this.
>
> ath10k_get_arvif()

Ah, ok. BTW, in the future we should rename it to ath10k_mac_get_arvif()
to make it clear it's coming from mac.c.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
