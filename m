Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bfZ4Q-0006k9-IC
 for ath10k@lists.infradead.org; Thu, 01 Sep 2016 20:58:47 +0000
Subject: Re: Ath10k probe response error related to mac80211 commit.
References: <cf9852df-6d14-baf6-af0a-9cc78c448fde@candelatech.com>
 <1472752911.9608.11.camel@sipsolutions.net>
 <c7eb32b4-84c5-41ae-1fe6-89df7cbbe7d4@candelatech.com>
 <1472756034.9608.15.camel@sipsolutions.net>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <79ab7dfa-f485-ffcd-963c-b91f7d5a8386@candelatech.com>
Date: Thu, 1 Sep 2016 13:52:15 -0700
MIME-Version: 1.0
In-Reply-To: <1472756034.9608.15.camel@sipsolutions.net>
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
To: Johannes Berg <johannes@sipsolutions.net>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

On 09/01/2016 11:53 AM, Johannes Berg wrote:
> On Thu, 2016-09-01 at 11:23 -0700, Ben Greear wrote:
>>
>> Could easily be that others are corrupted too, but since probe resp
>> is bad, the association will not proceed.
>
> makes sense.
>
>> Heh, I spent 4 days tracking this down, so I wanted to be precise in
>> my bug report :)
>
> Ahrg, ouch. Sorry about that. I really didn't think the flag would
> cause any issues for anyone.
>
>> The result I see is that there is an extra 10 bytes at the end of the
>> frame on air.  But, it looks like the exact same pkt is sent to the
>> firmware both with and without this patch.  Maybe the firmware is
>> using the wrong tid or something like that due to how the station is
>> created differently with this patch.
>
> That makes no sense though, unless this only happens on say the second
> station that connects? Until the first station sends an authentication
> frame, that patch really should have no impact whatsoever.

Ok, I found the problem.

In the 10.1 firmware (at least), it will force the TID to be NON-QOS-TID
if the peer object does not have the qos_enabled flag set.  This is probably
a work-around for some other thing lost in antiquity.

When using my firmware that puts mgt frames over HTT, the TID for mgt
frames was being over-ridden and set to non-qos TID.  Due to other
hackery and work-arounds, mgt frames cannot be sent on the non-qos
TID because they will be put on-air 10 bytes too long.  They must be
sent on the mgt-tid or non-pause tid.

I am guessing that somehow this mac80211 change creates a peer early
that does not have the qos logic enabled, and so that is why I suddenly
started hitting this bug.

Probably stock firmware is OK since it uses a second tx path for management,
and I guess that by whatever time it starts sending non-mgt frames the
qos-enabled logic is set properly.

I can fix this in my firmware by making it not over-ride the TID in
this case.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
