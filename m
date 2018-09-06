Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxrTr-0005uy-95
 for ath10k@lists.infradead.org; Thu, 06 Sep 2018 10:25:59 +0000
MIME-Version: 1.0
Date: Thu, 06 Sep 2018 15:55:30 +0530
From: Balaji Pothunoori <bpothuno@codeaurora.org>
Subject: Re: [PATCH v2 3/3] ath10k: management tx ack rssi capability check
In-Reply-To: <1535532794.5215.20.camel@sipsolutions.net>
References: <1532006789-32454-1-git-send-email-bpothuno@codeaurora.org>
 <1532006789-32454-4-git-send-email-bpothuno@codeaurora.org>
 (sfid-20180719_152706_974046_A35360D2)
 <1535532794.5215.20.camel@sipsolutions.net>
Message-ID: <d1446d6996ed97412dff5897d713a06b@codeaurora.org>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2018-08-29 14:23, Johannes Berg wrote:
> On Thu, 2018-07-19 at 18:56 +0530, Balaji Pothunoori wrote:
>> 
>> 
>> -	if (test_bit(WMI_SERVICE_TX_DATA_ACK_RSSI, ar->wmi.svc_map))
>> +	if (test_bit(WMI_SERVICE_TX_DATA_ACK_RSSI, ar->wmi.svc_map) ||
>> +	    test_bit(WMI_SERVICE_HTT_MGMT_TX_COMP_VALID_FLAGS, 
>> ar->wmi.svc_map))
>>  		wiphy_ext_feature_set(ar->hw->wiphy,
>> -				NL80211_EXT_FEATURE_DATA_ACK_SIGNAL_SUPPORT);
>> +			NL80211_EXT_FEATURE_DATA_ACK_SIGNAL_SUPPORT);
> 
> You should use the new name, and fix indentation.
> 
> johannes

Sure, i will send updated v3 patch.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
