Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cakRP-0002Ap-7j
 for ath10k@lists.infradead.org; Mon, 06 Feb 2017 14:38:53 +0000
Message-ID: <1486391893.5430.6.camel@sipsolutions.net>
Subject: Re: [PATCH v2 1/2] cfg80211: Add support to set tx power for a
 station associated
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 06 Feb 2017 15:38:13 +0100
In-Reply-To: <00887d68-80b7-cf80-e426-e3772d8122f1@candelatech.com>
References: <1485888101-23454-1-git-send-email-arnagara@qti.qualcomm.com>
 <12efc3d8-2274-a6e8-6d74-c06bf89762fb@candelatech.com>
 <14f6b3acb8b26d0eb806148c0ee47fb0@codeaurora.org>
 <2b68dc12-44bf-f510-339a-3d987a88e8b5@candelatech.com>
 <1f3a3dec67fbe4f580750eb06f9b628b@codeaurora.org>
 <00887d68-80b7-cf80-e426-e3772d8122f1@candelatech.com>
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
To: Ben Greear <greearb@candelatech.com>, Ashok Raj Nagarajan <arnagara@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>, ath10k@lists.infradead.org


> You use value '0' to mean set to default values, as far as I can
> tell.

I think you're confusing the internal API and the userspace API - at a
userspace level you have to set NL80211_ATTR_STA_TX_POWER_SETTING to
NL80211_TX_POWER_AUTOMATIC to revert back to defaults, no?

For perfect backwards compatibility we should ignore it if not
supported, but that doesn't really make sense - I think we should
reject it and handle errors elsewhere in the not supported case.

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
