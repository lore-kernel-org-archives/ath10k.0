Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2Dhu-00015W-JA
 for ath10k@lists.infradead.org; Fri, 08 Mar 2019 11:30:32 +0000
MIME-Version: 1.0
Date: Fri, 08 Mar 2019 17:00:29 +0530
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: Re: [PATCH] ath10k: fill the channel survey results for WCN3990
 correctly
In-Reply-To: <2de8e7ef-9cdd-d6c9-4110-fa57ca0a8622@kernel.org>
References: <2de8e7ef-9cdd-d6c9-4110-fa57ca0a8622@kernel.org>
Message-ID: <c84153d480eb77fa36c3a3ee5ec76da6@codeaurora.org>
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
To: Greg Ungerer <gerg@kernel.org>
Cc: ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>, Surabhi Vishnoi <svishnoi@codeaurora.org>

Hi Greg,

Yes, the commit 13104929d2ec ("[PATCH]ath10k: fill the channel survey 
results for WCN3990 correctly") causes a regression for the non-tlv 
targets since the common wmi channel info structure  was extended in 
this particular commit. The -EPROTO error is a result of this, since the 
wmi event for channel info has a size check which will fail due to the 
extension of the wmi_chan_info_event structure.

I have raised a fix for this
https://patchwork.kernel.org/patch/10844513/


Thanks,
Rakesh

On 2019-03-07 18:36, Greg Ungerer wrote:
> Hi Rakesh, Surabhi,
> 
> This patch, which is in the linux kernel as commit 13104929d2ec 
> ("[PATCH]
> ath10k: fill the channel survey results for WCN3990 correctly"), is 
> causing
> me problems when running linux-5.0 kernel.
> 
> I see messages like this on the console:
> 
>   ath10k_pci 0000:01:00.0: failed to parse chan info event: -71
> 
> They come out in bunches every few seconds. This same hardware and 
> setup
> works again if I revert out this patch.
> 
> For reference the hardware platform is a Mediatek MT7621 (quad core
> MIPS at 880MHz). The the ath10k hardware is a mini PCIe device.
> 
> The dmesg init trace for the ath10k modules is this:
> 
> <6>ath10k_pci 0000:01:00.0: enabling device (0000 -> 0002)^M
> <6>ath10k_pci 0000:01:00.0: pci irq legacy oper_irq_mode 1 irq_mode 0
> reset_mode 0^M
> <6>ath10k_pci 0000:01:00.0: qca988x hw2.0 target 0x4100016c chip_id
> 0x043222ff sub 0000:0000^M
> <6>ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 1
> testmode 0^M
> <6>ath10k_pci 0000:01:00.0: firmware ver 10.2.4-1.0-00043 api 5
> features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 ed0aafd8^M
> <6>ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A crc32 
> bebc7c08^M
> <4>ath10k_pci 0000:01:00.0: unsupported HTC service id: 1536^M
> <6>ath10k_pci 0000:01:00.0: htt-ver 2.1 wmi-op 5 htt-op 2 cal otp
> max-sta 128 raw 0 hwcrypto 1^M
> <7>ath: EEPROM regdomain: 0x0^M
> <7>ath: EEPROM indicates default country code should be used^M
> <7>ath: doing EEPROM country->regdmn map search^M
> <7>ath: country maps to regdmn code: 0x3a^M
> <7>ath: Country alpha2 being used: US^M
> <7>ath: Regpair used: 0x3a^M
> 
> I am using hostapd-2.7 and the linux-firmware package is the very 
> latest from
> their git repository.
> 
> This looks a lot like the problem reported by Justin Capella (thread at
> http://lists.infradead.org/pipermail/ath10k/2019-February/012900.html).
> 
> Anyway, thoughts?
> 
> Regards
> Greg

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
