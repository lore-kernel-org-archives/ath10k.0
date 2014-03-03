Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKb2Q-0006rT-9U
 for ath10k@lists.infradead.org; Mon, 03 Mar 2014 22:08:42 +0000
Message-ID: <5314FD54.7070202@candelatech.com>
Date: Mon, 03 Mar 2014 14:08:20 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: support msdu chaining.
References: <1393550452-1302-1-git-send-email-greearb@candelatech.com>
 <CA+BoTQnCjkgr3V4bzXW8GHJDmGRHqg6x8An__vFW5bxdub=uyw@mail.gmail.com>
In-Reply-To: <CA+BoTQnCjkgr3V4bzXW8GHJDmGRHqg6x8An__vFW5bxdub=uyw@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 02/27/2014 11:51 PM, Michal Kazior wrote:
> On 28 February 2014 02:20,  <greearb@candelatech.com> wrote:
>> From: Ben Greear <greearb@candelatech.com>
>>
>> Consolidate the list of msdu skbs into the msdu-head skb, delete the
>> rest of the skbs, pass the msdu-head skb on up the stack as normal.
>>
>> Tested with high-speed TCP and UDP traffic on modified firmware that
>> supports raw-rx.
> 
> As for an umodified firmware I expect ath10k will just re-assemble
> corrupted frames just to have them dropped by mac80211. It might be
> worth checking:
> 
>  if (chaining && fcs_error)
>     drop();

As far as I can tell, packets with bad FCS are dropped earlier in that
rx method?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
