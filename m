Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1faNJO-0005T5-J5
 for ath10k@lists.infradead.org; Tue, 03 Jul 2018 15:33:53 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2 0/6]  *** Add support for wifi QMI client driver ***
References: <20180605123304.31969-1-govinds@codeaurora.org>
 <20180619021742.GA17220@rodete-desktop-imager.corp.google.com>
Date: Tue, 03 Jul 2018 18:33:34 +0300
In-Reply-To: <20180619021742.GA17220@rodete-desktop-imager.corp.google.com>
 (Brian Norris's message of "Mon, 18 Jun 2018 19:17:44 -0700")
Message-ID: <87woucnxkh.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Brian Norris <briannorris@chromium.org>
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, bjorn.andersson@linaro.org, david.brown@linaro.org, andy.gross@linaro.org

Brian Norris <briannorris@chromium.org> writes:

> On Tue, Jun 05, 2018 at 06:03:04PM +0530, Govind Singh wrote:
>> Add QMI client driver for Q6 integrated WLAN connectivity subsystem.
>> This module is responsible for communicating WLAN control messages to FW
>> over QMI interface.
>> 
>> QUALCOMM MSM Interface(QMI) provides the control interface between
>> components running b/w remote processors with underlying transport layer
>> based on integrated chipset(shared memory) or discrete chipset(PCI/USB/SDIO/UART).
>
> So this seems to imply QMI would work with transports that are not
> integrated. Except, your code is directly calling SNOC (one of your
> integrated chipset interfaces) code from the QMI driver. Correct? I
> suppose that's OK for now, but it's a little misleading. If you actually
> intend this to support multiple transports, then you might instead want
> a callback interface for this.

Sure. But do we even know that the QMI interfaces are even compatible?
AFAIK QMI is just an RPC protocol, so there's no guarantee about
interface stability. So I don't see the need to support other interfaces
until we know exactly what we need to implement.

>> QMI client driver implementation is based on qmi frmework https://lwn.net/Articles/729924/.
>> 
>> Below is the sequence of qmi handshake.
>> 
>>        QMI CLIENT(APPS)                                         QMI SERVER(FW in Q6)
>> 
>>                          <------wlan service discoverd----
>> 
>>                        -----connect to wlam qmi service----->
>> 
>>                        ------------wlan info request----->
>> 
>>                        <------------wlan info resp------------
>> 
>>                        ------------msa info req-------->
>> 
>>                      <------------msa info resp------------
>> 
>>                      ------------msa ready req-------->
>> 
>>                      <------------msa ready resp------------
>> 
>>                      <------------msa ready indication-------
>> 
>>                      ------------capability req------->
>> 
>>                     <------------capability resp------------
>> 
>>                     ------------qmi bdf req--------->
>> 
>>                      <------------qmi bdf resp------------
>> 
>>                       ------------qmi cal trigger------->
>> 
>>                   <------------ QMI FW ready indication-------
>
> Let's see if I'm interpreting this right:
>
>  * The above process is just initiating a handshake with the QMI
>    service and doesn't actually do any loading of firmware on its own;
>    it just hands things off to the SNOC client driver (and ath10k core)
>    once the firmware is magically ready (??)
>  * The ATH10K_FW_FEATURE_NON_BMI flag you added previously basically
>    provides a way for a driver (and now we see which driver; it's this
>    QMI / SNOC driver) to completely sidestep the typicaly in-kernel
>    firmware load implementation; in fact, the kernel only reads the
>    WLAN firmware just to parse some feature flags, not to actually
>    program it to the device
>  * Some yet-unmentioned proprietary app is involved to handle
>    sideloading the actual firmware from user space
>
> Is this correct? If not, please correct me. But if it is:
>
>  * When does the user space app actually load the WLAN firmware? I'm not
>    sure I can place it in the above diagram.
>  * Is there any open source implementation of this? How am I supposed to
>    actually use this driver, if it relies on proprietary components that
>    I can't review and aren't really even mentioned?
>
> I hope I'm sorely wrong on this. But if I'm not, I don't see why this
> driver should be merged at all. Linux drivers should be self-sufficient
> wherever possible, and I don't see a good reason why this driver can't
> manage actually loading the WLAN firmware on its own, similar to how the
> BMI component of the ath10k driver loads firmware for other ath10k
> transports. But even more importantly: I believe this driver is hiding
> the fact that it relies on undocumented proprietary components to run on
> the CPU [1] just to make use of it at all.

First of all, thanks for bringing this up! I was aware of the need of
user space tools to download the firmware to Q6 but I assumed they were
Open Source, which to my surprise they were not. An upstream driver
definitely needs to have open user space components so that anyone can
use it, and hence I cannot apply these until that's solved. Luckily
Bjorn has been working on that and he has done good progress on those,
though I think there were some issues still.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
