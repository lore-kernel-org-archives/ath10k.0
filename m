Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.as201155.net ([185.84.6.188])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc8da-00089A-HD
 for ath10k@lists.infradead.org; Fri, 22 May 2020 14:27:04 +0000
Subject: Re: [PATCH v13] ath10k: add LED and GPIO controlling support for
 various chipsets
References: <1523027875-5143-1-git-send-email-kvalo@codeaurora.org>
 <2468724.JaAZLprVu6@bentobox>
 <b23e65cf-4be7-72db-7955-32eae196953e@dd-wrt.com>
 <87wo549sas.fsf@codeaurora.org>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <0fd74998-751c-6ae1-3584-fce145ec8f84@dd-wrt.com>
Date: Fri, 22 May 2020 16:26:50 +0200
MIME-Version: 1.0
In-Reply-To: <87wo549sas.fsf@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Sebastian Gottschall <s.gottschall@newmedia-net.de>, openwrt-devel@lists.openwrt.org, Ansuel Smith <ansuelsmth@gmail.com>, Sven Eckelmann <sven@narfation.org>


Am 22.05.2020 um 12:29 schrieb Kalle Valo:
> (please don't top post)
>
> Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:
>
>> this code is not in use in its original form for ipq4019. i have seen
>> that his patch is also dropped from ath.git but is still in use by
>> openwrt. could somone clarify the state here and why it was dropped?
> I dropped the patch because of the bug report from openwrt.
can you show me the bug report? and openwrt is still using it as out of 
tree patch which is confusing here.
personally i'm using the patch on qca988x, qca9884 and also ipq40xx 
devices (40xx doesnt make any use of it of course)

any chipset which doesnt make use of the gpio_pin definition is unable 
to make use of it. if there is no trigger set, its also not used (hopefully)

but in any way i'm willig to fix any issue of there is a reproduceable 
issue.

Sebastian

>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
