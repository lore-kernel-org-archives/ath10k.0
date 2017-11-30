Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eKSZS-0001Na-Nr
 for ath10k@lists.infradead.org; Thu, 30 Nov 2017 17:24:26 +0000
Subject: Re: ath10k; QCA9984 firmware crash
References: <CA+_ehUwYhLUpZjUmJvcA5iwWTOt6XZKYL9q9aL=NnKhzqpFrDg@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <1328332e-5506-4cd5-f547-921316e19eee@candelatech.com>
Date: Thu, 30 Nov 2017 09:23:56 -0800
MIME-Version: 1.0
In-Reply-To: <CA+_ehUwYhLUpZjUmJvcA5iwWTOt6XZKYL9q9aL=NnKhzqpFrDg@mail.gmail.com>
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
To: Ansuel Smith <ansuelsmth@gmail.com>, ath10k@lists.infradead.org

On 11/30/2017 09:04 AM, Ansuel Smith wrote:
> had this crash when restarting 5ghz wireless. Very bad performance and
> stability on a netgear r7800. Near wifi are on different channel, with
> old kernel 4.4 there were no issue. With the new kernel 4.9 i have
> this kind of problem and a bandwidth of max 20-30 mbps. Can make any
> test as for now i can't use it due to this problem. (Running lede with
> latest commit)

I'd be curious if the ath10k-ct driver and firmware worked better
for you?  Should be easily selectable in LEDE.

Thanks,
Ben

>
>
> Wed Nov 29 21:42:37 2017 kern.warn kernel: [ 468.251798] ath10k_pci
> 0000:01:00.0: failed to flush transmit queue (skip 0 ar-state 1): 0
> Wed Nov 29 21:42:37 2017 kern.warn kernel: [ 468.296253] ath10k_pci
> 0000:01:00.0: peer-unmap-event: unknown peer id 1
> Wed Nov 29 21:42:37 2017 kern.warn kernel: [ 468.296281] ath10k_pci
> 0000:01:00.0: peer-unmap-event: unknown peer id 1
> Wed Nov 29 21:42:37 2017 kern.err kernel: [ 468.309466] ath10k_pci
> 0000:01:00.0: firmware crashed! (guid
> c95b3960-6710-4367-ad39-3706a2029428)
> Wed Nov 29 21:42:37 2017 kern.info kernel: [ 468.309501] ath10k_pci
> 0000:01:00.0: qca9984/qca9994 hw1.0 target 0x01000000 chip_id
> 0x00000000 sub 168c:cafe
> Wed Nov 29 21:42:37 2017 kern.info kernel: [ 468.317563] ath10k_pci
> 0000:01:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 1 testmode 1
> Wed Nov 29 21:42:37 2017 kern.info kernel: [ 468.329756] ath10k_pci
> 0000:01:00.0: firmware ver 10.4-3.4-00082 api 5 features
> no-p2p,mfp,peer-flow-ctrl,btcoex-param,allows-mesh-bcast crc32
> f301de65
> Wed Nov 29 21:42:37 2017 kern.info kernel: [ 468.336109] ath10k_pci
> 0000:01:00.0: board_file api 2 bmi_id 0:1 crc32 751efba1
> Wed Nov 29 21:42:37 2017 kern.info kernel: [ 468.349056] ath10k_pci
> 0000:01:00.0: htt-ver 2.2 wmi-op 6 htt-op 4 cal pre-cal-file max-sta
> 512 raw 0 hwcrypto 1
> Wed Nov 29 21:42:37 2017 kern.warn kernel: [ 468.368374] ath10k_pci
> 0000:01:00.0: failed to get memcpy hi address for firmware address 4:
> -16
> Wed Nov 29 21:42:37 2017 kern.err kernel: [ 468.368399] ath10k_pci
> 0000:01:00.0: failed to read firmware dump area: -16
> Wed Nov 29 21:42:37 2017 kern.err kernel: [ 468.376263] ath10k_pci
> 0000:01:00.0: Copy Engine register dump:
> Wed Nov 29 21:42:37 2017 kern.err kernel: [ 468.382956] ath10k_pci
> 0000:01:00.0: [00]: 0x0004a000 3735928559 3735928559 3735928559
> 3735928559
> Wed Nov 29 21:42:37 2017 kern.err kernel: [ 468.388808] ath10k_pci
> 0000:01:00.0: [01]: 0x0004a400 3735928559 3735928559 3735928559
> 3735928559
> Wed Nov 29 21:42:37 2017 kern.err kernel: [ 468.397885] ath10k_pci
> 0000:01:00.0: [02]: 0x0004a800 3735928559 3735928559 3735928559
> 3735928559
> Wed Nov 29 21:42:37 2017 kern.err kernel: [ 468.406757] ath10k_pci
> 0000:01:00.0: [03]: 0x0004ac00 3735928559 3735928559 3735928559
> 3735928559
> Wed Nov 29 21:42:37 2017 kern.err kernel: [ 468.415598] ath10k_pci
> 0000:01:00.0: [04]: 0x0004b000 3735928559 3735928559 3735928559
> 3735928559
> Wed Nov 29 21:42:37 2017 kern.err kernel: [ 468.424470] ath10k_pci
> 0000:01:00.0: [05]: 0x0004b400 3735928559 3735928559 3735928559
> 3735928559
> Wed Nov 29 21:42:37 2017 kern.err kernel: [ 468.433311] ath10k_pci
> 0000:01:00.0: [06]: 0x0004b800 3735928559 3735928559 3735928559
> 3735928559
> Wed Nov 29 21:42:37 2017 kern.err kernel: [ 468.442152] ath10k_pci
> 0000:01:00.0: [07]: 0x0004bc00 3735928559 3735928559 3735928559
> 3735928559
> Wed Nov 29 21:42:37 2017 kern.err kernel: [ 468.450960] ath10k_pci
> 0000:01:00.0: [08]: 0x0004c000 3735928559 3735928559 3735928559
> 3735928559
> Wed Nov 29 21:42:37 2017 kern.err kernel: [ 468.459872] ath10k_pci
> 0000:01:00.0: [09]: 0x0004c400 3735928559 3735928559 3735928559
> 3735928559
> Wed Nov 29 21:42:37 2017 kern.err kernel: [ 468.468738] ath10k_pci
> 0000:01:00.0: [10]: 0x0004c800 3735928559 3735928559 3735928559
> 3735928559
> Wed Nov 29 21:42:37 2017 kern.err kernel: [ 468.477587] ath10k_pci
> 0000:01:00.0: [11]: 0x0004cc00 3735928559 3735928559 3735928559
> 3735928559
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
