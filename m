Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlJGg-0005NR-IF
 for ath10k@lists.infradead.org; Fri, 16 May 2014 14:37:51 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 3/5] ath10k: drain tx before restarting hw
References: <1399637749-13489-1-git-send-email-michal.kazior@tieto.com>
 <1400143324-14911-1-git-send-email-michal.kazior@tieto.com>
 <1400143324-14911-4-git-send-email-michal.kazior@tieto.com>
 <87k39n89jm.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 16 May 2014 17:37:23 +0300
In-Reply-To: <87k39n89jm.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Thu, 15 May 2014 16:18:37 +0300")
Message-ID: <87tx8p3i3g.fsf@kamboji.qca.qualcomm.com>
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

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> Michal Kazior <michal.kazior@tieto.com> writes:
>
>> This makes sure no further tx requests are
>> submitted to HTT before driver teardown.
>>
>> This should prevent invalid pointer/NULL
>> dereference on htt tx pool in ath10k_htt_tx() in
>> some cases of heavy traffic.
>>
>> Reported-By: Ben Greear <greearb@candelatech.com>
>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>
> For some reason I'm not receiving buildbot emails anymore, but I noticed
> via the kbuild-all archives that this patch has a warning:
>
>    drivers/net/wireless/ath/ath10k/mac.c: In function 'ath10k_drain_tx':
>>> drivers/net/wireless/ath/ath10k/mac.c:2442:2: error: implicit
> declaration of function 'lockdep_is_held'
> [-Werror=implicit-function-declaration]
>
> https://lists.01.org/pipermail/kbuild-all/2014-May/004387.html

I fixed it with this:

--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -19,6 +19,7 @@
 
 #include <net/mac80211.h>
 #include <linux/etherdevice.h>
+#include <linux/lockdep.h>
 
 #include "hif.h"
 #include "core.h"

Let's see if buildbot is happier now.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
