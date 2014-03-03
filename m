Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKb7X-00070C-Ng
 for ath10k@lists.infradead.org; Mon, 03 Mar 2014 22:14:00 +0000
Message-ID: <5314FE92.1090405@candelatech.com>
Date: Mon, 03 Mar 2014 14:13:38 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Need to get msdu-chaining working.
References: <530E7AF2.1080908@candelatech.com>
 <CA+BoTQmr6+9wJ87pOmzPEBwPCMG5emfkfcUmzxXpH6gVPW+zFw@mail.gmail.com>
 <530F62FD.9060701@candelatech.com>
 <CA+BoTQmE8LjpW3xhwkWoXHLB8M1B1kQMQwBBtcgSw9fJEGv4+A@mail.gmail.com>
In-Reply-To: <CA+BoTQmE8LjpW3xhwkWoXHLB8M1B1kQMQwBBtcgSw9fJEGv4+A@mail.gmail.com>
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

On 02/27/2014 11:36 PM, Michal Kazior wrote:

>>> rx buffer and is split across the popped amsdu list. I suspect only
>>> the first msdu in chain has the htt_rx_desc and all other have not
>>> (this is what the current code does, but you'll need to verify that).
>>>
>>> I would try to concatenate all msdus into one (lots of memcpy :( ) or
>>> increase the HTT_RX_BUF_SIZE so that A-MSDU frames can fit into a
>>> single buffer (hopefully FW/HW is capable of doing that).

Just FYI:  At least on my firmware in raw rx mode, increasing the
HTT_RX_BUF_SIZE (to 4 * 1920) and at least some chaining remains.
Performance did not change noticeably.  I'm using fairly powerful
core i7 processor systems, so maybe the memcpy doesn't
make enough difference to notice in my tests.

I did not put any effort into figuring out why.

I'm currently getting about 540Mbps upload TCP goodput,
and only 420Mbps download TCP goodput.  Not sure why
the discrepancy, but perhaps the rx raw performance
is worse for a variety of reasons.  My firmware changes
to support multiple stations to same AP may also be slowing
things down, though these numbers are from  a single station
test...

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
