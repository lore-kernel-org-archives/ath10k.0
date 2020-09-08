Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFhji-0000BP-MX
 for ath10k@lists.infradead.org; Tue, 08 Sep 2020 17:48:55 +0000
Subject: Re: [PATCH,v4] Revert "ath10k: fix DMA related firmware crashes on
 multiple devices"
References: <1578976521-6104-1-git-send-email-zhichen@codeaurora.org>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <79a88865-6df5-e7a4-deb6-6025cc9d87e4@candelatech.com>
Date: Tue, 8 Sep 2020 10:48:49 -0700
MIME-Version: 1.0
In-Reply-To: <1578976521-6104-1-git-send-email-zhichen@codeaurora.org>
Content-Language: en-MW
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
To: Zhi Chen <zhichen@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Hello,

Just FYI:  I added this patch to my ath10k-ct driver, and a user reported it causes
regressions on his particular 9888 system when using ath10k-ct wave-2 firmware:

[   21.204868] ath10k_pci 0000:00:00.0: qca9888 hw2.0 target 0x01000000 chip_id 0x00000000 sub 0000:0000
[   21.214437] ath10k_pci 0000:00:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 1 testmode 0
[   21.233298] ath10k_pci 0000:00:00.0: firmware ver 10.4b-ct-9888-tH-13-8c5b2baa2 api 5 features 
mfp,peer-flow-ctrl,txstatus-noack,wmi-10.x-CT,ratemask-CT,regdump-CT,txrate-CT,flush-all-CT,pingpong-CT,ch-regs-CT,nop-CT,htt-mgt-CT,set-special-CT,no-bmiss-CT,tx-rc-CT,cust-stats-CT,txrate2-CT,beacon-cb-CT,wmi-block-ack-CT,wmi-bcn-rc-CT 
crc32 a00b5f36
[   21.596684] ath10k_pci 0000:00:00.0: board_file api 2 bmi_id 0:20 crc32 5bb32c02[   23.546156] ath10k_pci 0000:00:00.0: unsupported HTC service id: 1536

I'll revert this for the 9888 chipset (at least) in my driver, possibly you need to do similar.

https://github.com/greearb/ath10k-ct/issues/153

Thanks,
Ben

On 1/13/20 8:35 PM, Zhi Chen wrote:
> This reverts commit 76d164f582150fd0259ec0fcbc485470bcd8033e.
> PCIe hung issue was observed on multiple platforms. The issue was reproduced
> when DUT was configured as AP and associated with 50+ STAs.
> 
> For QCA9984/QCA9888, the DMA_BURST_SIZE register controls the AXI burst size
> of the RD/WR access to the HOST MEM.
> 0 - No split , RAW read/write transfer size from MAC is put out on bus
>      as burst length
> 1 - Split at 256 byte boundary
> 2,3 - Reserved
> 
> With PCIe protocol analyzer, we can see DMA Read crossing 4KB boundary when
> issue happened. It broke PCIe spec and caused PCIe stuck. So revert
> the default value from 0 to 1.
> 
> Tested:  IPQ8064 + QCA9984 with firmware 10.4-3.10-00047
>           QCS404 + QCA9984 with firmware 10.4-3.9.0.2--00044
>           Synaptics AS370 + QCA9888  with firmware 10.4-3.9.0.2--00040
> 
> Signed-off-by: Zhi Chen <zhichen@codeaurora.org>
> ---
> v2: restored 10.2 register configuration
> v3: modified commit message
> v4: resolved conflicts
> ---
>   drivers/net/wireless/ath/ath10k/hw.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
> index 21b7a2a..775fd62 100644
> --- a/drivers/net/wireless/ath/ath10k/hw.h
> +++ b/drivers/net/wireless/ath/ath10k/hw.h
> @@ -816,7 +816,7 @@ ath10k_is_rssi_enable(struct ath10k_hw_params *hw,
>   
>   #define TARGET_10_4_TX_DBG_LOG_SIZE		1024
>   #define TARGET_10_4_NUM_WDS_ENTRIES		32
> -#define TARGET_10_4_DMA_BURST_SIZE		0
> +#define TARGET_10_4_DMA_BURST_SIZE		1
>   #define TARGET_10_4_MAC_AGGR_DELIM		0
>   #define TARGET_10_4_RX_SKIP_DEFRAG_TIMEOUT_DUP_DETECTION_CHECK 1
>   #define TARGET_10_4_VOW_CONFIG			0
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
