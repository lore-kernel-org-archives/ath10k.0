Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WG3fH-0001IY-JQ
 for ath10k@lists.infradead.org; Wed, 19 Feb 2014 09:42:05 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [OpenWrt-Devel] [PATCHv3] wifi: Introduce 802.11ac support
References: <1391185897-29339-1-git-send-email-sven@open-mesh.com>
 <87bny5lu4a.fsf@purkki.adurom.net> <2862175.0bPvy6dDPg@bentobox>
Date: Wed, 19 Feb 2014 11:41:35 +0200
In-Reply-To: <2862175.0bPvy6dDPg@bentobox> (Sven Eckelmann's message of "Mon, 
 17 Feb 2014 15:22:53 +0100")
Message-ID: <87fvnfzbg0.fsf@kamboji.qca.qualcomm.com>
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
To: Sven Eckelmann <sven@open-mesh.com>
Cc: Kalle Valo <kvalo@adurom.com>, OpenWrt Development List <openwrt-devel@lists.openwrt.org>, Simon Wunderlich <simon@open-mesh.com>, ath10k@lists.infradead.org, Matti Laakso <malaakso@elisanet.fi>

(Adding ath10k@lists.infradead.org)

Sven Eckelmann <sven@open-mesh.com> writes:

> On Monday 17 February 2014 05:57:25 Kalle Valo wrote:
>> Sven Eckelmann <sven@open-mesh.com> writes:
>> > The ath10k patch wasn't resent because the driver patches are now
>> > integrated in the OpenWrt mac80211 package. The answer in
>> > 
>> >  http://article.gmane.org/gmane.comp.embedded.openwrt.devel/22422 also
>> >  wasn't> 
>> > quite promising.
>> 
>> What do you mean? What was wrong with my answer?
>
> Nothing is "wrong" but you said that there are two branches. One is "AP mode, 
> nothing else" and the other one is "main branch again has more
> features, like P2P, ...". So I don't see a good reason why a multi-purpose 
> system like openwrt should accept my patch to change it to the "AP-only" 
> ath10k firmware.

AP mode in 10.1 firmware is extensively tested and that's why I strongly
recommend to use 10.1 firmware as the default in openwrt. I don't think
it's wise to knowingle cripple ath10k AP mode in openwrt just because
lack of P2P support. Like Matti also said, AP mode is most important in
openwrt, we should have that properly supported first.

But we should try ways to mitigate the problem of having two firmware
branches. For example, should we have a module parameter in ath10k to
choose which firmware to use? Or is there even a way to do that
automatically based on what interfaces are used?

I'm happy to hear any ideas how to improve this.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
