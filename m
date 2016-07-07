Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bLCDp-0003sL-Nz
 for ath10k@lists.infradead.org; Thu, 07 Jul 2016 16:32:18 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: disable wake_tx_queue for older devices
Date: Thu, 7 Jul 2016 16:30:48 +0000
Message-ID: <87zipt1kco.fsf@kamboji.qca.qualcomm.com>
References: <1463489221-24989-1-git-send-email-michal.kazior@tieto.com>
 <1467201146-6844-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1467201146-6844-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 29 Jun 2016 13:52:26 +0200")
Content-Language: en-US
Content-ID: <9B39C75CDB21274F9EE644DA0A13422E@qualcomm.com>
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
To: "michal.kazior@tieto.com" <michal.kazior@tieto.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> Ideally wake_tx_queue should be used regardless as
> it is a requirement for reducing bufferbloat and
> implementing airtime fairness in the future.
>
> However some setups (typically low-end platforms
> hosting QCA988X) suffer performance regressions
> with the current wake_tx_queue implementation.
> Therefore disable it unless it is really
> beneficial with current codebase (which is when
> firmware supports smart pull-push tx scheduling).
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

I think it's too late to send this to 4.7 anymore (and this due to my
vacation). So I'm planning to queue this to 4.8, but if the feedback is
positive we can always send this to a 4.7 stable release.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
