Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail1.g8.pair.com ([66.39.4.88])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1atNhf-00054f-Tj
 for ath10k@lists.infradead.org; Thu, 21 Apr 2016 23:08:08 +0000
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
Subject: Re: [PATCH v2] ath10k: remove VHT capabilities from 2.4GHz
From: Michael Ney <neym@vorklift.com>
In-Reply-To: <57193373.9060109@dd-wrt.com>
Date: Thu, 21 Apr 2016 19:07:43 -0400
Message-Id: <D10E667A-82CB-4DAD-89FC-1038515184A0@vorklift.com>
References: <1461244669-19871-1-git-send-email-kvalo@qca.qualcomm.com>
 <5718EE7A.4030503@candelatech.com> <57193373.9060109@dd-wrt.com>
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
Cc: ath10k@lists.infradead.org

Also, several vendors are advertising QCA9980 and QCA9984 based access points with 256QAM support in 2.4GHz, such as the TP-Link AD7200 and the Netgear R7800, both of which advertise 800mbps 4-stream 2.4GHz capabilities.


> On Apr 21, 2016, at 4:09 PM, Sebastian Gottschall <s.gottschall@dd-wrt.com> wrote:
> 
> Am 21.04.2016 um 17:15 schrieb Ben Greear:
>> On 04/21/2016 06:17 AM, Kalle Valo wrote:
>>> From: Johannes Berg <johannes.berg@intel.com>
>>> 
>>> According to the spec, VHT doesn't exist in 2.4GHz.
>>> 
>>> There are vendor extensions to allow a subset of VHT to work
>>> (notably 256-QAM), but since mac80211 doesn't support those
>>> advertising VHT capability on 2.4GHz leads to the behaviour
>>> of reporting VHT capabilities but not being able to use any
>>> of them due to mac80211's code requiring 80 MHz support.
>>> 
>>> Remove the VHT capabilities from 2.4GHz for now. If mac80211
>>> gets extended to use the (likely Broadcom) vendor IEs for it
>>> and handles the lack of 80 MHz support, it can be added back.
>>> 
>>> Signed-off-by: Johannes Berg <johannes.berg@intel.com>
>>> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
>> 
>> The thing is, it actually works just fine with the patch I posted
>> to fix mac80211, and at any rate, even if the mac80211 patch isn't
>> applied, the ath10k driver works just fine in HT mode.
>> 
>> Have you actually found any case where the existing behaviour causes
>> a real problem?
> i agree. other vendor chipsets to support QAM256 as well in 2.4 ghz (notably broadcom)
> this is nonstandard, but since all going the same way it wouldnt be a great idea to keep QCA out of that extensions.
>> 
>> Thanks,
>> Ben
>> 
> 
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
