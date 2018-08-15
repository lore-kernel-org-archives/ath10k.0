Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fpsrQ-0003Bj-GB
 for ath10k@lists.infradead.org; Wed, 15 Aug 2018 10:17:06 +0000
Subject: Re: [PATCH 3/3] ath10k: Add support to configure ftm responder role
References: <1534293018-4930-1-git-send-email-pradeepc@codeaurora.org>
 <1534293018-4930-4-git-send-email-pradeepc@codeaurora.org>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <36962f12-84ff-d1a9-8273-a8e3444db108@dd-wrt.com>
Date: Wed, 15 Aug 2018 12:16:50 +0200
MIME-Version: 1.0
In-Reply-To: <1534293018-4930-4-git-send-email-pradeepc@codeaurora.org>
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
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, johannes@sipsolutions.net, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org


Am 15.08.2018 um 02:30 schrieb Pradeep Kumar Chitrapu:
>   
> +	if (test_bit(WMI_SERVICE_RTT, ar->wmi.svc_map))
> +		wiphy_ext_feature_set(ar->hw->wiphy,
> +				      NL80211_EXT_FEATURE_SET_FTM_RESPONDER);
> +

not sure if this is accurate. even if WMI_SERVICE_RTT is set, the 
firmware may not support this feature. this feature doesnt seem to be 
implemented in current firmware releases
i checked the firmware sourcecode i have from 3.4 series and it doesnt 
support this feature


Sebastian



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
