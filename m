Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNd49-0000v0-Rf
 for ath10k@lists.infradead.org; Fri, 16 Nov 2018 12:17:43 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 3/3] ath10k: Add support to configure ftm responder role
References: <1534293018-4930-1-git-send-email-pradeepc@codeaurora.org>
 <1534293018-4930-4-git-send-email-pradeepc@codeaurora.org>
 <36962f12-84ff-d1a9-8273-a8e3444db108@dd-wrt.com>
 <871s99lrlv.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 16 Nov 2018 14:17:24 +0200
In-Reply-To: <871s99lrlv.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Mon, 01 Oct 2018 16:32:44 +0300")
Message-ID: <87ftw16wtn.fsf@codeaurora.org>
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, johannes@sipsolutions.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> writes:

> Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:
>
>> Am 15.08.2018 um 02:30 schrieb Pradeep Kumar Chitrapu:
>>>   +	if (test_bit(WMI_SERVICE_RTT, ar->wmi.svc_map))
>>> +		wiphy_ext_feature_set(ar->hw->wiphy,
>>> +				      NL80211_EXT_FEATURE_SET_FTM_RESPONDER);
>>> +
>>
>> not sure if this is accurate. even if WMI_SERVICE_RTT is set, the
>> firmware may not support this feature. this feature doesnt seem to be
>> implemented in current firmware releases
>> i checked the firmware sourcecode i have from 3.4 series and it doesnt
>> support this feature
>
> Pradeep, did you check this? It's really bad if ath10k enables the
> feature even if the firmware doesn't support this.

Pradeep, please clarify the situation. I don't want to enable features
when firmware doesn't support it.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
