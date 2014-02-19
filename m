Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WGBS0-0002bK-KM
 for ath10k@lists.infradead.org; Wed, 19 Feb 2014 18:00:53 +0000
Message-ID: <5304F130.5040406@candelatech.com>
Date: Wed, 19 Feb 2014 10:00:16 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [OpenWrt-Devel] [PATCHv3] wifi: Introduce 802.11ac support
References: <1391185897-29339-1-git-send-email-sven@open-mesh.com>
 <87bny5lu4a.fsf@purkki.adurom.net> <2862175.0bPvy6dDPg@bentobox>
 <87fvnfzbg0.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87fvnfzbg0.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Kalle Valo <kvalo@adurom.com>, Sven Eckelmann <sven@open-mesh.com>, ath10k@lists.infradead.org, Matti Laakso <malaakso@elisanet.fi>, Simon Wunderlich <simon@open-mesh.com>, OpenWrt Development List <openwrt-devel@lists.openwrt.org>

On 02/19/2014 01:41 AM, Kalle Valo wrote:
> (Adding ath10k@lists.infradead.org)
> 
> Sven Eckelmann <sven@open-mesh.com> writes:
> 
>> On Monday 17 February 2014 05:57:25 Kalle Valo wrote:
>>> Sven Eckelmann <sven@open-mesh.com> writes:
>>>> The ath10k patch wasn't resent because the driver patches are now
>>>> integrated in the OpenWrt mac80211 package. The answer in
>>>>
>>>>  http://article.gmane.org/gmane.comp.embedded.openwrt.devel/22422 also
>>>>  wasn't> 
>>>> quite promising.
>>>
>>> What do you mean? What was wrong with my answer?
>>
>> Nothing is "wrong" but you said that there are two branches. One is "AP mode, 
>> nothing else" and the other one is "main branch again has more
>> features, like P2P, ...". So I don't see a good reason why a multi-purpose 
>> system like openwrt should accept my patch to change it to the "AP-only" 
>> ath10k firmware.
> 
> AP mode in 10.1 firmware is extensively tested and that's why I strongly
> recommend to use 10.1 firmware as the default in openwrt. I don't think
> it's wise to knowingle cripple ath10k AP mode in openwrt just because
> lack of P2P support. Like Matti also said, AP mode is most important in
> openwrt, we should have that properly supported first.
> 
> But we should try ways to mitigate the problem of having two firmware
> branches. For example, should we have a module parameter in ath10k to
> choose which firmware to use? Or is there even a way to do that
> automatically based on what interfaces are used?
> 
> I'm happy to hear any ideas how to improve this.

I don't think it can be done automatically, at least not in general,
because users may add/remove interface types after the firmware is
loaded.  Resetting the NIC and reloading firmware is a bit touchy
currently, so I don't think you want to switch to different
firmware dynamically.

A module option is probably the best way to do this in my opinion.


Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
