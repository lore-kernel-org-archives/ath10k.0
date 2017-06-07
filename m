Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:190:3424::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dIixe-0004jy-9p
 for ath10k@lists.infradead.org; Wed, 07 Jun 2017 21:57:56 +0000
Message-ID: <1496872642.3291.4.camel@sipsolutions.net>
Subject: Re: [PATCH 1/1] mac80211: ieee80211_rx_napi: remove warning
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 07 Jun 2017 23:57:22 +0200
In-Reply-To: <1496581915-4412-2-git-send-email-erik.stromdahl@gmail.com>
 (sfid-20170604_151234_601164_C284D202)
References: <1496581915-4412-1-git-send-email-erik.stromdahl@gmail.com>
 <1496581915-4412-2-git-send-email-erik.stromdahl@gmail.com>
 (sfid-20170604_151234_601164_C284D202)
Mime-Version: 1.0
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>, kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Sun, 2017-06-04 at 15:11 +0200, Erik Stromdahl wrote:
> The softirq count is not always incremented during driver
> operation. This is the case for usb and sdio network
> drivers.

I'm pretty sure the warning is correct, and we do rely on having
local_bh_disable(), otherwise we may end up taking a soft-IRQ and I
believe there are some things that could get messed up in that case.

So - I think the warning is there for a reason, and drivers should just
local_bh_disable() before calling into that. What's wrong with that?

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
