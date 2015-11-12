Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwzVd-0002q6-9I
 for ath10k@lists.infradead.org; Thu, 12 Nov 2015 21:34:21 +0000
Message-ID: <564505A6.9030001@codeaurora.org>
Date: Thu, 12 Nov 2015 13:33:26 -0800
From: Peter Oh <poh@codeaurora.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] cfg80211: add VHT support for Mesh
References: <ab294ba62856f00c06dde10b1bf57f5f341a7198.1447351137.git.poh@qca.qualcomm.com>
 <1447358605.2131.3.camel@sipsolutions.net>
In-Reply-To: <1447358605.2131.3.camel@sipsolutions.net>
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


On 11/12/2015 12:03 PM, Johannes Berg wrote:
> On Thu, 2015-11-12 at 09:59 -0800, Peter Oh wrote:
>> Add NL80211_EXT_FEATURE_VHT_MESH flag to allow drivers
>> to indicate support for VHT in Mesh mode.
>> This flag will be used by wireless drivers to indicate
>> the capability of VHT Mesh support and wpa_supplicant to inspect
>> wireless drivers' capability of VHT Mesh.
>> In addition to this patch, separate patches to ath10k driver and
>> wpa_supplicant are also sent out.
>>
> Sorry, still doesn't make sense. What does userspace even need to know
> this *for*?
At this moment Mesh Point is not able to be brought up by userspace such 
as wap_supplicant at VHT data rates because there is no events/NL80211 
defined that userspace can check out if drivers can support Mesh Point 
(802.11s) at VHT data rates or not, hence only HT data rates can be used 
for
Mesh Point by userspace now.
This patch is introducing NL80211 event to cover the issue.
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
