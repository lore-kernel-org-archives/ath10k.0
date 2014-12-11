Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xz0iG-0002Tt-4a
 for ath10k@lists.infradead.org; Thu, 11 Dec 2014 10:11:20 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 3/4] ath10k: Fix no-ack frame status
References: <1418226973-13779-1-git-send-email-sujith@msujith.org>
 <1418226973-13779-3-git-send-email-sujith@msujith.org>
Date: Thu, 11 Dec 2014 12:10:39 +0200
In-Reply-To: <1418226973-13779-3-git-send-email-sujith@msujith.org> (Sujith
 Manoharan's message of "Wed, 10 Dec 2014 21:26:12 +0530")
Message-ID: <87oarazecg.fsf@kamboji.qca.qualcomm.com>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Sujith Manoharan <sujith@msujith.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sujith Manoharan <sujith@msujith.org> writes:

> From: Sujith Manoharan <c_manoha@qca.qualcomm.com>
>
> Use the new IEEE80211_TX_STAT_NOACK_TRANSMITTED flag
> to indicate successful transmission of no-ack frames.
> This fixes multicast frame accounting.
>
> Cc: ath10k@lists.infradead.org
> Signed-off-by: Sujith Manoharan <c_manoha@qca.qualcomm.com>

Johannes, are you planning to take this? Or should I take this once the
corresponding mac80211 patch trickles down to my tree?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
