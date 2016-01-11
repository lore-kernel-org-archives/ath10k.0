Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aIjmf-0000aU-9I
 for ath10k@lists.infradead.org; Mon, 11 Jan 2016 21:13:52 +0000
Received: by mail-wm0-x235.google.com with SMTP id f206so229477656wmf.0
 for <ath10k@lists.infradead.org>; Mon, 11 Jan 2016 13:13:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CANfLQra4yJy_VGX4DpnUusda3TsJAy4Zojhz7-OKozaiHsEmeQ@mail.gmail.com>
References: <CANfLQra4yJy_VGX4DpnUusda3TsJAy4Zojhz7-OKozaiHsEmeQ@mail.gmail.com>
Date: Mon, 11 Jan 2016 22:13:27 +0100
Message-ID: <CANfLQrZa+-ZbE2yT01z+SLQk2xtHJrKncnAK6nHCtMQbsHy93Q@mail.gmail.com>
Subject: Re: ath10k driver on Android
From: Gucea Doru <gucea.doru@gmail.com>
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
To: ath10k@lists.infradead.org
Cc: Marek Kwaczynski <marek.kwaczynski@tieto.com>, Kalle Valo <kvalo@qca.qualcomm.com>, Bartosz Markowski <bartosz.markowski@tieto.com>

Hi, everyone

Because no one answers my question, please let me rephrase it:

Did anyone tested the ath10k driver and QCA6174 chipset on Android
devices? From my research, all the tests were done on desktop
platforms (x86) running Linux.

I am asking you this because I have an Android smartphone with 3.10
kernel [1] running on the QCA6174 WiFi chipset. ath10k support for
QCA6174 WiFi chipset was added starting with 3.20 kernel. Let's say
that I'll use a backport for ath10k driver on 3.10.
After the backport, should I expect that the ath10k will automatically
detect and use the QCA6174 chipset or are there any other things that
I should take into consideration (HW problems. firmware problems)?


[1] https://github.com/OnePlusOSS/android_kernel_oneplus_msm8994

Regards,
Doru


On Sat, Jan 9, 2016 at 4:57 PM, Gucea Doru <gucea.doru@gmail.com> wrote:
> Hello,
>
> On the wiki page for ath10k [1] it is mentioned that ath10k driver has
> support for QCA6174 chipset.
> QCA6174 is present on a list of Android devices: Samsung Galaxy S5 LTE
> A [1], OnePlus 2 [3].
>
> My question is the next one: how could I verify that the above
> smartphones, containing QC0A6174 WiFi chipset, are using the ath10k
> driver?
>
> I mention that this information will help me on my Master thesis.
>
> [1] https://wireless.wiki.kernel.org/en/users/drivers/ath10k
> [2] http://www.androidauthority.com/galaxy-s5-lte-a-battery-benchmark-414550/
> [3] https://www.ifixit.com/Teardown/OnePlus+2+Teardown/45352
>
> Regards,
> Doru

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
