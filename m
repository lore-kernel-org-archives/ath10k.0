Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZxO81-0002Iy-0a
 for ath10k@lists.infradead.org; Fri, 13 Nov 2015 23:51:37 +0000
Message-ID: <5646774D.2000801@codeaurora.org>
Date: Fri, 13 Nov 2015 15:50:37 -0800
From: Peter Oh <poh@codeaurora.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] cfg80211: add VHT support for Mesh
References: <ab294ba62856f00c06dde10b1bf57f5f341a7198.1447351137.git.poh@qca.qualcomm.com>
 <1447358605.2131.3.camel@sipsolutions.net> <564505A6.9030001@codeaurora.org>
 <1447364413.2131.5.camel@sipsolutions.net> <56451294.9060205@codeaurora.org>
 <1447367523.2131.6.camel@sipsolutions.net> <56451B2F.3060704@codeaurora.org>
 <1447400275.3271.2.camel@sipsolutions.net>
In-Reply-To: <1447400275.3271.2.camel@sipsolutions.net>
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


On 11/12/2015 11:37 PM, Johannes Berg wrote:
> On Thu, 2015-11-12 at 15:05 -0800, Peter Oh wrote:
>> On 11/12/2015 02:32 PM, Johannes Berg wrote:
>>> On Thu, 2015-11-12 at 14:28 -0800, Peter Oh wrote:
>>>>    
>>>> Exactly the same communication mechanism and purpose are used
>>>> with
>>>> NL80211_EXT_FEATURE_VHT_IBSS which is already a part of NL80211
>>>> feature
>>>> flag.
>>>> The new feature flag, NL80211_EXT_FEATURE_VHT_MESH, follows the
>>>> same
>>>> purpose and usage.
>>> No, it doesn't. Check how the _IBSS one is used in the code to
>>> actually
>>> *do* something.
>> that's right. so take a look reset of explanation for this patch.
>>
> Still not making sense.
>
> I *suspect* that you think that the existing code is broken, and can't
> use VHT mesh and requires driver changes for it,
I'm saying, cannot use VHT Mesh by wpa_supplicant because a lack of 
communication method between driver and wpa_supplicant, hence extending 
NL80211 feature flag.
>   but that's not what
> your ath10k change shows since it also does nothing at all.
ath10k is advertising its VHT Mesh capability using NL80211 feature flag 
in the patch which wpa_supplicant can listen and catch up.
>
> Right now, I see no reason whatsoever to apply either one of those two
> patches. There are no functional changes, so wpa_supplicant could
> enable VHT mesh by checking VHT capabilities or so instead of a special
> feature flag.
You're asking wpa_supplicant enhancement which is not fair to engineers 
that did not involve the design implementation.
Also if you think Mesh should check VHT capabilities instead of a 
special feature flag, you had to ask the same thing to _VHT_IBSS.
_VHT_IBSS feature flag is also used to advertise driver's capability of 
VHT for IBSS instead of checking driver's information elements.
if IBSS had read VHT capability from driver's IE, _VHT_IBSS flag used at 
nl80211_join_ibss also shouldn't have existed.
>
> I also suspect that perhaps mesh *should* be checking like IBSS does,
> although I also would actually *prefer* that we can assume VHT mesh
> works if the driver advertises VHT support and mesh support separately,
> i.e. a new feature flag really isn't necessary.
Both IBSS and Mesh may support VHT without any feature flags. However 
this patch's approach is come from _VHT_IBSS feature flag which you 
already approved and so exists on upstream.
If you're asking not to use _VHT_MESH feature flag and look for another 
way, your request affects to wpa_supplicant design of ibss and mesh, 
since mesh and ibss frequency info are handled at the same function and 
the function is designed to use _VHT_IBSS feature flag. If Mesh cannot 
use the _VHT_MESH feature flag, the design of function cannot keep the 
consistency of capability check.

If you're saying _VHT_MESH feature flag is different from _VHT_IBSS 
because of what it is doing at nl80211_join_ibss function, I will add 
another patch to nl80211_join_mesh function to make _VHT_MESH feature 
flag the same as _VHT_IBSS. Will you be convinced then?

>
> In any case, the arguments for this patch haven't convinced me. I'm not
> going to apply this without much better ones.
>
> johannes
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
Thanks,
Peter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
