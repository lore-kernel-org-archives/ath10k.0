Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxikc-0004lH-CJ
 for ath10k@lists.infradead.org; Thu, 06 Sep 2018 01:06:28 +0000
MIME-Version: 1.0
Date: Wed, 05 Sep 2018 18:06:14 -0700
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: Re: [PATCH v2 2/3] mac80211: support FTM responder
 configuration/statistics
In-Reply-To: <1535967225.3437.27.camel@sipsolutions.net>
References: <1535745418-31336-1-git-send-email-pradeepc@codeaurora.org>
 <1535745418-31336-3-git-send-email-pradeepc@codeaurora.org>
 <1535967225.3437.27.camel@sipsolutions.net>
Message-ID: <f6cb4548de9c5ca228124df1301d2aa0@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, David Spinadel <david.spinadel@intel.com>, ath10k@lists.infradead.org

On 2018-09-03 02:33, Johannes Berg wrote:
> On Fri, 2018-08-31 at 12:56 -0700, Pradeep Kumar Chitrapu wrote:
>> 
>> + * @ftm_responder: whether to enable fine timing measurement FTM 
>> functionality
> 
> missing "responder" somewhere there :)
> 
>> + * @ftmr_params: configurable lci/civic parameter when enabling FTM 
>> responder.
> 

Hi Johannes,

Thanks for the review..
> Perhaps the *existence* of ftmr_params could indicate that it's 
> enabled?
My understanding is these are only optional parameters. So, I have kept 
ftm_responder
separate from params.
I have tried to fix other review comments and posted v3 patch set.
Please let me know your comments.

Thanks
Pradeep

> 
>> @@ -865,6 +899,20 @@ static int ieee80211_assign_beacon(struct 
>> ieee80211_sub_if_data *sdata,
>>  	if (err == 0)
>>  		changed |= BSS_CHANGED_AP_PROBE_RESP;
>> 
>> +	if (params->ftm_responder) {
> 
> Here you immediately have the problem I talked about in the earlier
> patch ... yes, we don't have drivers that allow disabling it (so should
> probably reject that now), but without it you can *enable* it on the
> fly, but you cannot *disable*, in fact we assume saying "disable" means
> "no change" which is rather confusing.
> 
> johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
