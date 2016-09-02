Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bfwNV-0007By-1m
 for ath10k@lists.infradead.org; Fri, 02 Sep 2016 21:52:01 +0000
Subject: Re: Throughput weirdness on 9984
References: <CAAnMG+NUtOyxrzyXc4TyzPR8nuz2RcG80+GBwEZdfBFDknL2eQ@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <35fa0be2-6ac6-0f7f-cb4e-e8bfced4199c@candelatech.com>
Date: Fri, 2 Sep 2016 14:51:17 -0700
MIME-Version: 1.0
In-Reply-To: <CAAnMG+NUtOyxrzyXc4TyzPR8nuz2RcG80+GBwEZdfBFDknL2eQ@mail.gmail.com>
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
To: Alexis Green <agreen@cococorp.com>, ath10k@lists.infradead.org

On 09/02/2016 02:11 PM, Alexis Green wrote:
> Hello,
>
> As I was working with ath10k drivers, I have discovered that only CT
> firmware/driver combination is able to report tx_info to mac80211
> layer. I've built latest LEDE image for my hardware (Netgear Nighthawk
> X4S R7800) with both ath10k-ct driver from Ben and CT firmware. This
> combination of software provides the data I need, however, the
> throughput is severely limited :/
>
> All tests are performed between two of these devices in mesh mode with
> no encryption. Here are some of the iperf results:

I have not actually tested mesh-mode on my firmware, so maybe I caused
regressions related to that.

If you use AP + STA config, is throughput better?

What about IBSS?

What tx/rx rates is CT firmware actually reporting?  Maybe it is not
enabling HT/VHT for some reason?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
