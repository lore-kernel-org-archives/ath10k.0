Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iIqWs-0004y1-KB
 for ath10k@lists.infradead.org; Fri, 11 Oct 2019 08:44:08 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [RFC PATCH 0/2] ath10k: provide survey info as accumulated data
References: <20190918124259.17804-1-sven@narfation.org>
Date: Fri, 11 Oct 2019 11:44:01 +0300
In-Reply-To: <20190918124259.17804-1-sven@narfation.org> (Sven Eckelmann's
 message of "Wed, 18 Sep 2019 14:42:57 +0200")
Message-ID: <87imovzn72.fsf@kamboji.qca.qualcomm.com>
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
To: Sven Eckelmann <sven@narfation.org>
Cc: vnaralas@codeaurora.org, linux-wireless@vger.kernel.org, Sven Eckelmann <seckelmann@datto.com>, ath10k@lists.infradead.org

Sven Eckelmann <sven@narfation.org> writes:

> it was observed that ath9k provides accumulated survey counters but ath10k
> neither provides deltas nor accumulated counters. Instead it returns
> some value which was returned at some point from the firmware.
>
> But as it turns out, this data is not reliable. To make it more useful,
> ath10k has to:
>
> * retrieve counters rather frequently for hardware which is known to use
>   firmware versions with low number counter bits (for only 14-30s)
> * clean up received counter values 
> * accumulate counters from firmware
>
> A comparison of the resulting output with these fixes can be seen under
> https://stats.freifunk-vogtland.net/d/ffv_node/nodeinfo?orgId=1&var-node=ac86749f4d60&fullscreen&panelId=5&from=1568782046974&to=1568807068706
>
> The left side of the graph shows the output before the patches were applied
> and the right side the output with the patches applied. Just as reference, an
> ath9k device in the same building is
> https://stats.freifunk-vogtland.net/d/ffv_node/nodeinfo?orgId=1&var-node=ac86740037e0&fullscreen&panelId=5&from=1568782046974&to=1568807068706

Thanks, this looks very good to me and I had only cosmetic comments.
Please submit next version without RFC so that I can apply these.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
