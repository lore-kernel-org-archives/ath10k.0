Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKsh9-0002vp-0N
 for ath10k@lists.infradead.org; Tue, 04 Mar 2014 16:59:56 +0000
Message-ID: <53160673.9000901@candelatech.com>
Date: Tue, 04 Mar 2014 08:59:31 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Need to get msdu-chaining working.
References: <530E7AF2.1080908@candelatech.com>
 <CA+BoTQmr6+9wJ87pOmzPEBwPCMG5emfkfcUmzxXpH6gVPW+zFw@mail.gmail.com>
 <530F62FD.9060701@candelatech.com>
 <CA+BoTQmE8LjpW3xhwkWoXHLB8M1B1kQMQwBBtcgSw9fJEGv4+A@mail.gmail.com>
 <5314FE92.1090405@candelatech.com>
 <CA+BoTQkTyo_2rLhVOsqDHG+iRo3qrpDHGTO+M=JSj7nN5tuJNA@mail.gmail.com>
In-Reply-To: <CA+BoTQkTyo_2rLhVOsqDHG+iRo3qrpDHGTO+M=JSj7nN5tuJNA@mail.gmail.com>
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

On 03/03/2014 11:36 PM, Michal Kazior wrote:
> On 3 March 2014 23:13, Ben Greear <greearb@candelatech.com> wrote:
>> On 02/27/2014 11:36 PM, Michal Kazior wrote:
>>
>>>>> rx buffer and is split across the popped amsdu list. I suspect only
>>>>> the first msdu in chain has the htt_rx_desc and all other have not
>>>>> (this is what the current code does, but you'll need to verify that).
>>>>>
>>>>> I would try to concatenate all msdus into one (lots of memcpy :( ) or
>>>>> increase the HTT_RX_BUF_SIZE so that A-MSDU frames can fit into a
>>>>> single buffer (hopefully FW/HW is capable of doing that).
>>
>> Just FYI:  At least on my firmware in raw rx mode, increasing the
>> HTT_RX_BUF_SIZE (to 4 * 1920) and at least some chaining remains.
>> Performance did not change noticeably.  I'm using fairly powerful
>> core i7 processor systems, so maybe the memcpy doesn't
>> make enough difference to notice in my tests.
>>
>> I did not put any effort into figuring out why.
> 
> Getting rid of memcpy() was a huge performance win for AP135 and its
> MIPS processor.

No doubt, but at this point, my problems appear to lie elsewhere.

>> I'm currently getting about 540Mbps upload TCP goodput,
>> and only 420Mbps download TCP goodput.  Not sure why
>> the discrepancy, but perhaps the rx raw performance
>> is worse for a variety of reasons.  My firmware changes
>> to support multiple stations to same AP may also be slowing
>> things down, though these numbers are from  a single station
>> test...
> 
> Hmm, I assume you test this without any bridging. It's probably going
> to be a little slower due to tx timings being directly visible to the
> TCP subsystem because both TCP and ath10k are locally on the same
> machine. You could try moving the actual TCP endpoints behind bridges.
> 
> Or you're actually seeing the memcpy() at work...
> 
> Did you try to test performance on vanilla driver/firmware?

I have used vanilla firmware on AP for all tests, because my firmware
will not do AP mode on WLE900VX for some reason.  Using my slightly modified
driver has no noticeable difference (and it now works virtually identical
to upstream code when not using my modified firmware).

For station machine, vanilla firmware performs no better than my firmware,
and I see the same issue where upload is 150Mbps or so faster than
download.

I tried putting TCP/UDP endpoints on AP, and using AP as bridge, and both
cases have similar throughput.  Interestingly to me, UDP and TCP have similar
thoughput, so it is unlikely that we are actually hitting limits on
the spectrum (otherwise, UDP would do better because it has no ACK packets
and generally runs much faster total throughput on wifi in my experience
with /a/b/g/n NICs).

With vanilla firmware, there should be little to no amsdu packets
(I assume), so it is unlikely to be related to memcpy.  perf top
shows no obvious hot spots in download test (running about 380Mbps
in this case):

  2.24%  [kernel]                      [k] swiotlb_tbl_unmap_single
  1.88%  [kernel]                      [k] do_raw_spin_lock
  1.88%  [kernel]                      [k] ioread32
  1.84%  [kernel]                      [k] tcp_packet
  1.53%  [mac80211]                    [k] ieee80211_rx_handlers
  1.31%  [kernel]                      [k] copy_user_generic_string
  1.19%  [ath10k_core]                 [k] ath10k_htt_rx_amsdu.isra.29
  1.14%  btserver                      [.] do_big_while()
  1.09%  [kernel]                      [k] _raw_spin_lock_irqsave

What throughputs are you seeing, and what NICs are you using for AP
and stations?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
