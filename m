Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.duncanthrax.net ([2001:470:70c5:1111::170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WrBna-0005SL-LV
 for ath10k@lists.infradead.org; Sun, 01 Jun 2014 19:52:08 +0000
Message-ID: <538B8446.50301@stackframe.org>
Date: Sun, 01 Jun 2014 21:51:34 +0200
From: Sven Schnelle <svens@stackframe.org>
MIME-Version: 1.0
Subject: Re: [RFC PATCH 0/2] ath10k: testmode support
References: <20140528091832.8030.93169.stgit@potku.adurom.net>
In-Reply-To: <20140528091832.8030.93169.stgit@potku.adurom.net>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org

Hi Kalle,

Am 28.05.2014 11:19, schrieb Kalle Valo:
> here's how I'm thinking we should implement testmode support to ath10k. Please
> comment.

I tried the patch, and was able to continuous TX with a heavily modified ART version.

Only one small thing: The firmware expects the UTF commands in segmented 
format.
Should that splitting be done in your testmode patch, or should 
userspace handle that?

Regards
Sven

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
