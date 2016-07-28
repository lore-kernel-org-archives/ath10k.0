Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bSquV-0007VD-QX
 for ath10k@lists.infradead.org; Thu, 28 Jul 2016 19:24:02 +0000
Received: by mail-wm0-x231.google.com with SMTP id f65so264168476wmi.0
 for <ath10k@lists.infradead.org>; Thu, 28 Jul 2016 12:23:38 -0700 (PDT)
Subject: Re: [RFC] ath10k: silence firmware file probing warnings
References: <1468933237-5226-1-git-send-email-michal.kazior@tieto.com>
 <20160721070938.GA2658@redhat.com>
 <CANUX_P3ADxi+RHkH=d8Ypcqy9WVKSu4JYH7K3HtTNCuWg3wCeQ@mail.gmail.com>
 <20160721080541.GB2658@redhat.com> <5790A28F.8030102@redhat.com>
 <20160721115122.GA31869@redhat.com>
 <a264e995-fc46-7fcd-69f9-80992385b6b1@broadcom.com>
 <20160722220526.GL5537@wotan.suse.de>
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Message-ID: <c3bbb2f3-f551-41bf-ba29-c75f78b5b9ed@broadcom.com>
Date: Thu, 28 Jul 2016 21:23:35 +0200
MIME-Version: 1.0
In-Reply-To: <20160722220526.GL5537@wotan.suse.de>
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
To: "Luis R. Rodriguez" <mcgrof@kernel.org>
Cc: Prarit Bhargava <prarit@redhat.com>, Stanislaw Gruszka <sgruszka@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ming Lei <ming.lei@canonical.com>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Kalle Valo <kvalo@qca.qualcomm.com>, mmarek@suse.com, Michal Kazior <michal.kazior@tieto.com>, Arend van Spriel <arend@broadcom.com>, Emmanuel Grumbach <egrumbach@gmail.com>



On 23-07-16 00:05, Luis R. Rodriguez wrote:
> On Fri, Jul 22, 2016 at 10:38:24AM +0200, Arend Van Spriel wrote:
>> + Luis
>>
>> On 21-7-2016 13:51, Stanislaw Gruszka wrote:
>>> (cc: firmware and brcmfmac maintainers)
>>>
>>> On Thu, Jul 21, 2016 at 06:23:11AM -0400, Prarit Bhargava wrote:
>>>>
>>>>
>>>> On 07/21/2016 04:05 AM, Stanislaw Gruszka wrote:
>>>>> On Thu, Jul 21, 2016 at 10:36:42AM +0300, Emmanuel Grumbach wrote:
>>>>>> On Thu, Jul 21, 2016 at 10:09 AM, Stanislaw Gruszka <sgruszka@redhat.com> wrote:
>>>>>>> On Tue, Jul 19, 2016 at 03:00:37PM +0200, Michal Kazior wrote:
>>>>>>>> Firmware files are versioned to prevent older
>>>>>>>> driver instances to load unsupported firmware
>>>>>>>> blobs. This is reflected with a fallback logic
>>>>>>>> which attempts to load several firmware files.
>>>>>>>>
>>>>>>>> This however produced a lot of unnecessary
>>>>>>>> warnings sometimes confusing users and leading
>>>>>>>> them to rename firmware files making things even
>>>>>>>> more confusing.
>>>>>>>
>>>>>>> This happens on kernels configured with
>>>>>>> CONFIG_FW_LOADER_USER_HELPER_FALLBACK and cause not only ugly warnings,
>>>>>>> but also 60 seconds delay before loading next firmware version.
>>>>>>> For some reason RHEL kernel needs above config option, so this
>>>>>>> patch is very welcome from my perspective.
>>>>>>>
>>>>>>
>>>>>> Sorry for my ignorance but how does the firmware loading work if not
>>>>>> with udev's help?
>>>>>
>>>>> I'm not sure exactly, but I think kernel VFS layer is capable to copy
>>>>> file data directly from mounted filesystem without user space helper.
>>>>
>>>> Here's the situation: request_firmware() waits 60 seconds for udev to do its
>>>> loading magic via a "usermode helper".  This delay is there to allow, for
>>>> example, userspace to unpack or download a new firmware image or verify the
>>>> firmware image *in userspace* before providing it to the driver to apply to the HW.
>>>>
>>>> Why 60 seconds?  It is arbitrary and there is no way for udev & the kernel to
>>>> handshake on completion.
>>>>
>>>>>
>>>>>> As you can imagine, iwlwifi is suffering from the
>>>>>> same problem and I would be interested in applying the same change,
>>>>>> but I'd love to understand a bit more :)
>>>>>
>>>>> Yes, iwlwifi (and some other drivers) suffer from this. However this
>>>>> happen when the newest firmware version is not installed on the system
>>>>> and CONFIG_FW_LOADER_USER_HELPER_FALLBACK is enabled. What I suppose
>>>>> it's not common.
>>>>
>>>> request_firmware_direct() was introduced at my request because (as you've
>>>> noticed) when CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y drivers may stall for long
>>>> periods of time when starting.  The bug that this introduced was a 60 second
>>>> delay per logical cpu when starting a system.  On a 64 cpu system that meant the
>>>> boot would complete in a little over one hour.
>>>>
>>>>>
>>>>> I started to see this currently, because that option was enabled on 
>>>>> RHEL kernel. BTW: I think Prarit iwlwifi thermal_zone problem was
>>>>> happened because of that, i.e. thermal device was not functional
>>>>> because f/w wasn't loaded due to big delay.
>>>>>
>>>>> I'm not sure if replacing to request_firmware_direct() is a good
>>>>> fix though. For example I can see this problem also on brcmfmac, which
>>>>> use request_firmware_nowait(). I think I would rather prefer special
>>>>> helper for firmware drivers that needs user helper and have
>>>>> request_firmware() be direct as default.
>>>>>
>>>>
>>>> The difference between request_firmware_direct() and request_firmware() is that
>>>> the _direct() version does not wait the 60 seconds for udev interaction.  The
>>>> only userspace check performed is to see if the file is there, and if the file
>>>> does exist it is provided to the driver to be applied to the hardware.
>>>>
>>>> So the real question to ask here is whether or not the ath10k, brcmfmac, and
>>>> iwlwifi require udev to do anything beyond checking for the existence and
>>>> loading the firmware image.  If they don't, then it is better to use
>>>> request_firmware_direct().
>>>
>>> They don't need that, like 99% of the drivers I think, hence changing the
>>> default seems to be more reasonable. However changing 3 drivers would work
>>> for me as well, and that change do not introduce risk of broking drivers
>>> that require udev fw download.
>>>
>>> iwlwifi and ath10k are trivial, bcrmfmac is a bit more complex as it
>>> use request_firmware_nowait(), so it first need to be converted to
>>> ordinary request_firmware(), but this should be doable and I can do
>>> that.
>>
>> I am going bonkers here. This is the Nth time a discussion pops up on
>> firmware API usage. I stopped counting N :-( So the first issue was that
>> the INIT was taking to long as we were requesting firmware during probe
>> which was executed in the INIT context. So we added a worker and
>> register the driver from there. There was probably a reason for
>> switching to _no_wait() as well, but I do not recall the details. The
>> things is I don't know if I need user-space or not. I just need firmware
>> to get the device up and running. We have changed our driver a couple of
>> times now to accommodate something that in my opinion should have been
>> abstracted behind the firmware API in the first place and now here is
>> another proposal to change the drivers. Come on!
> 
> Its a big mess, but a lot of it has to do with the fact that none of the
> issues have been well documented. Its also not clear what distros, driver
> developers or users should do. I've tried helping with by providing such
> documentation and also providing grammar rules to avoid further issues [0],
> hopefully this series will be merged soon.
> 
> [0] https://marc.info/?l=linux-kernel&m=146611775314567
> 
> Using grammar rules the hunt with coccinelle as of today's linux-next
> reveals there are only 2 explicit users of the usermode helper, and
> I've vetted for these as well in the above patch series.
> 
> Now, other than this users will experience the usermode helper if the
> distribution messed up and build their kernel with the fallback
> usermode helper. If this was done on some old kernel the only way
> to fix that is to fix that kernel build or change drivers to avoid
> the usermode helper explicitly, unfortunately some API calls cannot
> avoid it .... I've documented all this in the above series.
> 
>>> However I wonder if changing that will not broke the case when
>>> driver is build-in in the kernel and f/w is not yet available when
>>> driver start to initialize.
> 
> Indeed, tons of races are in theory possible here ;) technically since we use a
> common API to read files directly now, a race might also be possible for other
> users of the API on init as well. I have some grammar rules to test for this in
> development, that is to vet that not only the firmware API is checked and we
> avoid on init but also other callers that use the same read API.
> 
>>> Or maybe nowadays this is not the case
>>> any longer, i.e. the MODULE_FIRMWARE macros assure proper f/w 
>>> images are build-in in the kernel or copied to initramfs?
> 
> The firmware API is a mess and I've been trying to correct that
> with a more flexible API.
> 
>> That is a nice idea, but I have not seen any change in that area. Could
>> have missed it.
> 
> Extensions to the fw API are IMHO best done through a newer flexible
> API, feel free to refer to this development tree if you'd like to
> contribute:
> 
> https://git.kernel.org/cgit/linux/kernel/git/mcgrof/linux-next.git/log/?h=20160616-sysdata-v2

So I had a look and noticed commit c8df68e83392 ("firmware: annotate
thou shalt not request fw on init or probe"). Now this conflicts with
our wireless driver. The original suggestion a long, long time ago was
to use IFF_UP as trigger to go and request firmware. However, for that
we would need to register a netdevice during probe, and consequently we
should also have a wiphy instance registered. However, that has all kind
of feature flags for which we need firmware running on the device to
query what is supported and what not. I can make a fair bet that
brcmfmac is not the only driver with such a requirement. So how can we
crack that nut.

Regards,
Arend

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
