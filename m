Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDA1C87FD1
	for <ath10k@archiver.kernel.org>; Fri, 25 Jul 2025 12:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D0gjNThFi0+S0gW0KXu0QtHNwCrnk+Jm/at9TVIKL2I=; b=zjfyD6dnR+hbz7zec26dqKezoi
	3ZcPQltkdLFBi/BWihpx+WDjdnoT5NIHCBgHdh96abmrua1p8KydbyKYDqODiSgb9ctv+Q2osm73c
	UIN/XfLlAU7cm9W9UbpenlLRgmjb+OetXvbKXLadgozL3kOl8gNMi3HPrt1oOivW0dxOscmC7I88t
	8gNx+OA/qKiK2QHIgbgZMRoKDszcUQ3u/khnofJ7NY3U05pbRs2K565yR6oOdY9yMYBcBhGBoV+mT
	HddpbPJ1vClD+9iKr1a3bm76p1o3TxgiQlDs9ZRTGMosUS4+2VUCN1nUxCxYX8jkHt+XpBX8sujSe
	9vZSUWSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufHSQ-00000009oOt-2PIk;
	Fri, 25 Jul 2025 12:23:26 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufHLQ-00000009nVi-1dTn
	for ath10k@lists.infradead.org;
	Fri, 25 Jul 2025 12:16:14 +0000
Received: from [141.14.220.42] (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 2341B61E647AC;
	Fri, 25 Jul 2025 14:15:43 +0200 (CEST)
Content-Type: multipart/mixed; boundary="------------IWKL2dzaL8eep60TKGXgoNZv"
Message-ID: <8716a67c-6e33-4a35-8d96-33f81c07c8e0@molgen.mpg.de>
Date: Fri, 25 Jul 2025 14:15:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: athk10: Poll service ready completion by default to avoid warning
 `failed to receive service ready completion, polling..`?
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
 Jeff Johnson <jjohnson@kernel.org>, ath10k@lists.infradead.org,
 James Prestwood <prestwoj@gmail.com>
References: <97a15967-5518-4731-a8ff-d43ff7f437b0@molgen.mpg.de>
 <3cbe13e1-a820-4804-a28c-a57e2ee7a020@oss.qualcomm.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <3cbe13e1-a820-4804-a28c-a57e2ee7a020@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_051612_834863_8F3BED01 
X-CRM114-Status: GOOD (  27.12  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

This is a multi-part message in MIME format.
--------------IWKL2dzaL8eep60TKGXgoNZv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Baochen,


Thank you for your answer.


Am 22.07.25 um 11:38 schrieb Baochen Qiang:

> On 7/22/2025 4:37 PM, Paul Menzel wrote:

>> Today, on the Intel Kaby Lake laptop Dell XPS 13 9360 with
>>
>>      $ lspci -nn -s 3a:
>>      3a:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 802.11ac Wireless Network Adapter [168c:003e] (rev 32)
>>
>> resuming from ACPI S3 took longer, as it sometimes does, and looking into this, I see
>> `failed to receive service ready completion, polling..` after a delay of five seconds:
>>
>> ```
>> [    0.000000] Linux version 6.16.0-rc6-00253-g4871b7cb27f4 (build@bohemianrhapsody.molgen.mpg.de) (gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44) #90 SMP PREEMPT_DYNAMIC Sat Jul 19 08:53:39 CEST 2025
>> […]
>> [    8.588020] abreu kernel: ath10k_pci 0000:3a:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:1535
>> [    8.588372] abreu kernel: ath10k_pci 0000:3a:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
>> [    8.588603] abreu kernel: ath10k_pci 0000:3a:00.0: firmware ver WLAN.RM.4.4.1-00309-api 6 features wowlan,ignore-otp,mfp crc32 0793bcf2
>> […]
>> [    9.113550] Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, firmware rome 0x302 build 0x111
>> […]
>> [41804.953487] PM: suspend entry (deep)
>> [41804.988361] Filesystems sync: 0.034 seconds
>> [41805.007216] Freezing user space processes
>> [41805.009650] Freezing user space processes completed (elapsed 0.002 seconds)
>> [41805.009663] OOM killer disabled.
>> [41805.009666] Freezing remaining freezable tasks
>> [41805.011383] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
>> [41805.011502] printk: Suspending console(s) (use no_console_suspend to debug)
>> [41805.523883] ACPI: EC: interrupt blocked
>> [41805.545779] ACPI: PM: Preparing to enter system sleep state S3
>> [41805.556040] ACPI: EC: event blocked
>> [41805.556045] ACPI: EC: EC stopped
>> [41805.556046] ACPI: PM: Saving platform NVS memory
>> [41805.559408] Disabling non-boot CPUs ...
>> [41805.562480] smpboot: CPU 3 is now offline
>> [41805.567105] smpboot: CPU 2 is now offline
>> [41805.572122] smpboot: CPU 1 is now offline
>> [41805.582034] ACPI: PM: Low-level resume complete
>> [41805.582079] ACPI: EC: EC started
>> [41805.582080] ACPI: PM: Restoring platform NVS memory
>> [41805.583986] Enabling non-boot CPUs ...
>> [41805.584009] smpboot: Booting Node 0 Processor 1 APIC 0x2
>> [41805.584734] CPU1 is up
>> [41805.584749] smpboot: Booting Node 0 Processor 2 APIC 0x1
>> [41805.585514] CPU2 is up
>> [41805.585530] smpboot: Booting Node 0 Processor 3 APIC 0x3
>> [41805.586216] CPU3 is up
>> [41805.589070] ACPI: PM: Waking up from system sleep state S3
>> [41805.623652] ACPI: EC: interrupt unblocked
>> [41805.640074] ACPI: EC: event unblocked
>> [41805.651951] nvme nvme0: 4/0/0 default/read/poll queues
>> [41805.865391] atkbd serio0: Failed to deactivate keyboard on isa0060/serio0
>> [41810.933639] ath10k_pci 0000:3a:00.0: failed to receive service ready completion, polling..
>> [41810.933769] ath10k_pci 0000:3a:00.0: service ready completion received, continuing normally
>> [41810.986330] OOM killer enabled.
>> [41810.986332] Restarting tasks: Starting
>> […]
>> ```
>>
>> Commit e57b7d62a1b2 (wifi: ath10k: poll service ready message before failing) [1][2],
>> present since Linux v6.10-rc1, added this to avoid the hardware not being initialized:
>>
>>          time_left = wait_for_completion_timeout(&ar->wmi.service_ready,
>>                                                  WMI_SERVICE_READY_TIMEOUT_HZ);
>>          if (!time_left) {
>>                  /* Sometimes the PCI HIF doesn't receive interrupt
>>                   * for the service ready message even if the buffer
>>                   * was completed. PCIe sniffer shows that it's
>>                   * because the corresponding CE ring doesn't fires
>>                   * it. Workaround here by polling CE rings once.
>>                   */
>>                  ath10k_warn(ar, "failed to receive service ready completion, polling..\n");
>>
>>                  for (i = 0; i < CE_COUNT; i++)
>>                          ath10k_hif_send_complete_check(ar, i, 1);
>>
>>                  time_left = wait_for_completion_timeout(&ar->wmi.service_ready,
>>                                                          WMI_SERVICE_READY_TIMEOUT_HZ);
>>                  if (!time_left) {
>>                          ath10k_warn(ar, "polling timed out\n");
>>                          return -ETIMEDOUT;
>>                  }
>>
>>                  ath10k_warn(ar, "service ready completion received, continuing normally\n");
>>          }
>>
>> The comment says, it’s a hardware issue. I guess from the Qualcomm device and not the
>> board design, as it happens with several devices like James’?
>>
>> Anyway, should polling be used by default then to avoid the delay?
> 
> Adding additional polling before wait seems OK to me

With the attached diff, I didn’t notice any issue on the Dell XPS 13 
9360 with QCA6174.

Unrelated: The only thing I noticed is, that during boot (not resume) 
the function seems to be called twice. It looks like once for Wi-Fi and 
once for Bluetooth:

```
[   35.507604] ath10k_pci 0000:3a:00.0: board_file api 2 bmi_id N/A 
crc32 d2863f91
[   35.516010] usb 1-5: New USB device found, idVendor=0c45, 
idProduct=670c, bcdDevice=56.26
[   35.516022] usb 1-5: New USB device strings: Mfr=2, Product=1, 
SerialNumber=0
[   35.516026] usb 1-5: Product: Integrated_Webcam_HD
[   35.516029] usb 1-5: Manufacturer: CN09GTFMLOG008C8B7FWA01
[   35.587852] ath10k_pci 0000:3a:00.0: service ready completion 
received, continuing normally
[   35.606632] ath10k_pci 0000:3a:00.0: htt-ver 3.87 wmi-op 4 htt-op 3 
cal otp max-sta 32 raw 0 hwcrypto 1
[   35.628744] mc: Linux media interface: v0.10
[   35.651301] nvme nvme0: using unchecked data buffer
[   35.687466] Bluetooth: Core ver 2.22
[   35.687493] NET: Registered PF_BLUETOOTH protocol family
[   35.687495] Bluetooth: HCI device and connection manager initialized
[   35.687499] Bluetooth: HCI socket layer initialized
[   35.687501] Bluetooth: L2CAP socket layer initialized
[   35.687505] Bluetooth: SCO socket layer initialized
[   35.696050] ath: EEPROM regdomain: 0x6c
[   35.696055] ath: EEPROM indicates we should expect a direct regpair map
[   35.696057] ath: Country alpha2 being used: 00
[   35.696058] ath: Regpair used: 0x6c
[   35.712821] ath10k_pci 0000:3a:00.0 wlp58s0: renamed from wlan0
[   35.716790] input: ELAN Touchscreen as 
/devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.0/0003:04F3:2234.0002/input/input40
[   35.718912] videodev: Linux video capture interface: v2.00
[   35.719492] input: ELAN Touchscreen UNKNOWN as 
/devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.0/0003:04F3:2234.0002/input/input41
[   35.719595] input: ELAN Touchscreen UNKNOWN as 
/devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.0/0003:04F3:2234.0002/input/input42
[   35.720899] hid-multitouch 0003:04F3:2234.0002: 
input,hiddev0,hidraw1: USB HID v1.10 Device [ELAN Touchscreen] on 
usb-0000:00:14.0-4/input0
[   35.720947] usbcore: registered new interface driver usbhid
[   35.720949] usbhid: USB HID core driver
[   35.812081] usbcore: registered new interface driver btusb
[   35.815263] Bluetooth: hci0: using rampatch file: 
qca/rampatch_usb_00000302.bin
[   35.815270] Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, 
firmware rome 0x302 build 0x111
[   36.174345] Bluetooth: hci0: using NVM file: qca/nvm_usb_00000302.bin
[   36.199643] Bluetooth: hci0: HCI Enhanced Setup Synchronous 
Connection command is advertised, but not supported.
[   36.398657] ath10k_pci 0000:3a:00.0: service ready completion 
received, continuing normally
```

>> Additionally I have two questions regarding the code:
>>
>> 1.  Is `WMI_SERVICE_READY_TIMEOUT_HZ` the right value to pass to
>> `wait_for_completion_timeout(struct completion *done, unsigned long timeout)`?
>>
>> The macro is defined as:
>>
>>      drivers/net/wireless/ath/ath10k/wmi.h:#define WMI_SERVICE_READY_TIMEOUT_HZ (5 * HZ)
>>
>> `timeout` is supposed to be in jiffies, and `CONFIG_HZ_250=y` on my system. I wonder how
>> that amounts to five seconds on my system.
> 
> HZ is defined as jiffies per second, so 5 * HZ equals 5 seconds.
> 
>>
>> The timeout should probably be defined in seconds? Does the WMI specification say
>> something about this?
>>
>> 2.  Is the task interruptable and should `wait_for_completion_interruptible_timeout(struct
>> completion *done, unsigned long timeout)` be used?
> 
> While I am not sure for now, may I ask why the question?

I was just reading up on `wait_for_completion_*()`, and so the different 
variants.


Kind regards,

Paul


>> [1]: https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e57b7d62a1b2f496caf0beba81cec3c90fad80d5
>> [2]: https://lore.kernel.org/all/20240227030409.89702-1-quic_bqiang@quicinc.com/
--------------IWKL2dzaL8eep60TKGXgoNZv
Content-Type: text/x-patch; charset=UTF-8;
 name="ath10k-poll-uninterruptible.diff"
Content-Disposition: attachment; filename="ath10k-poll-uninterruptible.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvd21pLmMgYi9k
cml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3dtaS5jCmluZGV4IGRmNmEyNGY4Zjhk
NS4uZWNmNjUwYjUyZGQyIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgv
YXRoMTBrL3dtaS5jCisrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvd21p
LmMKQEAgLTE3NjUsMzAgKzE3NjUsMjQgQEAgaW50IGF0aDEwa193bWlfd2FpdF9mb3Jfc2Vy
dmljZV9yZWFkeShzdHJ1Y3QgYXRoMTBrICphcikKIHsKIAl1bnNpZ25lZCBsb25nIHRpbWVf
bGVmdCwgaTsKIAotCXRpbWVfbGVmdCA9IHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgm
YXItPndtaS5zZXJ2aWNlX3JlYWR5LAorCS8qIFNvbWV0aW1lcyB0aGUgUENJIEhJRiBkb2Vz
bid0IHJlY2VpdmUgaW50ZXJydXB0CisJICogZm9yIHRoZSBzZXJ2aWNlIHJlYWR5IG1lc3Nh
Z2UgZXZlbiBpZiB0aGUgYnVmZmVyCisJICogd2FzIGNvbXBsZXRlZC4gUENJZSBzbmlmZmVy
IHNob3dzIHRoYXQgaXQncworCSAqIGJlY2F1c2UgdGhlIGNvcnJlc3BvbmRpbmcgQ0Ugcmlu
ZyBkb2Vzbid0IGZpcmVzCisJICogaXQuIFdvcmthcm91bmQgaGVyZSBieSBwb2xsaW5nIENF
IHJpbmdzIG9uY2UuCisJICovCisJZm9yIChpID0gMDsgaSA8IENFX0NPVU5UOyBpKyspCisJ
CWF0aDEwa19oaWZfc2VuZF9jb21wbGV0ZV9jaGVjayhhciwgaSwgMSk7CisKKwl0aW1lX2xl
ZnQgPSB3YWl0X2Zvcl9jb21wbGV0aW9uX2ludGVycnVwdGlibGVfdGltZW91dCgmYXItPndt
aS5zZXJ2aWNlX3JlYWR5LAogCQkJCQkJV01JX1NFUlZJQ0VfUkVBRFlfVElNRU9VVF9IWik7
CiAJaWYgKCF0aW1lX2xlZnQpIHsKLQkJLyogU29tZXRpbWVzIHRoZSBQQ0kgSElGIGRvZXNu
J3QgcmVjZWl2ZSBpbnRlcnJ1cHQKLQkJICogZm9yIHRoZSBzZXJ2aWNlIHJlYWR5IG1lc3Nh
Z2UgZXZlbiBpZiB0aGUgYnVmZmVyCi0JCSAqIHdhcyBjb21wbGV0ZWQuIFBDSWUgc25pZmZl
ciBzaG93cyB0aGF0IGl0J3MKLQkJICogYmVjYXVzZSB0aGUgY29ycmVzcG9uZGluZyBDRSBy
aW5nIGRvZXNuJ3QgZmlyZXMKLQkJICogaXQuIFdvcmthcm91bmQgaGVyZSBieSBwb2xsaW5n
IENFIHJpbmdzIG9uY2UuCi0JCSAqLwotCQlhdGgxMGtfd2FybihhciwgImZhaWxlZCB0byBy
ZWNlaXZlIHNlcnZpY2UgcmVhZHkgY29tcGxldGlvbiwgcG9sbGluZy4uXG4iKTsKLQotCQlm
b3IgKGkgPSAwOyBpIDwgQ0VfQ09VTlQ7IGkrKykKLQkJCWF0aDEwa19oaWZfc2VuZF9jb21w
bGV0ZV9jaGVjayhhciwgaSwgMSk7Ci0KLQkJdGltZV9sZWZ0ID0gd2FpdF9mb3JfY29tcGxl
dGlvbl90aW1lb3V0KCZhci0+d21pLnNlcnZpY2VfcmVhZHksCi0JCQkJCQkJV01JX1NFUlZJ
Q0VfUkVBRFlfVElNRU9VVF9IWik7Ci0JCWlmICghdGltZV9sZWZ0KSB7Ci0JCQlhdGgxMGtf
d2FybihhciwgInBvbGxpbmcgdGltZWQgb3V0XG4iKTsKLQkJCXJldHVybiAtRVRJTUVET1VU
OwotCQl9Ci0KLQkJYXRoMTBrX3dhcm4oYXIsICJzZXJ2aWNlIHJlYWR5IGNvbXBsZXRpb24g
cmVjZWl2ZWQsIGNvbnRpbnVpbmcgbm9ybWFsbHlcbiIpOworCQlhdGgxMGtfd2Fybihhciwg
InBvbGxpbmcgdGltZWQgb3V0XG4iKTsKKwkJcmV0dXJuIC1FVElNRURPVVQ7CiAJfQogCisJ
YXRoMTBrX3dhcm4oYXIsICJzZXJ2aWNlIHJlYWR5IGNvbXBsZXRpb24gcmVjZWl2ZWQsIGNv
bnRpbnVpbmcgbm9ybWFsbHlcbiIpOworCiAJcmV0dXJuIDA7CiB9CiAK

--------------IWKL2dzaL8eep60TKGXgoNZv--

