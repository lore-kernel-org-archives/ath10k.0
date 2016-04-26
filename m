Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1av1iG-0002SW-M7
 for ath10k@lists.infradead.org; Tue, 26 Apr 2016 12:03:33 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: remove VHT capabilities from 2.4GHz
Date: Tue, 26 Apr 2016 12:03:03 +0000
Message-ID: <87mvogy3ux.fsf@kamboji.qca.qualcomm.com>
References: <1461244669-19871-1-git-send-email-kvalo@qca.qualcomm.com>
 <5718EE7A.4030503@candelatech.com>
 <1461654272.16188.4.camel@sipsolutions.net>
In-Reply-To: <1461654272.16188.4.camel@sipsolutions.net> (Johannes Berg's
 message of "Tue, 26 Apr 2016 09:04:32 +0200")
Content-Language: en-US
Content-ID: <7D9B0A4276272E4C96FC51F8ED0271A6@qualcomm.com>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Ben Greear <greearb@candelatech.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Johannes Berg <johannes@sipsolutions.net> writes:

> On Thu, 2016-04-21 at 08:15 -0700, Ben Greear wrote:
>
>> The thing is, it actually works just fine with the patch I posted
>> to fix mac80211, and at any rate, even if the mac80211 patch isn't
>> applied, the ath10k driver works just fine in HT mode.
>
> This patch has no implications on HT, and I wasn't planning on applying
> the mac80211 patch.

Yeah, makes sense. I'm planning to apply this soon.

> As I said, I have no objections to doing the (Broadcom) vendor specific
> IEs for "VHT" in 2.4 GHz band, but I don't think we should advertise
> the spec IEs when they're explicitly specified to be used only in the
> 5.2 GHz band.

But we really should have this, any volunteers? :) I think it shouldn't
be too hard to do so this would be a good project for someone looking
for a simple, but useful, task on wireless stack.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
