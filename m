Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adEAt-000189-89
 for ath10k@lists.infradead.org; Tue, 08 Mar 2016 09:43:32 +0000
Date: Tue, 8 Mar 2016 15:12:50 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: [RFC v1] mac80211: Add support for per station rx stats histogram
Message-ID: <20160308094250.GA3685@atheros-ThinkPad-T61>
References: <1457367809-13637-1-git-send-email-mohammed@qca.qualcomm.com>
 <1457424451.2283.2.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1457424451.2283.2.camel@sipsolutions.net>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Anilkumar Kolli <akolli@qti.qualcomm.com>, linux-wireless@vger.kernel.org, kvalo@codeaurora.org, ath10k@lists.infradead.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Hi Johannes,

On Tue, Mar 08, 2016 at 09:07:31AM +0100, Johannes Berg wrote:
> On Mon, 2016-03-07 at 21:53 +0530, Mohammed Shafi Shajakhan wrote:
> >=A0
> > +#define IEEE80211_HT_MCS_NUM		32
> > +#define IEEE80211_VHT_MCS_NUM		10
> > +#define IEEE80211_BW_NUM		4
> > +#define IEEE80211_NSS_NUM		4
> > +#define IEEE80211_GI_NUM		2
> > +#define IEEE80211_RATE_TABLE_NUM	320
> > +#define IEEE80211_LEGACY_RATE_NUM	12
> =

> > +#ifdef CONFIG_MAC80211_DEBUG_PER_STA_RX_STATS
> > +	u64 rx_legacy_pkt[IEEE80211_LEGACY_RATE_NUM];
> > +	u64 rx_ht_pkt[IEEE80211_HT_MCS_NUM];
> > +	u64 rx_vht_pkt[IEEE80211_VHT_MCS_NUM];
> > +	u64 rx_bw_pkt[IEEE80211_BW_NUM];
> > +	u64 rx_nss_pkt[IEEE80211_NSS_NUM];
> > +	u64 rx_gi_pkt[IEEE80211_GI_NUM];
> > +	u64 rx_rate_pkt[IEEE80211_RATE_TABLE_NUM];
> > +	u64 rx_legacy_byte[IEEE80211_LEGACY_RATE_NUM];
> > +	u64 rx_ht_byte[IEEE80211_HT_MCS_NUM];
> > +	u64 rx_vht_byte[IEEE80211_VHT_MCS_NUM];
> > +	u64 rx_bw_byte[IEEE80211_BW_NUM];
> > +	u64 rx_nss_byte[IEEE80211_NSS_NUM];
> > +	u64 rx_gi_byte[IEEE80211_GI_NUM];
> > +	u64 rx_rate_byte[IEEE80211_RATE_TABLE_NUM];
> > +#endif
> =

> Do you know how much data this is?!
> =

> Felix is going to kill both of us if I apply it.

[shafi] :-(

> =

> Please look at reviving my rate-statistics patch and do the remaining
> work in userspace:
> =

> http://thread.gmane.org/gmane.linux.kernel.wireless.general/133172
>

[shafi] thank you, I will check this out.

regards,
shafi

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
