Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YLEBs-00050h-Jm
 for ath10k@lists.infradead.org; Tue, 10 Feb 2015 17:01:37 +0000
Message-ID: <54DA3957.10402@candelatech.com>
Date: Tue, 10 Feb 2015 09:01:11 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [RFT] ath10k: restart fw on tx-credit timeout
References: <1423224354-24955-1-git-send-email-michal.kazior@tieto.com>
 <54D4E89A.7040602@candelatech.com>
 <CA+BoTQ=HqyGKOBdOmpWOn_VjH1UTWF9nN_PE0uanaGsdeJmB6Q@mail.gmail.com>
 <54D8DA6F.7040805@candelatech.com>
 <CA+BoTQk9C_7efUs6VTZrEz5ECxsvCgfA8ObrAXKjqMpTL8pggA@mail.gmail.com>
In-Reply-To: <CA+BoTQk9C_7efUs6VTZrEz5ECxsvCgfA8ObrAXKjqMpTL8pggA@mail.gmail.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Matti Laakso <malaakso@elisanet.fi>

On 02/09/2015 10:09 PM, Michal Kazior wrote:
> On 9 February 2015 at 17:03, Ben Greear <greearb@candelatech.com> wrote:
>> On 02/08/2015 10:24 PM, Michal Kazior wrote:
>>> On 6 February 2015 at 17:15, Ben Greear <greearb@candelatech.com> wrote:
> [...]
>>>> At least in my tests, I could continue
>>>> to receive network traffic while WMI was blocked.
>>>
>>>
>>> Yeah. Traffic works with the tx-credit starvation as well but what
>>> good is this if you have inconsistent driver-firmware state after
>>> failing to send a few commands?
>>
>>
>> I just mention it because someone debugging the system might
>> wonder why the firmware is 'locked up' while it is still passing traffic.
> 
> I might as well include this info in the commit log.
> 
> 
>> If it is just powersave issue, could you force (overriding wmi tx-credits
>> limit)
>> a flush at the 1 second mark and hope it recovers by 3 second timeout?
> 
> Well, there's a couple of problems with that.
> 
> 1) you suggest to call wmi_flush() which calls wmi_cmd_send() *while*
> in wmi_cmd_send(),
> 2) you're out of credits, how do you intend to submit a frame,
> 3) yes, you can force it, but that's super ugly,
> 4) and this still doesn't guarantee you'll get your tx-credit due to
> firmware quirkiness.

If you do force the wmi send, ignoring credits, and even if you are running
stock firmware with wmi credits replenishment issues, then you at least
have a chance of recovering.  (Upstream firmware requires lots of WMI messages
to flush, I think..like you can only flush per peer or something like that,
so maybe there is no realistic way to flush with small number of WMI messages.)

I've hacked CT firmware to do a flush of all vdevs itself when it detects WMI hang.
I don't have a good test bed to reproduce the problem reliably, but I should know
after a few days if the flush works at all.  If not, then it's a moot point anyway.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
