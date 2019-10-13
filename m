Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJm9I-0007tv-KO
 for ath10k@lists.infradead.org; Sun, 13 Oct 2019 22:15:39 +0000
Subject: Re: [RFC PATCH 0/2] ath10k: provide survey info as accumulated data
References: <20190918124259.17804-1-sven@narfation.org>
From: Sebastian Gottschall <s.gottschall@newmedia-net.de>
Message-ID: <9a9ec99b-9643-7288-eed5-b549a9fe1487@newmedia-net.de>
Date: Mon, 14 Oct 2019 00:15:20 +0200
MIME-Version: 1.0
In-Reply-To: <20190918124259.17804-1-sven@narfation.org>
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
To: Sven Eckelmann <sven@narfation.org>, ath10k@lists.infradead.org
Cc: vnaralas@codeaurora.org, linux-wireless@vger.kernel.org, Sven Eckelmann <seckelmann@datto.com>

i checked your patch on 10.4 based chipsets with 9984. the values are 
now looking bogus and wrong at all. busy and active time time in ms does 
increase in hours each second
the problem seem to be that your patch is 10.2.4 only related. 
ath_clean_survey does not trigger on 10.4 so the values double itself 
each time the event raises since you add the full values and not just a 
delta on top

Sebastian

Am 18.09.2019 um 14:42 schrieb Sven Eckelmann:
> From: Sven Eckelmann <seckelmann@datto.com>
>
> Hi,
>
> it was observed that ath9k provides accumulated survey counters but ath10k
> neither provides deltas nor accumulated counters. Instead it returns
> some value which was returned at some point from the firmware.
>
> But as it turns out, this data is not reliable. To make it more useful,
> ath10k has to:
>
> * retrieve counters rather frequently for hardware which is known to use
>    firmware versions with low number counter bits (for only 14-30s)
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
>
> Kind regards,
> 	Sven
>
> Sven Eckelmann (2):
>    ath10k: report survey info as accumulated values
>    ath10k: regularly fetch survey counters
>
>   drivers/net/wireless/ath/ath10k/core.c |  8 ++++
>   drivers/net/wireless/ath/ath10k/core.h |  3 ++
>   drivers/net/wireless/ath/ath10k/hw.c   | 13 +++--
>   drivers/net/wireless/ath/ath10k/mac.c  | 52 ++++++++++++++++++++
>   drivers/net/wireless/ath/ath10k/mac.h  |  3 ++
>   drivers/net/wireless/ath/ath10k/wmi.c  | 66 ++++++++++++++++++++++----
>   6 files changed, 130 insertions(+), 15 deletions(-)
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
