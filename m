Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7xpk-0005HM-0w
 for ath10k@lists.infradead.org; Tue, 18 Aug 2020 09:23:09 +0000
MIME-Version: 1.0
Date: Tue, 18 Aug 2020 17:23:05 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v4 2/2] ath10k: add fw coredump for sdio when firmware
 assert
In-Reply-To: <87mu2xkwv9.fsf@codeaurora.org>
References: <1569310030-834-1-git-send-email-wgong@codeaurora.org>
 <1569310030-834-3-git-send-email-wgong@codeaurora.org>
 <87mu2xkwv9.fsf@codeaurora.org>
Message-ID: <103b604e367a150850d4e8fe179c727f@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2020-08-15 00:36, Kalle Valo wrote:
> Wen Gong <wgong@codeaurora.org> writes:
> 
...
> 
> I did some changes in the pending branch, please check:
> 
I compared this patch with patch in pending branch, it is OK for me.
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=de03e26479e2cf5f3e1753bda517f44910457036
> 
> Also please send dmesg output from a firmware crash, I'll add it to the
> commit log as an example.
> 
message of this patch:
[ 1378.668263] ath10k_sdio mmc1:0001:1: simulating soft firmware crash
[ 1378.675727] ath10k_sdio mmc1:0001:1: begin fw dump
[ 1378.686200] ath10k_sdio mmc1:0001:1: firmware crashed! (guid 
413d98b1-84c0-4298-b605-2b10ec0c54a5)
[ 1378.695375] ath10k_sdio mmc1:0001:1: qca6174 hw3.2 sdio target 
0x05030000 chip_id 0x00000000 sub 0000:0000
[ 1378.705121] ath10k_sdio mmc1:0001:1: kconfig debug 1 debugfs 1 
tracing 1 dfs 0 testmode 1
[ 1378.714502] ath10k_sdio mmc1:0001:1: firmware ver 
WLAN.RMH4.4.1-00126-QCARMSWP-1 api 6 features wowlan,ignore-otp,raw-mode 
crc32 b84317cf
[ 1378.728077] ath10k_sdio mmc1:0001:1: board_file api 2 bmi_id 0:4 
crc32 6364cfcc
[ 1378.735414] ath10k_sdio mmc1:0001:1: htt-ver 3.69 wmi-op 4 htt-op 3 
cal otp max-sta 32 raw 0 hwcrypto 1
[ 1378.748882] ath10k_sdio mmc1:0001:1: firmware register dump:
[ 1378.754582] ath10k_sdio mmc1:0001:1: [00]: 0x05030000 0x000015B3 
0x0099908D 0x00955B31
[ 1378.762547] ath10k_sdio mmc1:0001:1: [04]: 0x0099908D 0x00060730 
0x00000018 0x004641A0
[ 1378.770504] ath10k_sdio mmc1:0001:1: [08]: 0x0041FAA4 0x0041FA9C 
0x00999070 0x00404490
[ 1378.778440] ath10k_sdio mmc1:0001:1: [12]: 0x00000009 0xFFFFFFFF 
0x00952CD0 0x00952CE6
[ 1378.786540] ath10k_sdio mmc1:0001:1: [16]: 0x00952CC4 0x00910712 
0x00000000 0x00000000
[ 1378.794508] ath10k_sdio mmc1:0001:1: [20]: 0x4099908D 0x0040E9E8 
0x00000001 0x00423AC0
[ 1378.802449] ath10k_sdio mmc1:0001:1: [24]: 0x809F3189 0x0040EA48 
0x00426240 0xC099908D
[ 1378.810379] ath10k_sdio mmc1:0001:1: [28]: 0x809143A7 0x0040EA68 
0x0041FAA4 0x00423A80
[ 1378.818313] ath10k_sdio mmc1:0001:1: [32]: 0x809F1193 0x0040EA88 
0x00411770 0x004117E0
[ 1378.826246] ath10k_sdio mmc1:0001:1: [36]: 0x809F0EEE 0x0040EAA8 
0x00000000 0x00000000
[ 1378.834188] ath10k_sdio mmc1:0001:1: [40]: 0x80911210 0x0040EAC8 
0x00000008 0x00404130
[ 1378.842166] ath10k_sdio mmc1:0001:1: [44]: 0x80911154 0x0040EB28 
0x00400000 0x00000000
[ 1378.851006] ath10k_sdio mmc1:0001:1: [48]: 0x8091122D 0x0040EB48 
0x00000000 0x00400600
[ 1378.858947] ath10k_sdio mmc1:0001:1: [52]: 0x40910024 0x0040EB78 
0x0040AB98 0x0040AB98
[ 1378.866880] ath10k_sdio mmc1:0001:1: [56]: 0x00000000 0x0040EB98 
0x009BB001 0x00040020
[ 1392.089770] ath10k_sdio mmc1:0001:1: dump mem, name:DRAM, type:2, 
start:0x400000, len:0xa8000, size:0, ret:0xa8000
[ 1393.987320] ath10k_sdio mmc1:0001:1: dump mem, name:AXI, type:3, 
start:0xa0000, len:0x18000, size:0, ret:0x18000
[ 1404.113610] ath10k_sdio mmc1:0001:1: dump mem, name:IRAM1, type:4, 
start:0x980000, len:0x80000, size:0, ret:0x80000
[ 1409.231972] ath10k_sdio mmc1:0001:1: dump mem, name:IRAM2, type:5, 
start:0xa00000, len:0x40000, size:0, ret:0x40000
[ 1409.767636] ath10k_sdio mmc1:0001:1: dump mem, name:REG_TOTAL, 
type:1, start:0x800, len:0x7f820, size:245, ret:0x7f820

message if use 
https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=de03e26479e2cf5f3e1753bda517f44910457036
it removed "begin fw dump" and "dump mem, name:..."

[ 1378.668263] ath10k_sdio mmc1:0001:1: simulating soft firmware crash
[ 1378.680788] ath10k_sdio mmc1:0001:1: check fw reg : 400
[ 1378.686200] ath10k_sdio mmc1:0001:1: firmware crashed! (guid 
413d98b1-84c0-4298-b605-2b10ec0c54a5)
[ 1378.695375] ath10k_sdio mmc1:0001:1: qca6174 hw3.2 sdio target 
0x05030000 chip_id 0x00000000 sub 0000:0000
[ 1378.705121] ath10k_sdio mmc1:0001:1: kconfig debug 1 debugfs 1 
tracing 1 dfs 0 testmode 1
[ 1378.714502] ath10k_sdio mmc1:0001:1: firmware ver 
WLAN.RMH4.4.1-00126-QCARMSWP-1 api 6 features wowlan,ignore-otp,raw-mode 
crc32 b84317cf
[ 1378.728077] ath10k_sdio mmc1:0001:1: board_file api 2 bmi_id 0:4 
crc32 6364cfcc
[ 1378.735414] ath10k_sdio mmc1:0001:1: htt-ver 3.69 wmi-op 4 htt-op 3 
cal otp max-sta 32 raw 0 hwcrypto 1
[ 1378.748882] ath10k_sdio mmc1:0001:1: firmware register dump:
[ 1378.754582] ath10k_sdio mmc1:0001:1: [00]: 0x05030000 0x000015B3 
0x0099908D 0x00955B31
[ 1378.762547] ath10k_sdio mmc1:0001:1: [04]: 0x0099908D 0x00060730 
0x00000018 0x004641A0
[ 1378.770504] ath10k_sdio mmc1:0001:1: [08]: 0x0041FAA4 0x0041FA9C 
0x00999070 0x00404490
[ 1378.778440] ath10k_sdio mmc1:0001:1: [12]: 0x00000009 0xFFFFFFFF 
0x00952CD0 0x00952CE6
[ 1378.786540] ath10k_sdio mmc1:0001:1: [16]: 0x00952CC4 0x00910712 
0x00000000 0x00000000
[ 1378.794508] ath10k_sdio mmc1:0001:1: [20]: 0x4099908D 0x0040E9E8 
0x00000001 0x00423AC0
[ 1378.802449] ath10k_sdio mmc1:0001:1: [24]: 0x809F3189 0x0040EA48 
0x00426240 0xC099908D
[ 1378.810379] ath10k_sdio mmc1:0001:1: [28]: 0x809143A7 0x0040EA68 
0x0041FAA4 0x00423A80
[ 1378.818313] ath10k_sdio mmc1:0001:1: [32]: 0x809F1193 0x0040EA88 
0x00411770 0x004117E0
[ 1378.826246] ath10k_sdio mmc1:0001:1: [36]: 0x809F0EEE 0x0040EAA8 
0x00000000 0x00000000
[ 1378.834188] ath10k_sdio mmc1:0001:1: [40]: 0x80911210 0x0040EAC8 
0x00000008 0x00404130
[ 1378.842166] ath10k_sdio mmc1:0001:1: [44]: 0x80911154 0x0040EB28 
0x00400000 0x00000000
[ 1378.851006] ath10k_sdio mmc1:0001:1: [48]: 0x8091122D 0x0040EB48 
0x00000000 0x00400600
[ 1378.858947] ath10k_sdio mmc1:0001:1: [52]: 0x40910024 0x0040EB78 
0x0040AB98 0x0040AB98
[ 1378.866880] ath10k_sdio mmc1:0001:1: [56]: 0x00000000 0x0040EB98 
0x009BB001 0x00040020

>> +static void ath10k_sdio_check_fw_reg(struct ath10k *ar, u32 
>> *fast_dump)
>> +{
>> +	u32 param;
>> +
>> +	ath10k_sdio_read_host_interest_value(ar, HI_ITEM(hi_option_flag2), 
>> &param);
>> +
>> +	*fast_dump = ((param & HI_OPTION_SDIO_CRASH_DUMP_ENHANCEMENT_FW)
>> +			     == HI_OPTION_SDIO_CRASH_DUMP_ENHANCEMENT_FW);
>> +
>> +	ath10k_dbg(ar, ATH10K_DBG_SDIO, "sdio hi_option_flag2 %x\n", param);
>> +}
> 
> I renamed this ath10k_sdio_is_fast_dump_supported() which returns a
> boolean. Also I changed all fast_dump variables to a boolean.
OK.
> 
...
>> +		ret = ath10k_sdio_dump_memory_generic(ar, current_region, buf, 
>> fast_dump);
>> +
>> +		ath10k_err(ar, "dump mem, name:%s, type:%d, start:0x%x, len:0x%x, 
>> size:%d, ret:0x%x\n",
>> +			   current_region->name,
>> +			   current_region->type,
>> +			   current_region->start,
>> +			   current_region->len,
>> +			   current_region->section_table.size,
>> +			   ret);
> 
> This error print looks like a debug message, so I removed it. If you
> need it, let me know.
> 
OK
>> +void ath10k_sdio_fw_crashed_dump(struct ath10k *ar)
>> +{
>> +	struct ath10k_fw_crash_data *crash_data;
>> +	char guid[UUID_STRING_LEN + 1];
>> +	u32 fast_dump = 0;
>> +
>> +	ath10k_err(ar, "begin fw dump\n");
> 
> This also looks like a debug message so I removed it.
> 
>> +	ath10k_sdio_check_fw_reg(ar, &fast_dump);
>> +
>> +	if (fast_dump)
>> +		ar->bmi.done_sent = false;
> 
> I did some refactoring in patch "ath10k: move enable_pll_clk call to
> ath10k_core_start()" (submitted separately) so that I could change this
> to ath10k_bmi_start().
OK
...

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
