Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from icp-osb-irony-out9.external.iinet.net.au ([203.59.1.226])
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1i4gIc-0001h1-4D
 for ath10k@lists.infradead.org; Mon, 02 Sep 2019 06:58:52 +0000
Subject: Re: problems with a 9377 based SDIO module
References: <176a3a2d-ff81-3b72-86af-73c70df729f4@kernel.org>
 <a97cd0d2-e53e-ef3c-63e3-0d4d352c7994@kernel.org>
 <8748427f-c4cd-a223-d635-2b628ee2cfb3@gmail.com>
From: Greg Ungerer <gerg@kernel.org>
Message-ID: <bafbc391-201a-7c60-e331-1f1cdeb0a1d7@kernel.org>
Date: Mon, 2 Sep 2019 16:58:39 +1000
MIME-Version: 1.0
In-Reply-To: <8748427f-c4cd-a223-d635-2b628ee2cfb3@gmail.com>
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: ath10k@lists.infradead.org

Hi Erik,

Thanks for the response.

On 1/9/19 12:49 am, Erik Stromdahl wrote:
> On 8/30/19 4:52 PM, Greg Ungerer wrote:
>> On 29/8/19 4:33 pm, Greg Ungerer wrote:
>>> I have a Compex WSD377 WiFi module with SDIO interface on a new
>>> iMX6 based platform. I am trying to get the module going but am
>>> having problems with it at probe/init time.
>>>
>>> Ultimately what I see at ath10k_sdio module load time is:
>>>
>>> <4>ath10k_sdio mmc0:0001:1: WARNING: ath10k SDIO support is incomplete, don't expect anything to work!
>>> <6>ath10k_sdio mmc0:0001:1: qca9377 hw1.1 sdio target 0x05020001 chip_id 0x00000000 sub 0000:0000
>>> <6>ath10k_sdio mmc0:0001:1: kconfig debug 1 debugfs 0 tracing 0 dfs 0 testmode 0
>>> <6>ath10k_sdio mmc0:0001:1: firmware ver WLAN.TF.1.1.1-00061-QCATFSWPZ-1 api 5 features ignore-otp crc32 7746e551
>>> <3>ath10k_sdio mmc0:0001:1: failed to fetch board data for bus=sdio,vendor=0271,device=0701,subsystem-vendor=0000,subsystem-device=0000 from ath10k/QCA9377/hw1.0/board-2.bin
>>> <6>ath10k_sdio mmc0:0001:1: board_file api 1 bmi_id N/A crc32 78c48ff6
>>> <4>ath10k_sdio mmc0:0001:1: failed to write to address 0x828: -84
>>> <4>ath10k_sdio mmc0:0001:1: unable to disable sdio interrupts: -84
>>> <3>ath10k_sdio mmc0:0001:1: could not start HIF: -84
>>> <3>ath10k_sdio mmc0:0001:1: could not init core (-84)
>>> <4>mmc0: queuing unknown CIS tuple 0x01 (3 bytes)
>>> <4>mmc0: queuing unknown CIS tuple 0x1a (5 bytes)
>>> <4>mmc0: queuing unknown CIS tuple 0x1b (8 bytes)
>>> <4>mmc0: queuing unknown CIS tuple 0x14 (0 bytes)
>>> <3>ath10k_sdio mmc0:0001:1: could not probe fw (-84)
>>>
>>> Tracing I can see that a fair bit of IO has gone on when it finally
>>> gets to the "failed to write to address 0x828: -84". I assume the
>>> bulk writes up to that point are the firmware download.
>>>
>>> I am using a linux-5.2 kernel with your patches at
>>> https://github.com/erstrom/linux-ath.git, v5.2-ath10k-sdio branch.
>>
>> Problem mostly solved by also patching with the changes at
>> https://kernel.googlesource.com/pub/scm/linux/kernel/git/kvalo/ath.
>> Applying the v5.2-ath10k-sdio changes on top of them.
>>
>> Now it successfully probes the device. But after configuring wlan0
>> and sending/receiving a few packets I started to see:
>>
>> ath10k_sdio mmc0:0001:1: msdu_id allocation failed -28^M
>> ath10k_sdio mmc0:0001:1: failed to transmit packet, dropping: -28^M
>> ath10k_sdio mmc0:0001:1: failed to submit frame: -28^M
>> ath10k_sdio mmc0:0001:1: failed to push frame: -28^M
>>
> I was actually trying my v5.2 branch with my QCA9377 SDIO device today,
> and everything was running without any problems.

So do you mean you can use your v5.2 branch with no other kernel
changes and get a QCA9377 module to work?

I could not do that (as per my original mail that started this thread).
I took just your changes and applied to my v5.2 tree, they all applied
cleanly and compile cleanly. But do not work.

I had to apply a lot of patches from the kvalo/ath tree first. And that
was a real can of worms - I mostly applied patches that appeared to be
part of changes submitted for v5.3.

Regards
Greg



> I don't recognize your errors.
> The error message you get is because the driver is not able to allocate an
> MSDU ID for the TX MSDU.
> 
> It looks as if your hardware does not notify the driver that it has consumed
> the MSDUs (with a TX_COMPL_IND). Then the MSDU ID never gets freed and the
> driver will run out of IDs.
> 
>>
>>
>>> My primary concern is if I am using the write firmware.
>>>
>>> I have a firmware-sdio-5.bin which is the QCA9377/hw1.0/untested/firmware-sdio-5.bin_WLAN.TF.1.1.1-00061-QCATFSWPZ-1
>>> file from the ath10k-firmware tree at https://github.com/kvalo/ath10k-firmware.git.
>>> And the board-sdio.bin which is the bdwlan30.bin from https://github.com/boundarydevices/qca-firmware.git.
> This firmware should work. I am using it as well.
> 
>>>
>>> I ended up with those from comments made in
>>> https://ath10k.infradead.narkive.com/lgpFutCZ/patch-00-11-sdio-support-for-ath10k
>>> But maybe I am off-track here?
>>>
>>> Does the kernel trace give any clues as what the problem may be?
>>> Any other ideas?
> The only thing I can think of is that something is wrong with your SDIO/MMC setup
> (device tree?) or your actual hardware.
> 
> -- 
> Erik
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
