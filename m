Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YOrN6-0003KZ-6z
 for ath10k@lists.infradead.org; Fri, 20 Feb 2015 17:28:12 +0000
Message-ID: <54E76E95.6070003@candelatech.com>
Date: Fri, 20 Feb 2015 09:27:49 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Sending frames on monitor interface?
References: <54E657C0.6080402@candelatech.com>
 <CA+BoTQn=oZ6g4J4gDNs2pnNYg4ifkhNh5S1iYS35VurnZzMTDQ@mail.gmail.com>
In-Reply-To: <CA+BoTQn=oZ6g4J4gDNs2pnNYg4ifkhNh5S1iYS35VurnZzMTDQ@mail.gmail.com>
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
Cc: ath10k <ath10k@lists.infradead.org>

On 02/19/2015 10:43 PM, Michal Kazior wrote:
> On 19 February 2015 at 22:38, Ben Greear <greearb@candelatech.com> wrote:
>> Do any of the firmware versions support sending (raw) frames on
>> the monitor interface?
>>
>> It seems 10.1 just asserts if someone tries this.  I can fix at least
>> some of this, but firmware seems to want a peer in order to transmit
>> any packets...maybe adding self-peer to the monitor interface is
>> a way to get around this?
> 
> Just an idea: Once upon a time we had to create temporary DA peer for
> offchannel tx (the code is still in ath10k). 10.1 might want something
> like that as well for data frames.

I hacked my CT firwmare to allow transmit on monitor interfaces, including
logic to allow setting up a (fake) peer and rate-ctrl structures.

I tweaked ath10k to create a peer when starting the monitor interface,
using the local radio's MAC as the peer address (this could easily be part
of the problem).  I hacked the firmware to always use this peer object when
transmitting on a monitor interface.

Packets now appear to be accepted for transmit, but I do not see anything on
the air.  I'll dig into it more if I find time...but not sure exactly how useful
the feature is anyway.

I see the code for off-channel work that you are talking about.  That seems like
a pretty awful hack if you wanted to do any realistic throughput, but I bet that
whatever issue this works around is the same issue that I am having trying to
get monitor TX to work.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
