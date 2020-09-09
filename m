Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-187.smtp-out.us-west-2.amazonses.com ([54.240.27.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFpTe-0006Hz-Ph
 for ath10k@lists.infradead.org; Wed, 09 Sep 2020 02:04:52 +0000
MIME-Version: 1.0
Date: Wed, 9 Sep 2020 02:04:46 +0000
From: Zhi Chen <zhichen@codeaurora.org>
Subject: Re: [PATCH,v4] Revert "ath10k: fix DMA related firmware crashes on
 multiple devices"
In-Reply-To: <79a88865-6df5-e7a4-deb6-6025cc9d87e4@candelatech.com>
References: <1578976521-6104-1-git-send-email-zhichen@codeaurora.org>
 <79a88865-6df5-e7a4-deb6-6025cc9d87e4@candelatech.com>
Message-ID: <01010174709bb404-11356286-621b-4ea7-bcc5-f6ae97c6b943-000000@us-west-2.amazonses.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi Ben,
   Thanks for your information. The DMA issue is host related. We never 
hit this issue with X86 platform. And it was only seen in stress cases 
with 50+ STAs(association and disassociation repeatedly). What's the 
host platform you are using? And how was the issue reproduced?

Thanks,
Zhi

On 2020-09-09 01:48, Ben Greear wrote:
> Hello,
> 
> Just FYI:  I added this patch to my ath10k-ct driver, and a user
> reported it causes
> regressions on his particular 9888 system when using ath10k-ct wave-2 
> firmware:
> 
> [   21.204868] ath10k_pci 0000:00:00.0: qca9888 hw2.0 target
> 0x01000000 chip_id 0x00000000 sub 0000:0000
> [   21.214437] ath10k_pci 0000:00:00.0: kconfig debug 0 debugfs 1
> tracing 0 dfs 1 testmode 0
> [   21.233298] ath10k_pci 0000:00:00.0: firmware ver
> 10.4b-ct-9888-tH-13-8c5b2baa2 api 5 features
> mfp,peer-flow-ctrl,txstatus-noack,wmi-10.x-CT,ratemask-CT,regdump-CT,txrate-CT,flush-all-CT,pingpong-CT,ch-regs-CT,nop-CT,htt-mgt-CT,set-special-CT,no-bmiss-CT,tx-rc-CT,cust-stats-CT,txrate2-CT,beacon-cb-CT,wmi-block-ack-CT,wmi-bcn-rc-CT
> crc32 a00b5f36
> [   21.596684] ath10k_pci 0000:00:00.0: board_file api 2 bmi_id 0:20
> crc32 5bb32c02[   23.546156] ath10k_pci 0000:00:00.0: unsupported HTC
> service id: 1536
> 
> I'll revert this for the 9888 chipset (at least) in my driver,
> possibly you need to do similar.
> 
> https://github.com/greearb/ath10k-ct/issues/153
> 
> Thanks,
> Ben
> 
> On 1/13/20 8:35 PM, Zhi Chen wrote:
>> This reverts commit 76d164f582150fd0259ec0fcbc485470bcd8033e.
>> PCIe hung issue was observed on multiple platforms. The issue was 
>> reproduced
>> when DUT was configured as AP and associated with 50+ STAs.
>> 
>> For QCA9984/QCA9888, the DMA_BURST_SIZE register controls the AXI 
>> burst size
>> of the RD/WR access to the HOST MEM.
>> 0 - No split , RAW read/write transfer size from MAC is put out on bus
>>      as burst length
>> 1 - Split at 256 byte boundary
>> 2,3 - Reserved
>> 
>> With PCIe protocol analyzer, we can see DMA Read crossing 4KB boundary 
>> when
>> issue happened. It broke PCIe spec and caused PCIe stuck. So revert
>> the default value from 0 to 1.
>> 
>> Tested:  IPQ8064 + QCA9984 with firmware 10.4-3.10-00047
>>           QCS404 + QCA9984 with firmware 10.4-3.9.0.2--00044
>>           Synaptics AS370 + QCA9888  with firmware 10.4-3.9.0.2--00040
>> 
>> Signed-off-by: Zhi Chen <zhichen@codeaurora.org>
>> ---
>> v2: restored 10.2 register configuration
>> v3: modified commit message
>> v4: resolved conflicts
>> ---
>>   drivers/net/wireless/ath/ath10k/hw.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/net/wireless/ath/ath10k/hw.h 
>> b/drivers/net/wireless/ath/ath10k/hw.h
>> index 21b7a2a..775fd62 100644
>> --- a/drivers/net/wireless/ath/ath10k/hw.h
>> +++ b/drivers/net/wireless/ath/ath10k/hw.h
>> @@ -816,7 +816,7 @@ ath10k_is_rssi_enable(struct ath10k_hw_params *hw,
>>     #define TARGET_10_4_TX_DBG_LOG_SIZE		1024
>>   #define TARGET_10_4_NUM_WDS_ENTRIES		32
>> -#define TARGET_10_4_DMA_BURST_SIZE		0
>> +#define TARGET_10_4_DMA_BURST_SIZE		1
>>   #define TARGET_10_4_MAC_AGGR_DELIM		0
>>   #define TARGET_10_4_RX_SKIP_DEFRAG_TIMEOUT_DUP_DETECTION_CHECK 1
>>   #define TARGET_10_4_VOW_CONFIG			0
>> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
