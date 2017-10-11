Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:72ef::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2Era-0005E4-PF
 for ath10k@lists.infradead.org; Wed, 11 Oct 2017 11:07:54 +0000
Message-ID: <1507720042.1998.31.camel@sipsolutions.net>
Subject: Re: [PATCH V5 1/5] mac80211: Enable TDLS peer buffer STA feature
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 11 Oct 2017 13:07:22 +0200
In-Reply-To: <1507623080-9311-2-git-send-email-yintang@qti.qualcomm.com>
 (sfid-20171010_100936_649329_136CB55B)
References: <TDLS for ath10k patch>
 <1507623080-9311-1-git-send-email-yintang@qti.qualcomm.com>
 <1507623080-9311-2-git-send-email-yintang@qti.qualcomm.com>
 (sfid-20171010_100936_649329_136CB55B)
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
To: yintang@qti.qualcomm.com, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org


> +++ b/include/net/cfg80211.h
> @@ -3249,6 +3249,8 @@ struct cfg80211_ops {
>   *	beaconing mode (AP, IBSS, Mesh, ...).
>   * @WIPHY_FLAG_HAS_STATIC_WEP: The device supports static WEP key
> installation
>   *	before connection.
> + * @WIPHY_FLAG_SUPPORT_TDLS_BUFFER_ST: Device support buffer STA
> when TDLS is
> + *	established.

There's a typo (missing A) here.

However, I don't see a reason for this to be a WIPHY flag rather than a
mac80211 hw flag (enum ieee80211_hw_flags) since you only use it in
mac80211.

In reality, adding WIPHY flags should be really rare - only if
*cfg80211* needs to know something, but *userspace* doesn't...

If cfg80211 doesn't care, add to mac80211. If userspace cares, add to
extended nl80211 flags instead :)

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
