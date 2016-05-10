Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1b092Q-0001qJ-C9
 for ath10k@lists.infradead.org; Tue, 10 May 2016 14:53:31 +0000
Message-ID: <5731F5BF.7080307@candelatech.com>
Date: Tue, 10 May 2016 07:52:47 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 15/21] ath10k: support CT firmware flag.
References: <1462835475-11079-1-git-send-email-greearb@candelatech.com>
 <1462835475-11079-16-git-send-email-greearb@candelatech.com>
 <20160510072005.GE25626@atheros-ThinkPad-T61>
In-Reply-To: <20160510072005.GE25626@atheros-ThinkPad-T61>
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
To: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org



On 05/10/2016 12:20 AM, Mohammed Shafi Shajakhan wrote:
> Hi Ben,
>
> On Mon, May 09, 2016 at 04:11:09PM -0700, greearb@candelatech.com wrote:
>> From: Ben Greear <greearb@candelatech.com>
>>
>> Add placeholder so CT firmware can more easily co-exist with upstream
>> kernel.
>
> [shafi] nitpick: good to provide an expansion in commit log as well, so that
> if we can easily figure out in git log alone, rather than going through
> the change and suggesting that it supports more vif's etc

CT firmware supports a great deal of things, such as IBSS, tx-rate reporting,
more control over tx-buffer allocation, rate-ctrl improvements and so forth.

I have another hundred or so patches that can enable and take advantage
of this sort of thing, but in the past, there has been no desire to allow
these patches upstream, so I am trying to feed some of the least controversial
patches first in case attitudes have changed.

If you would like to see my full patch tree, it is here:

http://dmz2.candelatech.com/?p=linux-4.4.dev.y/.git;a=summary

And, you can clone it:

git clone git://dmz2.candelatech.com/linux-4.4.dev.y

With regard to the patches in this series to dump the BSS regions and similar, I would
be happy to share my packaging script with QCA folks so they can add that info to their
own firmware. With BSS and Stack dumps, you can walk back through null-pointer exceptions
in the firmware and get a full backtrace instead of just the last call location.  This means
you can remove a huge number of ASSERTS, which frees up IRAM and overall makes the code
faster.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
