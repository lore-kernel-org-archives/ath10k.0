Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cjxKi-0008Og-WF
 for ath10k@lists.infradead.org; Sat, 04 Mar 2017 00:14:02 +0000
From: "Hsu, Ryan" <ryanhsu@qca.qualcomm.com>
Subject: Re: 4.9 Kernel panic on ACS and intermittent ability to host AP
Date: Sat, 4 Mar 2017 00:13:31 +0000
Message-ID: <005c8137-3d51-1bb4-46af-774af4e80aeb@qca.qualcomm.com>
References: <CALJ2kaEeauorokz4s6zEVTYcuqvnKzYUCNdXxiDH_h1aFqLcYQ@mail.gmail.com>
In-Reply-To: <CALJ2kaEeauorokz4s6zEVTYcuqvnKzYUCNdXxiDH_h1aFqLcYQ@mail.gmail.com>
Content-Language: en-US
Content-ID: <9EE7C6153F684F4BAF53C82D3DC3A72E@qualcomm.com>
MIME-Version: 1.0
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 03/01/2017 06:02 AM, Chris Price wrote:
>> Can you give it a try with the latest firmware - https://github.com/kvalo/ath10k-firmware.git
> I should mention that I have the 'skip_otp' directive set to 'y'. I
> tried the following both with and without this setting to no avail.
>
> The card seems to present only intermittently. When it does not
> present, I see the following in the kernel's ring buffer.
>
> # dmesg | grep ath
> [    3.460109] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2
> irq_mode 0 reset_mode 0
> [    3.745235] ath10k_pci 0000:02:00.0: firmware: failed to load
> ath10k/pre-cal-pci-0000:02:00.0.bin (-2)
> [    3.745240] ath10k_pci 0000:02:00.0: Direct firmware load for
> ath10k/pre-cal-pci-0000:02:00.0.bin failed with error -2
> [    3.745249] ath10k_pci 0000:02:00.0: firmware: failed to load
> ath10k/cal-pci-0000:02:00.0.bin (-2)
> [    3.745252] ath10k_pci 0000:02:00.0: Direct firmware load for
> ath10k/cal-pci-0000:02:00.0.bin failed with error -2
> [    3.747717] ath10k_pci 0000:02:00.0: firmware: direct-loading
> firmware ath10k/QCA6174/hw3.0/firmware-5.bin
> [    3.747723] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target
> 0x05030000 chip_id 0x00340aff sub 1a3b:2260
> [    3.747724] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 0
> tracing 0 dfs 0 testmode 0
> [    3.748278] ath10k_pci 0000:02:00.0: firmware ver
> WLAN.RM.4.4-00022-QCARMSWPZ-2 api 5 features wowlan,ignore-otp crc32
> 4d458559
> [    3.814875] ath10k_pci 0000:02:00.0: firmware: direct-loading
> firmware ath10k/QCA6174/hw3.0/board-2.bin
> [    3.814880] ath10k_pci 0000:02:00.0: failed to fetch board data for
> bus=pci,bmi-chip-id=0,bmi-board-id=0 from
> ath10k/QCA6174/hw3.0/board-2.bin

In the latest firmware, there is a feature supported with latest hw but not currently present in the card you've.
So the invalid board id is read from the hw and misplaced to create the file string, then the default (incorrect) board file is loaded to your case.

You might want to apply this one - https://patchwork.kernel.org/patch/9486941/

>
> It now seems to be having some trouble setting the interface up.
>
> # hostapd /etc/hostapd/hostapd1.conf
> Configuration file: /etc/hostapd/hostapd1.conf
> Could not set interface ap1 flags (UP): Connection timed out
> nl80211: Could not set interface 'ap1' UP
> nl80211: deinit ifname=ap1 disabled_11b_rates=0
> nl80211 driver initialization failed.
> ap1: interface state UNINITIALIZED->DISABLED
> ap1: AP-DISABLED
> hostapd_free_hapd_data: Interface ap1 wasn't started
>
> # ip link set dev ap1 up
> RTNETLINK answers: Connection timed out
>
> No kernel panics, however. If I delete the new firmware, the card then
> presents on each boot. I'm using the firmware from the repo at hash
> 8d15818.
>

As mentioned, please try the new firmware again.

>
> I wasn't clear about this part - there is only one card, and I wish to
> use it in one of a few ways. Namely, I want to host 2 access points,
> or host to one access point and connect to another. `iw list` gives me
> the following.
>
> valid interface combinations:
> * #{ managed } <= 2, #{ AP, mesh point, P2P-client, P2P-GO } <= 2, #{
> P2P-device } <= 1,
>   total <= 4, #channels <= 1
> * #{ managed } <= 2, #{ P2P-client } <= 2, #{ AP, mesh point, P2P-GO }
> <= 1, #{ P2P-device } <= 1,
>   total <= 4, #channels <= 2
> * #{ managed } <= 1, #{ IBSS } <= 1,
>   total <= 2, #channels <= 1
>
> Maybe I misunderstand the output, but I would expect to be able to
> host two access points simultaneously. However I am unable to do that
> by either running a single hostapd instance, specifying both config
> files, or by running two separate instances.

I never run multiple BSSID on the QCA6174 card, not sure will the hardware/firmware support it.
but from the interface combination shows, it doesn't support that though.


Ryan
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
