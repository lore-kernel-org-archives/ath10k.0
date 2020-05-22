Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc4vj-0006Es-2b
 for ath10k@lists.infradead.org; Fri, 22 May 2020 10:29:32 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v13] ath10k: add LED and GPIO controlling support for
 various chipsets
References: <1523027875-5143-1-git-send-email-kvalo@codeaurora.org>
 <2468724.JaAZLprVu6@bentobox>
 <b23e65cf-4be7-72db-7955-32eae196953e@dd-wrt.com>
Date: Fri, 22 May 2020 13:29:15 +0300
In-Reply-To: <b23e65cf-4be7-72db-7955-32eae196953e@dd-wrt.com> (Sebastian
 Gottschall's message of "Wed, 20 May 2020 09:39:45 +0200")
Message-ID: <87wo549sas.fsf@codeaurora.org>
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Sebastian Gottschall <s.gottschall@newmedia-net.de>, openwrt-devel@lists.openwrt.org, Ansuel Smith <ansuelsmth@gmail.com>, Sven Eckelmann <sven@narfation.org>

(please don't top post)

Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:

> this code is not in use in its original form for ipq4019. i have seen
> that his patch is also dropped from ath.git but is still in use by
> openwrt. could somone clarify the state here and why it was dropped?

I dropped the patch because of the bug report from openwrt.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
