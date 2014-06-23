Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WzBAB-0000k2-Sj
 for ath10k@lists.infradead.org; Mon, 23 Jun 2014 20:48:28 +0000
Message-ID: <53A89286.8090504@candelatech.com>
Date: Mon, 23 Jun 2014 13:48:06 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: General firmware stability issue.
References: <53A332E7.2060400@candelatech.com>
 <CA+BoTQnfgbhyUDjp-FKO4pnwZ3N7nGGT+jcg9XYbSxcq4tQxzg@mail.gmail.com>
 <53A85040.1020404@candelatech.com>
In-Reply-To: <53A85040.1020404@candelatech.com>
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

On 06/23/2014 09:05 AM, Ben Greear wrote:
> 
> 
> On 06/22/2014 11:49 PM, Michal Kazior wrote:
>> On 19 June 2014 20:58, Ben Greear <greearb@candelatech.com> wrote:
>>> When using our firmware and kernel mods, we often see our AP system
>>> crash the firmware after several days of various testing.
>>>
>>> Often after this, it takes a full reboot to bring the system back.
>>
>> Can you elaborate on this? Why does it need a full reboot?
> 
> I'll send kernel messages next time it happens, but basically it just
> fails cold restart over and over again.

Here's logs from a station system that had a problem of this nature.  Since
it should not be doing any beaconing, I guess the root cause of at least this
particular problem is different.  This is with our firmware and hacked ath10k
driver, so of course it is possible it is not an upstream problem.

Kernel is 3.14, with most of the ath10k patches from 3.15 backported to it,
plus additional patches.

http://dmz2.candelatech.com/git/gitweb.cgi?p=linux-3.14.dev.y/.git;a=summary

Jun 22 10:00:00 localhost kernel: ath10k: Creating vdev id: 0  map: 68719476735
Jun 22 10:00:00 localhost kernel: IPv6: ADDRCONF(NETDEV_UP): sta1: link is not ready
Jun 22 10:00:00 localhost kernel: ath10k: Creating vdev id: 1  map: 68719476734
Jun 22 10:00:00 localhost kernel: IPv6: ADDRCONF(NETDEV_UP): sta2: link is not ready
Jun 22 10:00:01 localhost kernel: ath10k: stop, state OFF
Jun 22 10:00:02 localhost kernel: e1000e: eth1 NIC Link is Up 1000 Mbps Full Duplex, Flow Control: Rx/Tx
Jun 22 10:00:02 localhost kernel: IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
Jun 22 10:00:04 localhost kernel: ath10k: Target ready! transmit resources: 3 size:1792
Jun 22 10:00:04 localhost kernel: ath10k: wmi event firmware message 'P 73 V 36 T 411'
Jun 22 10:00:04 localhost kernel: ath10k: wmi event firmware message 'msdu-desc: 808  sw-crypt: 1'
Jun 22 10:00:04 localhost kernel: ath10k: wmi event firmware message 'alloc rem: 4332 iram: 57220'
Jun 22 10:00:04 localhost kernel: ath10k: start, state going from OFF to ON
Jun 22 10:00:04 localhost kernel: ath10k: Creating vdev id: 0  map: 68719476735
Jun 22 10:00:04 localhost kernel: IPv6: ADDRCONF(NETDEV_UP): sta1: link is not ready
Jun 22 10:00:05 localhost kernel: ath10k: stop, state OFF
Jun 22 10:00:08 localhost kernel: ath10k: failed to receive initialized event from target: 00000000
Jun 22 10:00:08 localhost kernel: ath10k: failed to wait for target to init: -110
Jun 22 10:00:08 localhost kernel: ath10k: failed to power up target using warm reset: -110
Jun 22 10:00:08 localhost kernel: ath10k: trying cold reset
Jun 22 10:00:08 localhost kernel: ath10k: target took longer 5000 us to wake up (awake count 1)
Jun 22 10:00:11 localhost kernel: ath10k: failed to receive initialized event from target: ffffffff
Jun 22 10:00:11 localhost kernel: ath10k: failed to wait for target to init: -110
Jun 22 10:00:11 localhost kernel: ath10k: device crashed - no diagnostics available
Jun 22 10:00:11 localhost kernel: ath10k: target took longer 5000 us to wake up (awake count 2)
Jun 22 10:00:11 localhost kernel: ath10k: failed to wake up target: -110
Jun 22 10:00:11 localhost kernel: ath10k: failed to power up target using cold reset too (-110)
Jun 22 10:00:11 localhost kernel: ath10k: Could not init hif: -110 (state OFF)
Jun 22 10:00:11 localhost kernel: ath10k: target took longer 5000 us to wake up (awake count 2)
Jun 22 10:00:11 localhost kernel: ath10k: failed to wake up target: -110
Jun 22 10:00:11 localhost kernel: ath10k: failed to reset target: -110
Jun 22 10:00:11 localhost kernel: ath10k: failed to power up target using warm reset: -110
.....



Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
