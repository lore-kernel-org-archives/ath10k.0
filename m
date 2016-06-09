Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bAsXx-0001Ag-KN
 for ath10k@lists.infradead.org; Thu, 09 Jun 2016 05:30:26 +0000
Message-ID: <5758FD6B.40409@candelatech.com>
Date: Wed, 08 Jun 2016 22:23:55 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Dynamic Bandwidth in hw rate control
References: <CAFc9h7uxTOUxONvW-gvgkFLUNR9OBn09kfetF9gqAtcNqN3SLg@mail.gmail.com>
In-Reply-To: <CAFc9h7uxTOUxONvW-gvgkFLUNR9OBn09kfetF9gqAtcNqN3SLg@mail.gmail.com>
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
To: Gaurang Ramesh Naik <gaurang@vt.edu>, ath10k@lists.infradead.org



On 06/08/2016 08:10 PM, Gaurang Ramesh Naik wrote:
> Hi,
>
> I needed a small clarification related to dynamic bandwidth setup. The
> documentation in wmi.h says " When enabled HW rate control tries
> different bandwidths when retransmitting frames."
>
> Does this mean that each packet is first always tried over VHT80 and
> if that fails it goes to HT40 and then to HT20? I tried this with one
> AP-Sta operating in VHT80 and one AP operating in its first secondary
> channel. When I check the rx rate info using "iw dev wlanx station
> dump", the bandwidth seems to sometimes alternate between 20 and 80,
> but sometimes it stays fixed at 20. Hence, I was wondering what really
> happens.

For one thing, if the hardware detects interference on secondary channels,
then it may decide to transmit a 20Mhz encoding.

The rate-ctrl algs in the firmware differ from release to release, but
the general goal is to transmit with the fastest encoding rate.

Thanks,
Ben

>
> Thanks,
> Gaurang.
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
