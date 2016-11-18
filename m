Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c7oGd-0002E2-J3
 for ath10k@lists.infradead.org; Fri, 18 Nov 2016 18:52:08 +0000
Subject: Re: IPQ4019 Firmware: board-2.bin vs board.bin
References: <3020314.NNveBmB38o@debian64>
 <CA+BoTQ=6x=4V8=1-Co4quZ3UDTzDT_Q=iP6R-pSQd1qkesMDSg@mail.gmail.com>
 <2201471.3r8NqtoCOn@debian64>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <2f7b9c21-28fb-5a55-834d-3b18adfdfc5e@candelatech.com>
Date: Fri, 18 Nov 2016 10:45:36 -0800
MIME-Version: 1.0
In-Reply-To: <2201471.3r8NqtoCOn@debian64>
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
To: Christian Lamparter <chunkeey@googlemail.com>, Michal Kazior <michal.kazior@tieto.com>
Cc: "Valo, Kalle" <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 11/18/2016 10:40 AM, Christian Lamparter wrote:
> On Friday, November 18, 2016 6:25:24 PM CET Michal Kazior wrote:
>> On 18 November 2016 at 17:46, Christian Lamparter
>> <chunkeey@googlemail.com> wrote:
>>> I've acquired a IPQ4019 Router (Asus RT-AC58U). And It has a IPQ4019-SoC.
>>> I'm currently in the process of porting it to LEDE. I can report that the
>>> router is booting and I got the ath10k to work with 4.8.8 +
>>> LEDE's compat-wireless (2016-10-08-1).
>>>
>>> Now, I ran across a small discrepancy with the provided firmware for
>>> the IPQ4019. From the ath10k's driver prospective it seems that the
>>> board-2.bin provided on github[0] has the wrong filename:
>>>
>>> ath10k_ahb a000000.wifi: Direct firmware load for ath10k/pre-cal-ahb-a000000.wifi.bin failed with error -2
>>> ath10k_ahb a000000.wifi: Falling back to user helper
>>> firmware ath10k!pre-cal-ahb-a000000.wifi.bin: firmware_loading_store: map pages failed
>>> ath10k_ahb a000000.wifi: qca4019 hw1.0 target 0x01000000 chip_id 0x003b00ff sub 0000:0000
>>> ath10k_ahb a000000.wifi: kconfig debug 0 debugfs 1 tracing 0 dfs 1 testmode 1
>>> ath10k_ahb a000000.wifi: firmware ver 10.4-3.2.1-00044 api 5 features no-p2p,mfp,peer-flow-ctrl,btcoex-param crc32 b9833652
>>> ath10k_ahb a000000.wifi: failed to fetch board data for bus=ahb,vendor=0000,device=0000,subsystem-vendor=0000,subsystem-devn
>>
>> As far as I remember QCA4019 is supposed to used bmi chip
>> identification instead of pci ids for board files. For some reason the
>> driver uses pci ids on your device. Can you load ath10k_core with
>> debug_mask=0xffffff3f and post results, please? I recall OpenWRT was
>> messing with board file logic with its downstream patches and I
>> wouldn't be surprised if LEDE keeps on doing that as well.
>
> I've attached the logs you want for both cases (board.bin and board2.bin).
> LEDE does indeed patch ath10k [0]. But as far as I can tell, LEDE just
> adds a extra path to supply the caldata [1] via request_firmware.

Try using the board-2.bin from here?  That fixed my QCA9888 chipset NIC issues...

  git://codeaurora.org/quic/qsdk/oss/firmware/ath10k-firmware

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
