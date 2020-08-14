Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6dJT-0002KZ-0u
 for ath10k@lists.infradead.org; Fri, 14 Aug 2020 17:16:24 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH mac80211-next] ath10k: fix unhandled switch value warning
References: <20200731055636.795173-1-thomas@adapt-ip.com>
Date: Fri, 14 Aug 2020 20:15:53 +0300
In-Reply-To: <20200731055636.795173-1-thomas@adapt-ip.com> (Thomas Pedersen's
 message of "Thu, 30 Jul 2020 22:56:36 -0700")
Message-ID: <87lfih87xy.fsf@tynnyri.adurom.net>
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
To: Thomas Pedersen <thomas@adapt-ip.com>
Cc: sfr@canb.auug.org.au, Johannes Berg <johannes@sipsolutions.net>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

Thomas Pedersen <thomas@adapt-ip.com> writes:

> Cited commit introduced the following warnings:
>
> drivers/net/wireless/ath/ath10k/mac.c: In function 'chan_to_phymode':
> drivers/net/wireless/ath/ath10k/mac.c:558:3: warning: enumeration
> value 'NL80211_CHAN_WIDTH_1' not handled in switch [-Wswitch]
>   558 |   switch (chandef->width) {
>       |   ^~~~~~
> drivers/net/wireless/ath/ath10k/mac.c:558:3: warning: enumeration
> value 'NL80211_CHAN_WIDTH_2' not handled in switch [-Wswitch]
> drivers/net/wireless/ath/ath10k/mac.c:558:3: warning: enumeration
> value 'NL80211_CHAN_WIDTH_4' not handled in switch [-Wswitch]
> drivers/net/wireless/ath/ath10k/mac.c:558:3: warning: enumeration
> value 'NL80211_CHAN_WIDTH_8' not handled in switch [-Wswitch]
> drivers/net/wireless/ath/ath10k/mac.c:558:3: warning: enumeration
> value 'NL80211_CHAN_WIDTH_16' not handled in switch [-Wswitch]
> drivers/net/wireless/ath/ath10k/mac.c:581:3: warning: enumeration
> value 'NL80211_CHAN_WIDTH_1' not handled in switch [-Wswitch]
>   581 |   switch (chandef->width) {
>       |   ^~~~~~
> drivers/net/wireless/ath/ath10k/mac.c:581:3: warning: enumeration value 'NL80211_CHAN_WIDTH_2' not handled in switch [-Wswitch]
> drivers/net/wireless/ath/ath10k/mac.c:581:3: warning: enumeration value 'NL80211_CHAN_WIDTH_4' not handled in switch [-Wswitch]
> drivers/net/wireless/ath/ath10k/mac.c:581:3: warning: enumeration value 'NL80211_CHAN_WIDTH_8' not handled in switch [-Wswitch]
> drivers/net/wireless/ath/ath10k/mac.c:581:3: warning: enumeration value 'NL80211_CHAN_WIDTH_16' not handled in switch [-Wswitch]
>
> Fix them by making the existing invalid channel width
> cases the default, as the introduced channel widths
> currently don't make sense in 2 or 5GHz either.
>
> Fixes: e5cb3d34a66d ("nl80211: S1G band and channel definitions")
> Signed-off-by: Thomas Pedersen <thomas@adapt-ip.com>

I assume Johannes takes this so:

Acked-by: Kalle Valo <kvalo@codeaurora.org>

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
