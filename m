Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1iC1-0006XB-UZ
 for ath10k@lists.infradead.org; Mon, 30 Jun 2014 20:28:50 +0000
Message-ID: <53B1C868.9060707@candelatech.com>
Date: Mon, 30 Jun 2014 13:28:24 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: A-MSDU reception not working?
References: <CABnBrYU3P5qXd7pE7LJ_K4JeNFLtbZnpsTgvqtpdMs07qz_gGA@mail.gmail.com>
In-Reply-To: <CABnBrYU3P5qXd7pE7LJ_K4JeNFLtbZnpsTgvqtpdMs07qz_gGA@mail.gmail.com>
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
To: Denton Gentry <denton.gentry@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 06/30/2014 01:15 PM, Denton Gentry wrote:
> In iperf tests using a MacBook STA bridging through an ath10k AP to an
> Ethernet server, I'm noticing very selective packet loss. The second
> and subsequent frames in an A-MSDU packet appear to be dropped.
>
> The AP sets the A-MSDU size to 3839 bytes, and the MacBook frequently
> sends A-MSDU packets containing two TCP frames. So far as I can tell,
> the first TCP frame from an A-MSDU aggregate is delivered and the
> second is consistently lost. The MacBook generally retransmits the
> lost frame as a singleton with no aggregation, and the retransmitted
> frame makes it through.
>
> This became more noticeable after the reordering fixes in
> http://lists.infradead.org/pipermail/ath10k/2014-June/002552.html
>
> I see this A-MSDU packet loss behavior both with and without the
> reordering fixes, the first packet in an A-MSDU is delivered while the
> second is dropped. However, *without* the reordering fixes (and
> therefore with packets delivered out of order) the MacBook sends
> relatively few A-MSDU frames. *With* the reordering fixes, so all
> packets are delivered in order, the MacBook keeps sending A-MSDU and
> therefore has to deal with more packet loss. I suspect it is an
> interaction with the MacOS TCP congestion window which I'm likely
> never going to fully understand, its stuck in a region of the
> congestion window where the Wifi driver keeps choosing to using
> A-MSDU.

We saw a case where ath10k AP would drop all UDP PDUs over about 3800 bytes,
I would guess it might be the same problem.

We have not looked into the problem yet.  Stations work fine
(which is our main concern at present)...

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
