Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YpVbN-0001Is-Fg
 for ath10k@lists.infradead.org; Tue, 05 May 2015 05:41:06 +0000
Received: by wizk4 with SMTP id k4so145726053wiz.1
 for <ath10k@lists.infradead.org>; Mon, 04 May 2015 22:40:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAEFj9871+uootjCDVNBEKSYiDJzdRcMLkWe=bKdmxKDKBCBbKA@mail.gmail.com>
References: <CAEFj9871+uootjCDVNBEKSYiDJzdRcMLkWe=bKdmxKDKBCBbKA@mail.gmail.com>
Date: Tue, 5 May 2015 13:40:41 +0800
Message-ID: <CAEFj986ReYLUyqabqm8wosr_NGsofzGU8OWQvke23BCiqX_b_g@mail.gmail.com>
Subject: Re: Compex WLE900N5-23
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi, Michal

Any idea on this issue?

----
Chun-Yeow

On Thu, Apr 30, 2015 at 7:29 PM, Yeoh Chun-Yeow <yeohchunyeow@gmail.com> wrote:
>
> On Apr 30, 2015 18:50, "Michal Kazior" <michal.kazior@tieto.com> wrote:
>>
>> On 30 April 2015 at 12:31, Yeoh Chun-Yeow <yeohchunyeow@gmail.com> wrote:
>> > Hi, Michal
>> >
>> >> I assume you need to reboot the machine before it starts to work
>> >> again, no? Or does driver reload alone help?
>> >
>> > The system looks very sluggish once the firmware start to crash. But
>> > not required reboot.
>>
>> I assume it's due to crash-restart going over and over which involves
>> taking RTNL - this could reduce system responsiveness.
>>
>>
>> >> Did you try to `echo 1 >
>> >> /sys/bus/pci/devices/xxxx:xx:xx.x/remove` and `echo 1 >
>> >> /sys/bus/pci/rescan`?
>> >> Or did you try to swap fw from 10.2 to 10.1
>> >> (needs driver reload) after the "bad bad crashes" start to appear?
>> >>
>> >
>> > I try to load 10.1 after the firmware crashed on 10.2 and it is
>> > working. See log below.
>> >
>> > So no changes at all for this board to use 10.2 firmware?
>> [...]
>>
>> Did you try to reload the driver alone (without changing firmware)?
>
> You mean doing remove and rescan using 10.2 firmware? Yes, it crashed again.
>
> ---
> Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
