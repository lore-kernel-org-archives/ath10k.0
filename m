Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5Eyv-0004xq-3u
 for ath10k@lists.infradead.org; Tue, 03 Sep 2019 20:00:50 +0000
Received: by mail-lj1-x243.google.com with SMTP id j16so11148279ljg.6
 for <ath10k@lists.infradead.org>; Tue, 03 Sep 2019 13:00:48 -0700 (PDT)
Subject: Re: problems with a 9377 based SDIO module
References: <176a3a2d-ff81-3b72-86af-73c70df729f4@kernel.org>
 <a97cd0d2-e53e-ef3c-63e3-0d4d352c7994@kernel.org>
 <8748427f-c4cd-a223-d635-2b628ee2cfb3@gmail.com>
 <bafbc391-201a-7c60-e331-1f1cdeb0a1d7@kernel.org>
 <44b22101-734d-182f-2ed1-d2b270d71726@kernel.org>
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Message-ID: <303d73aa-01b4-63f8-7685-ea1e5cc07096@gmail.com>
Date: Tue, 3 Sep 2019 22:00:44 +0200
MIME-Version: 1.0
In-Reply-To: <44b22101-734d-182f-2ed1-d2b270d71726@kernel.org>
Content-Language: en-US
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
Cc: ath10k@lists.infradead.org

Hi Greg,

On 9/3/19 1:37 PM, Greg Ungerer wrote:
> Hi Erik,
> 
> On 2/9/19 4:58 pm, Greg Ungerer wrote:
>> On 1/9/19 12:49 am, Erik Stromdahl wrote:
>>> On 8/30/19 4:52 PM, Greg Ungerer wrote:
>>>> On 29/8/19 4:33 pm, Greg Ungerer wrote:
>>>>> I have a Compex WSD377 WiFi module with SDIO interface on a new
>>>>> iMX6 based platform. I am trying to get the module going but am
>>>>> having problems with it at probe/init time.
>>>>>
>>>>> Ultimately what I see at ath10k_sdio module load time is:
>>>>>
>>>>> <4>ath10k_sdio mmc0:0001:1: WARNING: ath10k SDIO support is incomplete, don't expect anything to work!
>>>>> <6>ath10k_sdio mmc0:0001:1: qca9377 hw1.1 sdio target 0x05020001 chip_id 0x00000000 sub 0000:0000
>>>>> <6>ath10k_sdio mmc0:0001:1: kconfig debug 1 debugfs 0 tracing 0 dfs 0 testmode 0
>>>>> <6>ath10k_sdio mmc0:0001:1: firmware ver WLAN.TF.1.1.1-00061-QCATFSWPZ-1 api 5 features ignore-otp crc32 7746e551
>>>>> <3>ath10k_sdio mmc0:0001:1: failed to fetch board data for bus=sdio,vendor=0271,device=0701,subsystem-vendor=0000,subsystem-device=0000 from ath10k/QCA9377/hw1.0/board-2.bin
>>>>> <6>ath10k_sdio mmc0:0001:1: board_file api 1 bmi_id N/A crc32 78c48ff6
>>>>> <4>ath10k_sdio mmc0:0001:1: failed to write to address 0x828: -84
>>>>> <4>ath10k_sdio mmc0:0001:1: unable to disable sdio interrupts: -84
>>>>> <3>ath10k_sdio mmc0:0001:1: could not start HIF: -84
>>>>> <3>ath10k_sdio mmc0:0001:1: could not init core (-84)
>>>>> <4>mmc0: queuing unknown CIS tuple 0x01 (3 bytes)
>>>>> <4>mmc0: queuing unknown CIS tuple 0x1a (5 bytes)
>>>>> <4>mmc0: queuing unknown CIS tuple 0x1b (8 bytes)
>>>>> <4>mmc0: queuing unknown CIS tuple 0x14 (0 bytes)
>>>>> <3>ath10k_sdio mmc0:0001:1: could not probe fw (-84)
>>>>>
>>>>> Tracing I can see that a fair bit of IO has gone on when it finally
>>>>> gets to the "failed to write to address 0x828: -84". I assume the
>>>>> bulk writes up to that point are the firmware download.
>>>>>
>>>>> I am using a linux-5.2 kernel with your patches at
>>>>> https://github.com/erstrom/linux-ath.git, v5.2-ath10k-sdio branch.
>>>>
>>>> Problem mostly solved by also patching with the changes at
>>>> https://kernel.googlesource.com/pub/scm/linux/kernel/git/kvalo/ath.
>>>> Applying the v5.2-ath10k-sdio changes on top of them.
>>>>
>>>> Now it successfully probes the device. But after configuring wlan0
>>>> and sending/receiving a few packets I started to see:
>>>>
>>>> ath10k_sdio mmc0:0001:1: msdu_id allocation failed -28^M
>>>> ath10k_sdio mmc0:0001:1: failed to transmit packet, dropping: -28^M
>>>> ath10k_sdio mmc0:0001:1: failed to submit frame: -28^M
>>>> ath10k_sdio mmc0:0001:1: failed to push frame: -28^M
>>>>
>>> I was actually trying my v5.2 branch with my QCA9377 SDIO device today,
>>> and everything was running without any problems.
>>
>> So do you mean you can use your v5.2 branch with no other kernel
>> changes and get a QCA9377 module to work?
>>
Yes, this is what I have been running
>> I could not do that (as per my original mail that started this thread).
>> I took just your changes and applied to my v5.2 tree, they all applied
>> cleanly and compile cleanly. But do not work.
>>
>> I had to apply a lot of patches from the kvalo/ath tree first. And that
>> was a real can of worms - I mostly applied patches that appeared to be
>> part of changes submitted for v5.3.
> 
> I tried a lightly different approach and had more success.
> 
> I started with my linux-5.2 kernel. Copied the entire ath10k driver
> sources from linux-5.3-rc7 (drivers/net/wireless/ath/ath10k/*)
> and then applied the patches from your master branch at
> https://github.com/erstrom/linux-ath.git.
> 
> That produced a working client wlan interface.
> 
Good that you got it working, but it is really odd that it didn't work
with my 5.2 branch (as I said, I have been running that branch as-is without
any other patches and it has been working fine).

--
Erik

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
