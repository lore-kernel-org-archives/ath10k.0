Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJC6b-00028t-Ae
 for ath10k@lists.infradead.org; Fri, 28 Feb 2014 01:19:14 +0000
Message-ID: <530FE3EA.4040602@candelatech.com>
Date: Thu, 27 Feb 2014 17:18:34 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Need to get msdu-chaining working.
References: <530E7AF2.1080908@candelatech.com>
 <CA+BoTQmr6+9wJ87pOmzPEBwPCMG5emfkfcUmzxXpH6gVPW+zFw@mail.gmail.com>
In-Reply-To: <CA+BoTQmr6+9wJ87pOmzPEBwPCMG5emfkfcUmzxXpH6gVPW+zFw@mail.gmail.com>
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

On 02/26/2014 10:51 PM, Michal Kazior wrote:

>>From what I understand chained msdu is a msdu that hasn't fit into the
> rx buffer and is split across the popped amsdu list. I suspect only
> the first msdu in chain has the htt_rx_desc and all other have not
> (this is what the current code does, but you'll need to verify that).
> 
> I would try to concatenate all msdus into one (lots of memcpy :( ) or
> increase the HTT_RX_BUF_SIZE so that A-MSDU frames can fit into a
> single buffer (hopefully FW/HW is capable of doing that).

I got this working, basically using memcpy approach.

Throughput is comparable what I was seeing on stock firmware,
but I do notice an issue:

The reported rx speed is almost always 6Mbps when I drive at high speeds.

(At low speeds I see rx rate reported at 1.3Gbps most of the time.)

I am pretty sure this is related to the msdu-chaining somehow.

There are lots of FIXME's in the ath10k_htt_rx_amsdu_pop method.

Any idea where the rx rate problem might lie?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
