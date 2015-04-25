Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ylp1Y-0005T8-6g
 for ath10k@lists.infradead.org; Sat, 25 Apr 2015 01:36:53 +0000
Message-ID: <553AEFFA.6010709@candelatech.com>
Date: Fri, 24 Apr 2015 18:38:02 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: attempting mesh on ath10k
References: <20150424125055.GA27722@localhost>
 <CAEFj986N0UnCnzFWLTd=MkSWRU0jOG36N4SVepkmXPnaLX__0g@mail.gmail.com>
In-Reply-To: <CAEFj986N0UnCnzFWLTd=MkSWRU0jOG36N4SVepkmXPnaLX__0g@mail.gmail.com>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>, Bob Copeland <me@bobcopeland.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 04/24/2015 10:55 AM, Yeoh Chun-Yeow wrote:
> Hi, Bob
>
> I have tried converting the "adhoc" mode on the
> firmware-2.bin_999.999.0.636 as mesh interface.
>
> You can find my patches here:
> https://github.com/chunyeow/ath/commits/mesh
>
> But probably too many workaround and won't be able to interoperate
> with other mesh interface.
>
> I have also found out the immediate crashes when peer mesh STA is
> added by the firmware if using "AP" mode.
> https://github.com/chunyeow/ath/commit/c09a7ef83a5912d1965756b9ce4c9a22ae1dcf08
>
> Hi, Ben
>
> You have any updates on CT firmware to support the mesh mode?
>
> Please advice. Thanks

I have IBSS support working, and at least non-encrypted raw transmit
can work in my firmware, though raw tx requires Michal's RFC patch
he posted some time ago.

Don't know about mesh, but if you can crash my firmware, please send
me the debug info and I'll see if I can figure out why.

I am not sure raw tx with encryption is possible...and at the least,
it is probably not something I'll attempt to do for fun anytime soon.

Thanks,
Ben


>
> ---
> Chun-Yeow
>
>
> On Fri, Apr 24, 2015 at 8:50 PM, Bob Copeland <me@bobcopeland.com> wrote:
>> Hi all,
>>
>> I have played around a little bit with the raw mode patches trying to
>> get mesh working on ath10k.  I've hacked the driver slightly to use an
>> AP vif in the firmware in "mesh" mode, which seems to produce proper looking
>> beacons over the air.
>>
>> However, when I bring up a second mesh node, the ath10k device crashes
>> upon trying to send the first mesh peering action frame.  Here's what
>> dmesg looks like:
>>
>> [   43.860000] ath10k_pci 0000:01:00.0: wmi event debug mesg len 140
>> [   44.310000] XXX trying to create peer 00:03:7f:10:4e:2d
>> [   44.310000] ath10k_pci 0000:01:00.0: wmi peer create vdev_id 0 peer_addr 00:03:7f:10:4e:2d
>> [   44.320000] XXX sending WMI cmd 36892
>> [   44.320000] XXX sending WMI cmd nowait 36892
>> [   44.330000] XXX waiting for peer create 00:03:7f:10:4e:2d
>> [   44.330000] XXX peer 00:03:7f:10:4e:2d added
>> [   44.340000] ath10k_pci 0000:01:00.0: wmi peer assoc vdev 0 addr 00:03:7f:10:4e:2d (new)
>> [   44.350000] XXX sending WMI cmd 36896
>> [   44.350000] XXX sending WMI cmd nowait 36896
>> [   44.350000] ath10k_pci 0000:01:00.0: received event id 36891 not implemented
>> [   44.360000] mesh: sending popen to 00:03:7f:10:4e:2d
>> [   44.380000] ath10k_pci 0000:01:00.0: wmi mgmt tx skb 86fb4e40 len 84 ftype 00 stype d0
>> [   44.390000] XXX sending WMI cmd 36905
>> [   44.390000] XXX sending WMI cmd nowait 36905
>> [   44.390000] ath10k_pci 0000:01:00.0: firmware crashed! (uuid 839037ff-ad03-4442-9114-f99e03204c
>> [   44.400000] ath10k_pci 0000:01:00.0: qca988x hw2.0 (0x4100016c, 0x043202ff) fw 10.2-00082-4-2 a
>> [   44.410000] ath10k_pci 0000:01:00.0: debug 1 debugfs 1 tracing 0 dfs 1 testmode 1
>> [   44.420000] ath10k_pci 0000:01:00.0: firmware register dump:
>> [   44.430000] ath10k_pci 0000:01:00.0: [00]: 0x4100016C 0x000015B3 0x009A98BE 0x00955B31
>> [   44.440000] ath10k_pci 0000:01:00.0: [04]: 0x009A98BE 0x00060330 0x0000001E 0x00000B00
>> [   44.440000] ath10k_pci 0000:01:00.0: [08]: 0x00447730 0x009C3014 0x00446970 0x00000078
>> [   44.450000] ath10k_pci 0000:01:00.0: [12]: 0x00000009 0xFFFFFFFF 0x00958360 0x0095836B
>> [   44.460000] ath10k_pci 0000:01:00.0: [16]: 0x00958080 0x009A6CCF 0x00000000 0x00000000
>> [   44.470000] ath10k_pci 0000:01:00.0: [20]: 0x409A98BE 0x0040AB14 0x0040FAA8 0x0043E677
>> [   44.480000] ath10k_pci 0000:01:00.0: [24]: 0x809A9958 0x0040AB74 0x0043E7CC 0xC09A98BE
>> [   44.480000] ath10k_pci 0000:01:00.0: [28]: 0x8099F2E9 0x0040AB94 0x009C3014 0x0040AD04
>> [   44.490000] ath10k_pci 0000:01:00.0: [32]: 0x8098933F 0x0040ABB4 0x0043D0D8 0x0040AD04
>> [   44.500000] ath10k_pci 0000:01:00.0: [36]: 0x809B38C0 0x0040ABD4 0x009C3014 0x0043D0D8
>> [   44.510000] ath10k_pci 0000:01:00.0: [40]: 0x809AFD68 0x0040AD94 0x00400000 0x00416688
>> [   44.520000] ath10k_pci 0000:01:00.0: [44]: 0x809BDA75 0x0040ADE4 0x0040AE08 0x00411D44
>> [   44.520000] ath10k_pci 0000:01:00.0: [48]: 0x809486FA 0x0040AE04 0x00000001 0x00000000
>> [   44.530000] ath10k_pci 0000:01:00.0: [52]: 0x80948E2C 0x0040AEA4 0x0041E424 0x00412350
>> [   44.540000] ath10k_pci 0000:01:00.0: [56]: 0x809BCF0D 0x0040AEC4 0x0041E424 0x00000001
>>
>> My hacky compat-wireless snapshot is over here, any suggestions on what to
>> try next to debug further are welcome:
>>
>>      https://github.com/bcopeland/ath10k-mesh
>>
>> [Also I tried skipping the mgmt tx datapath and use normal datapath,
>> as seen in the final patch, but that doesn't change things, it crashes
>> either way.]
>>
>> Maybe I'm not setting up peers correctly or something like that?
>>
>> --
>> Bob Copeland %% http://bobcopeland.com/
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
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
