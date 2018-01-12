Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ea1Gb-000448-5N
 for ath10k@lists.infradead.org; Fri, 12 Jan 2018 15:29:14 +0000
Subject: Re: Problems Configuring VHT160 and VHT80+80 for QCA9984
References: <CALAE=UDvCnuTK_mFJsdPccTbb6gxHmd_aw4HmL8mdvLZ3VL_mA@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <0f25a0ea-de8e-e424-c335-e37384cedaaa@candelatech.com>
Date: Fri, 12 Jan 2018 07:28:53 -0800
MIME-Version: 1.0
In-Reply-To: <CALAE=UDvCnuTK_mFJsdPccTbb6gxHmd_aw4HmL8mdvLZ3VL_mA@mail.gmail.com>
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
To: Robert Jones <rjones@gateworks.com>, ath10k <ath10k@lists.infradead.org>


On 01/11/2018 05:46 PM, Robert Jones wrote:
> Hello,
>
> I'm working with a WLE1216V5-20 ath10k wave 2 card using QCA9984
> chipset and having problems configuring an AP for VHT160 or 80+80
> mode. The hostapd v2.6 tool in both cases tells me that the "Driver
> does not support configured VHT capability".
>
> I'm using the custom board and firmware .bin files found at
> http://www.candelatech.com/ath10k-10.4.php. I see on the same page
> that they recommend using one of Ben Greear's kernels but I would
> prefer to stick with a mainline 4.14 if possible.
>
> Is this capability truly missing from the ath10k driver or am I
> misconfiguring something in my hostapd.conf?
>
> If the former, can anyone point me to a patch set that I can apply to
> the ath10k driver to support either of these two modes?

Early on there was bugs in stock firmware for how it did VHT160
vs how the driver thought it did.  I ended up fixing the CT firmware
to match closer to how the driver wanted it done at the time, but
I think that the driver has since changed.

I have not had time (nor much interest) to try to make my firmware work again with stock
driver for VHT160.

Either way, VHT160 is almost completely worthless because it can only
do 2x2 at VHT160, which is no faster than VHT80 at 4x4 but uses twice
as much bandwidth.

Thanks,
Ben

>
> Regards,
> Robert Jones
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
