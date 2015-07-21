Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHWIX-00050p-9f
 for ath10k@lists.infradead.org; Tue, 21 Jul 2015 12:05:25 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k Suppress 'failed to process fft' warning messages.
References: <1437075444-6779-1-git-send-email-kevin@darbyshire-bryant.me.uk>
Date: Tue, 21 Jul 2015 15:04:36 +0300
In-Reply-To: <1437075444-6779-1-git-send-email-kevin@darbyshire-bryant.me.uk>
 (Kevin Darbyshire-Bryant's message of "Thu, 16 Jul 2015 20:37:24
 +0100")
Message-ID: <87bnf5ogx7.fsf@kamboji.qca.qualcomm.com>
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
To: Kevin Darbyshire-Bryant <kevin@darbyshire-bryant.me.uk>
Cc: ath10k@lists.infradead.org

Kevin Darbyshire-Bryant <kevin@darbyshire-bryant.me.uk> writes:

> When using DFS channels on Ath10k kernel log has warning message 'failed
> to process fft', typically when under medium/heavy traffic.  Ticket
> https://dev.openwrt.org/ticket/19316 discusses and concludes messages
> are harmless.  They do still contribute to log noise, so this patch
> enables them only in driver debug mode.
>
> Signed-off-by: Kevin Darbyshire-Bryant <kevin@darbyshire-bryant.me.uk>

Don't reference to a discussion somewhere else with a link, instead
summarise the discussion in the commit log.

And please change the title to: ath10k: suppress 'failed to process fft'
warning messages. Also please CC linux-wireless list as instructed here:

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/sources#submitting_patches

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
