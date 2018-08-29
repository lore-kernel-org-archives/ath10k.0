Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuwEK-0006xI-50
 for ath10k@lists.infradead.org; Wed, 29 Aug 2018 08:53:37 +0000
Message-ID: <1535532794.5215.20.camel@sipsolutions.net>
Subject: Re: [PATCH v2 3/3] ath10k: management tx ack rssi capability check
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 29 Aug 2018 10:53:14 +0200
In-Reply-To: <1532006789-32454-4-git-send-email-bpothuno@codeaurora.org>
 (sfid-20180719_152706_974046_A35360D2)
References: <1532006789-32454-1-git-send-email-bpothuno@codeaurora.org>
 <1532006789-32454-4-git-send-email-bpothuno@codeaurora.org>
 (sfid-20180719_152706_974046_A35360D2)
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
To: Balaji Pothunoori <bpothuno@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On Thu, 2018-07-19 at 18:56 +0530, Balaji Pothunoori wrote:
> 
>  
> -	if (test_bit(WMI_SERVICE_TX_DATA_ACK_RSSI, ar->wmi.svc_map))
> +	if (test_bit(WMI_SERVICE_TX_DATA_ACK_RSSI, ar->wmi.svc_map) ||
> +	    test_bit(WMI_SERVICE_HTT_MGMT_TX_COMP_VALID_FLAGS, ar->wmi.svc_map))
>  		wiphy_ext_feature_set(ar->hw->wiphy,
> -				NL80211_EXT_FEATURE_DATA_ACK_SIGNAL_SUPPORT);
> +			NL80211_EXT_FEATURE_DATA_ACK_SIGNAL_SUPPORT);

You should use the new name, and fix indentation.

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
