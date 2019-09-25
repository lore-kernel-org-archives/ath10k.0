Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iD60K-0006Tk-7M
 for ath10k@lists.infradead.org; Wed, 25 Sep 2019 12:02:48 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Fix ath10k_init_uart when uart_print is false
References: <20190925090856.6964-1-fedux@fedux.com.ar>
 <20190925090856.6964-2-fedux@fedux.com.ar>
Date: Wed, 25 Sep 2019 15:02:39 +0300
In-Reply-To: <20190925090856.6964-2-fedux@fedux.com.ar> (Federico Cuello's
 message of "Wed, 25 Sep 2019 11:08:56 +0200")
Message-ID: <87o8z8inxc.fsf@tynnyri.adurom.net>
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
To: Federico Cuello <fedux@fedux.com.ar>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, wgong@codeaurora.org

+ ath10k

Federico Cuello <fedux@fedux.com.ar> writes:

> Patch 4504f0e5b5714d9d26b1a80bf1fc133c95830588 introduced a workaround
> for a firmware UART pin configuration bug, but it caused uart_print to be
> interpreted as true when it was false and uart_pin_workaround also false.
>
> This patch corrects the exit condition when uart_print is false.
>
> Signed-off-by: Federico Cuello <fedux@fedux.com.ar>

I have already applied a fix for this:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath-next&id=1340cc631bd00431e2f174525c971f119df9efa1

But it's not CCed for stable, hopefully the stable bots still catch it.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
