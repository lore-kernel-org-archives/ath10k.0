Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf0-x232.google.com ([2607:f8b0:400e:c00::232])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bQVyx-0000so-KP
 for ath10k@lists.infradead.org; Fri, 22 Jul 2016 08:38:58 +0000
Received: by mail-pf0-x232.google.com with SMTP id y134so39473511pfg.0
 for <ath10k@lists.infradead.org>; Fri, 22 Jul 2016 01:38:34 -0700 (PDT)
Subject: Re: [RFC] ath10k: silence firmware file probing warnings
References: <1468933237-5226-1-git-send-email-michal.kazior@tieto.com>
 <20160721070938.GA2658@redhat.com>
 <CANUX_P3ADxi+RHkH=d8Ypcqy9WVKSu4JYH7K3HtTNCuWg3wCeQ@mail.gmail.com>
 <20160721080541.GB2658@redhat.com> <5790A28F.8030102@redhat.com>
 <20160721115122.GA31869@redhat.com>
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
Message-ID: <a264e995-fc46-7fcd-69f9-80992385b6b1@broadcom.com>
Date: Fri, 22 Jul 2016 10:38:24 +0200
MIME-Version: 1.0
In-Reply-To: <20160721115122.GA31869@redhat.com>
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
To: Stanislaw Gruszka <sgruszka@redhat.com>, Prarit Bhargava <prarit@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ming Lei <ming.lei@canonical.com>, linux-wireless <linux-wireless@vger.kernel.org>, "Luis R. Rodriguez" <mcgrof@kernel.org>, ath10k <ath10k@lists.infradead.org>, Kalle Valo <kvalo@qca.qualcomm.com>, Michal Kazior <michal.kazior@tieto.com>, Arend van Spriel <arend@broadcom.com>, Emmanuel Grumbach <egrumbach@gmail.com>

+ Luis

On 21-7-2016 13:51, Stanislaw Gruszka wrote:
> (cc: firmware and brcmfmac maintainers)
> 
> On Thu, Jul 21, 2016 at 06:23:11AM -0400, Prarit Bhargava wrote:
>>
>>
>> On 07/21/2016 04:05 AM, Stanislaw Gruszka wrote:
>>> On Thu, Jul 21, 2016 at 10:36:42AM +0300, Emmanuel Grumbach wrote:
>>>> On Thu, Jul 21, 2016 at 10:09 AM, Stanislaw Gruszka <sgruszka@redhat.com> wrote:
>>>>> On Tue, Jul 19, 2016 at 03:00:37PM +0200, Michal Kazior wrote:
>>>>>> Firmware files are versioned to prevent older
>>>>>> driver instances to load unsupported firmware
>>>>>> blobs. This is reflected with a fallback logic
>>>>>> which attempts to load several firmware files.
>>>>>>
>>>>>> This however produced a lot of unnecessary
>>>>>> warnings sometimes confusing users and leading
>>>>>> them to rename firmware files making things even
>>>>>> more confusing.
>>>>>
>>>>> This happens on kernels configured with
>>>>> CONFIG_FW_LOADER_USER_HELPER_FALLBACK and cause not only ugly warnings,
>>>>> but also 60 seconds delay before loading next firmware version.
>>>>> For some reason RHEL kernel needs above config option, so this
>>>>> patch is very welcome from my perspective.
>>>>>
>>>>
>>>> Sorry for my ignorance but how does the firmware loading work if not
>>>> with udev's help?
>>>
>>> I'm not sure exactly, but I think kernel VFS layer is capable to copy
>>> file data directly from mounted filesystem without user space helper.
>>
>> Here's the situation: request_firmware() waits 60 seconds for udev to do its
>> loading magic via a "usermode helper".  This delay is there to allow, for
>> example, userspace to unpack or download a new firmware image or verify the
>> firmware image *in userspace* before providing it to the driver to apply to the HW.
>>
>> Why 60 seconds?  It is arbitrary and there is no way for udev & the kernel to
>> handshake on completion.
>>
>>>
>>>> As you can imagine, iwlwifi is suffering from the
>>>> same problem and I would be interested in applying the same change,
>>>> but I'd love to understand a bit more :)
>>>
>>> Yes, iwlwifi (and some other drivers) suffer from this. However this
>>> happen when the newest firmware version is not installed on the system
>>> and CONFIG_FW_LOADER_USER_HELPER_FALLBACK is enabled. What I suppose
>>> it's not common.
>>
>> request_firmware_direct() was introduced at my request because (as you've
>> noticed) when CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y drivers may stall for long
>> periods of time when starting.  The bug that this introduced was a 60 second
>> delay per logical cpu when starting a system.  On a 64 cpu system that meant the
>> boot would complete in a little over one hour.
>>
>>>
>>> I started to see this currently, because that option was enabled on 
>>> RHEL kernel. BTW: I think Prarit iwlwifi thermal_zone problem was
>>> happened because of that, i.e. thermal device was not functional
>>> because f/w wasn't loaded due to big delay.
>>>
>>> I'm not sure if replacing to request_firmware_direct() is a good
>>> fix though. For example I can see this problem also on brcmfmac, which
>>> use request_firmware_nowait(). I think I would rather prefer special
>>> helper for firmware drivers that needs user helper and have
>>> request_firmware() be direct as default.
>>>
>>
>> The difference between request_firmware_direct() and request_firmware() is that
>> the _direct() version does not wait the 60 seconds for udev interaction.  The
>> only userspace check performed is to see if the file is there, and if the file
>> does exist it is provided to the driver to be applied to the hardware.
>>
>> So the real question to ask here is whether or not the ath10k, brcmfmac, and
>> iwlwifi require udev to do anything beyond checking for the existence and
>> loading the firmware image.  If they don't, then it is better to use
>> request_firmware_direct().
> 
> They don't need that, like 99% of the drivers I think, hence changing the
> default seems to be more reasonable. However changing 3 drivers would work
> for me as well, and that change do not introduce risk of broking drivers
> that require udev fw download.
> 
> iwlwifi and ath10k are trivial, bcrmfmac is a bit more complex as it
> use request_firmware_nowait(), so it first need to be converted to
> ordinary request_firmware(), but this should be doable and I can do
> that.

I am going bonkers here. This is the Nth time a discussion pops up on
firmware API usage. I stopped counting N :-( So the first issue was that
the INIT was taking to long as we were requesting firmware during probe
which was executed in the INIT context. So we added a worker and
register the driver from there. There was probably a reason for
switching to _no_wait() as well, but I do not recall the details. The
things is I don't know if I need user-space or not. I just need firmware
to get the device up and running. We have changed our driver a couple of
times now to accommodate something that in my opinion should have been
abstracted behind the firmware API in the first place and now here is
another proposal to change the drivers. Come on!

> However I wonder if changing that will not broke the case when
> driver is build-in in the kernel and f/w is not yet available when
> driver start to initialize. Or maybe nowadays this is not the case
> any longer, i.e. the MODULE_FIRMWARE macros assure proper f/w 
> images are build-in in the kernel or copied to initramfs?

That is a nice idea, but I have not seen any change in that area. Could
have missed it.

Regards,
Arend

> Thanks
> Stanislaw
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
