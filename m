Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2vxQ-0000F8-A2
 for ath10k@lists.infradead.org; Tue, 14 Jan 2014 04:50:33 +0000
Message-ID: <52D4C1FF.4060909@candelatech.com>
Date: Mon, 13 Jan 2014 20:50:07 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Anyone had any luck with 'raw' packet mode?
References: <52D44028.8020204@candelatech.com>
 <CAEFj9848W9i+n=ys=LMd7TPXPtP0LOPmmOiqQscJC2ZuuT2Hsw@mail.gmail.com>
In-Reply-To: <CAEFj9848W9i+n=ys=LMd7TPXPtP0LOPmmOiqQscJC2ZuuT2Hsw@mail.gmail.com>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: ath10k@lists.infradead.org

On 01/13/2014 06:03 PM, Yeoh Chun-Yeow wrote:
> Is your packet sniffer capture frame on 20MHz, 40MHz or 80MHz? Anyone manage to do on 80MHz?

Just HT40, and I'm only trying to use ath10k as stations in /n mode currently.

As soon as I can get that working, I'll start on more interesting /ac features.

Thanks,
Ben

>
> -----
> Chun-Yeow
>
> On Jan 14, 2014 3:36 AM, "Ben Greear" <greearb@candelatech.com <mailto:greearb@candelatech.com>> wrote:
>
>     I managed to get raw mode working for receiving packets,
>     but on transmit, I cannot get any packets actually transmitted
>     on the air (per my sniffer).
>
>     Anyone know what might be needed to get this working?
>
>     For instance, should we be sending raw frames with frags,
>     or more like we currently send management frames?
>
>     Thanks,
>     Ben
>
>     --
>     Ben Greear <greearb@candelatech.com <mailto:greearb@candelatech.com>>
>     Candela Technologies Inc http://www.candelatech.com
>
>
>     _______________________________________________
>     ath10k mailing list
>     ath10k@lists.infradead.org <mailto:ath10k@lists.infradead.org>
>     http://lists.infradead.org/mailman/listinfo/ath10k
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
