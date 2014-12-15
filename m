Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0R0q-0002NA-UT
 for ath10k@lists.infradead.org; Mon, 15 Dec 2014 08:28:17 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 3/4] ath10k: Fix no-ack frame status
References: <1418226973-13779-1-git-send-email-sujith@msujith.org>
 <1418226973-13779-3-git-send-email-sujith@msujith.org>
 <87oarazecg.fsf@kamboji.qca.qualcomm.com>
 <21646.15326.159197.316821@gargle.gargle.HOWL>
Date: Mon, 15 Dec 2014 10:27:19 +0200
In-Reply-To: <21646.15326.159197.316821@gargle.gargle.HOWL> (Sujith
 Manoharan's message of "Mon, 15 Dec 2014 07:09:42 +0530")
Message-ID: <87vblduxlk.fsf@kamboji.qca.qualcomm.com>
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
To: Sujith Manoharan <sujith@msujith.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sujith Manoharan <sujith@msujith.org> writes:

> Kalle Valo wrote:
>> Johannes, are you planning to take this? Or should I take this once the
>> corresponding mac80211 patch trickles down to my tree?
>
> Kalle, can you please pick this one ? I'll rebase and send the ath9k patch
> to John once he starts merging patches.

Yes, I'll take this patch once I have the mac80211 dependency in my
tree. I marked the patch as "Awaiting Upstream" in patchwork so that I
don't forget, hopefully :)

https://patchwork.kernel.org/patch/5470621/

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
