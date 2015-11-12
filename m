Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zx0wY-0003go-Cu
 for ath10k@lists.infradead.org; Thu, 12 Nov 2015 23:06:15 +0000
Message-ID: <56451B2F.3060704@codeaurora.org>
Date: Thu, 12 Nov 2015 15:05:19 -0800
From: Peter Oh <poh@codeaurora.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] cfg80211: add VHT support for Mesh
References: <ab294ba62856f00c06dde10b1bf57f5f341a7198.1447351137.git.poh@qca.qualcomm.com>	
 <1447358605.2131.3.camel@sipsolutions.net>	
 <564505A6.9030001@codeaurora.org>	
 <1447364413.2131.5.camel@sipsolutions.net>	 <56451294.9060205@codeaurora.org>
 <1447367523.2131.6.camel@sipsolutions.net>
In-Reply-To: <1447367523.2131.6.camel@sipsolutions.net>
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
To: Johannes Berg <johannes@sipsolutions.net>, Peter Oh <poh@qca.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org


On 11/12/2015 02:32 PM, Johannes Berg wrote:
> On Thu, 2015-11-12 at 14:28 -0800, Peter Oh wrote:
>>   
>> Exactly the same communication mechanism and purpose are used with
>> NL80211_EXT_FEATURE_VHT_IBSS which is already a part of NL80211
>> feature
>> flag.
>> The new feature flag, NL80211_EXT_FEATURE_VHT_MESH, follows the same
>> purpose and usage.
> No, it doesn't. Check how the _IBSS one is used in the code to actually
> *do* something.
that's right. so take a look reset of explanation for this patch.
> johannes
Thanks,
Peter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
