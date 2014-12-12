Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XzOb1-0003uF-GO
 for ath10k@lists.infradead.org; Fri, 12 Dec 2014 11:41:20 +0000
Message-ID: <1418384444.2470.22.camel@sipsolutions.net>
Subject: Re: [PATCH 3/4] ath10k: Fix no-ack frame status
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 12 Dec 2014 12:40:44 +0100
In-Reply-To: <87oarazecg.fsf@kamboji.qca.qualcomm.com>
References: <1418226973-13779-1-git-send-email-sujith@msujith.org>
 <1418226973-13779-3-git-send-email-sujith@msujith.org>
 <87oarazecg.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Sujith Manoharan <sujith@msujith.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Thu, 2014-12-11 at 12:10 +0200, Kalle Valo wrote:
> Sujith Manoharan <sujith@msujith.org> writes:
> 
> > From: Sujith Manoharan <c_manoha@qca.qualcomm.com>
> >
> > Use the new IEEE80211_TX_STAT_NOACK_TRANSMITTED flag
> > to indicate successful transmission of no-ack frames.
> > This fixes multicast frame accounting.
> >
> > Cc: ath10k@lists.infradead.org
> > Signed-off-by: Sujith Manoharan <c_manoha@qca.qualcomm.com>
> 
> Johannes, are you planning to take this? Or should I take this once the
> corresponding mac80211 patch trickles down to my tree?

I don't really want to take the driver patches, but I'll try to get to
the mac80211 ones today.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
