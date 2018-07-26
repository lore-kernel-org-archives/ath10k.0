Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fihAE-00087x-65
 for ath10k@lists.infradead.org; Thu, 26 Jul 2018 14:22:47 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Prevent active scans on potential unusable
 channels
References: <20180710094448.13201-1-sven.eckelmann@openmesh.com>
 <87r2jqt8h7.fsf@kamboji.qca.qualcomm.com>
 <17418645.RrWdIiVe0m@bentobox>
Date: Thu, 26 Jul 2018 17:22:31 +0300
In-Reply-To: <17418645.RrWdIiVe0m@bentobox> (Sven Eckelmann's message of "Thu, 
 26 Jul 2018 15:59:00 +0200")
Message-ID: <87muuet6u0.fsf@kamboji.qca.qualcomm.com>
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
To: Sven Eckelmann <sven.eckelmann@openmesh.com>
Cc: Simon Wunderlich <simon.wunderlich@openmesh.com>, ath10k@lists.infradead.org

Sven Eckelmann <sven.eckelmann@openmesh.com> writes:

> On Donnerstag, 26. Juli 2018 16:47:00 CEST Kalle Valo wrote:
> [...]
>> > Fixes: e8a50f8ba44b ("ath10k: introduce DFS implementation")
>> > Signed-off-by: Sven Eckelmann <sven.eckelmann@openmesh.com>
>> 
>> You didn't CC linux-wireless so I don't see this in patchwork. Can you
>> resend, please?
>
> In that case, you should maybe think about stopping the ath10k patchwork: 
> https://patchwork.kernel.org/patch/10516691/

Sure, but how to do that? I can't find any functionality from the UI.
And I don't want to fully delete it as lots of old emails refer to it.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
