Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1alIGg-0006ya-MD
 for ath10k@lists.infradead.org; Wed, 30 Mar 2016 15:42:51 +0000
Subject: Re: Why is peer->peer_ids a bitmap?
References: <56FAF40B.1040301@candelatech.com>
 <CA+BoTQkfYwCfH2iWyzWbugCK50whafctRtfy928tzHpo7oq7ZQ@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <56FBF3CF.5090009@candelatech.com>
Date: Wed, 30 Mar 2016 08:42:07 -0700
MIME-Version: 1.0
In-Reply-To: <CA+BoTQkfYwCfH2iWyzWbugCK50whafctRtfy928tzHpo7oq7ZQ@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 03/30/2016 03:07 AM, Michal Kazior wrote:
> On 29 March 2016 at 23:30, Ben Greear <greearb@candelatech.com> wrote:
>> Can a single peer object really have more than one ID?
>
> When you install keys you typically get more ids via htt-peer-map
> event. I think there were some other cases as well..
>
>
>> Is this trying to deal with shared peer objects, perhaps?
>
> This was developed very long ago when peer-id mapping wasn't really
> well understood. Perhaps we could make do without peer id map now?
> i.e. only care about the first htt-peer-map per peer address?

The 10.4.3 firmware can probably still do shared peers, though not sure if it actually
happens in practice, and I'm not sure it that would cause this bitmap to
ever have more than one bit set anyway.

It just struck me as strange, mainly, and since the radio struct has
a peer array indexed by the peer-id, then it would seem that we should never
have duplicate bits set in any of the peer objects.  And, if that is correct,
then the bitmap or similar should probably be in the radio struct instead of
in peer objects.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
