Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XRfrm-0006LR-P3
 for ath10k@lists.infradead.org; Wed, 10 Sep 2014 11:15:15 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: move fw_crash_dump allocation
References: <1409814788-1661-1-git-send-email-michal.kazior@tieto.com>
Date: Wed, 10 Sep 2014 14:14:23 +0300
In-Reply-To: <1409814788-1661-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 4 Sep 2014 09:13:08 +0200")
Message-ID: <878ulr9180.fsf@kamboji.qca.qualcomm.com>
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

> The fw_crash_data was allocated too late. Upon
> early firmware crash, before registering to
> mac80211, it was possible to crash the whole
> system:
>
>  ath10k_pci 0000:00:05.0: device has crashed during init
>  BUG: unable to handle kernel NULL pointer dereference at           (null)

[...]

>  ---[ end Kernel panic - not syncing: Fatal exception in interrupt
>
> To prevent that split debug functions and allocate
> fw_crash_data earlier.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
