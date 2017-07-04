Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-eopbgr30130.outbound.protection.outlook.com
 ([40.107.3.130] helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dSQDH-00080F-Db
 for ath10k@lists.infradead.org; Tue, 04 Jul 2017 15:58:09 +0000
Subject: Re: WARN_ON_ONCE(work > weight) in napi_poll()
References: <26670dce-4dd2-f8e4-0e14-90d74257e739@virtuozzo.com>
 <87wp7oia6j.fsf@kamboji.qca.qualcomm.com>
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Message-ID: <952aefe1-6f6a-3978-e7e7-5e74076f26a3@virtuozzo.com>
Date: Tue, 4 Jul 2017 18:59:56 +0300
MIME-Version: 1.0
In-Reply-To: <87wp7oia6j.fsf@kamboji.qca.qualcomm.com>
Content-Language: en-US
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Networking <netdev@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 07/04/2017 04:49 PM, Kalle Valo wrote:
> Andrey Ryabinin <aryabinin@virtuozzo.com> writes:
> 
>> I occasionally hit WARN_ON_ONCE(work > weight); in napi_poll() on a
>> laptop with ath10k card.
>>
>>
>> [37207.593370] ------------[ cut here ]------------
>> [37207.593380] WARNING: CPU: 0 PID: 7 at ../net/core/dev.c:5274
>> net_rx_action+0x258/0x360
>> [37207.593381] Modules linked in: snd_hda_codec_realtek snd_soc_skl
>> snd_hda_codec_generic snd_soc_skl_ipc snd_soc_sst_ipc snd_soc_sst_dsp
>> snd_hda_ext_core snd_soc_sst_match snd_soc_core rtsx_pci_sdmmc
>> mmc_core snd_pcm_dmaengine x86_pkg_temp_thermal snd_hda_intel uvcvideo
>> kvm_intel videobuf2_vmalloc kvm snd_hda_codec snd_hwdep btusb
>> videobuf2_memops btintel snd_hda_core videobuf2_v4l2 bluetooth
>> irqbypass snd_pcm videobuf2_core crc32c_intel videodev mei_me mei
>> rtsx_pci intel_lpss_pci intel_lpss_acpi intel_vbtn intel_lpss mfd_core
>> tpm_tis intel_hid tpm_tis_core tpm efivarfs
>> [37207.593430] CPU: 0 PID: 7 Comm: ksoftirqd/0 Not tainted 4.11.7 #28
>> [37207.593432] Hardware name: Dell Inc. XPS 13 9360/0839Y6, BIOS 1.3.5 05/08/2017
> 
> What firmware and hardware versions exactly? The dmesg output when
> ath10k loads is preferred. As you are using XPS 13 I'm guessing it's one
> of QCA6174 family.
> 

Yes it's qca6174.

$ dmesg |grep ath10
[    0.624828] ath10k_pci 0000:3a:00.0: enabling device (0000 -> 0002)
[    0.626370] ath10k_pci 0000:3a:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
[    0.837862] ath10k_pci 0000:3a:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:1535
[    0.837863] ath10k_pci 0000:3a:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 0 testmode 0
[    0.838388] ath10k_pci 0000:3a:00.0: firmware ver WLAN.RM.2.0-00180-QCARMSWPZ-1 api 4 features wowlan,ignore-otp,no-4addr-pad crc32 75dee6c5
[    0.900606] ath10k_pci 0000:3a:00.0: board_file api 2 bmi_id N/A crc32 19644295
[    3.020681] ath10k_pci 0000:3a:00.0: htt-ver 3.26 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[    9.574087] ath10k_pci 0000:3a:00.0 wlp58s0: renamed from wlan0

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
