Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNa06-0001Pg-EQ
 for ath10k@lists.infradead.org; Wed, 30 Sep 2020 11:10:23 +0000
Received: by mail-wr1-x443.google.com with SMTP id t10so1335728wrv.1
 for <ath10k@lists.infradead.org>; Wed, 30 Sep 2020 04:10:20 -0700 (PDT)
MIME-Version: 1.0
References: <1601058581-19461-1-git-send-email-amit.pundir@linaro.org>
 <20200929190817.GA968845@bogus>
In-Reply-To: <20200929190817.GA968845@bogus>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Wed, 30 Sep 2020 16:39:43 +0530
Message-ID: <CAMi1Hd1NhPipHMWFjGu6MMJDNRNndmvYrEt-5sFowYJPwtJdxw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Introduce a devicetree quirk to skip host cap QMI
 requests
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
To: Rob Herring <robh@kernel.org>
Cc: dt <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Konrad Dybcio <konradybcio@gmail.com>, ath10k <ath10k@lists.infradead.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, John Stultz <john.stultz@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, David S Miller <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

On Wed, 30 Sep 2020 at 00:38, Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Sep 25, 2020 at 11:59:41PM +0530, Amit Pundir wrote:
> > There are firmware versions which do not support host capability
> > QMI request. We suspect either the host cap is not implemented or
> > there may be firmware specific issues, but apparently there seem
> > to be a generation of firmware that has this particular behavior.
> >
> > For example, firmware build on Xiaomi Poco F1 (sdm845) phone:
> > "QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c3-00257-QCAHLSWMTPLZ-1"
> >
> > If we do not skip the host cap QMI request on Poco F1, then we
> > get a QMI_ERR_MALFORMED_MSG_V01 error message in the
> > ath10k_qmi_host_cap_send_sync(). But this error message is not
> > fatal to the firmware nor to the ath10k driver and we can still
> > bring up the WiFi services successfully if we just ignore it.
> >
> > Hence introducing this DeviceTree quirk to skip host capability
> > QMI request for the firmware versions which do not support this
> > feature.
>
> So if you change the WiFi firmware, you may force a DT change too. Those
> are pretty independent things otherwise.

This is a valid concern and I'm not sure about the other devices, but
on PocoF1 I have tried all the three released firmware version updates:

WLAN.HL.2.0.c3-00257-QCAHLSWMTPLZ-1
WLAN.HL.2.0.c3-00445-QCAHLSWMTPLZ-1
WLAN.HL.2.0.c3-00534-QCAHLSWMTPLZ-1

and none of them works without this skip host-cap patch or equivalent
hack. PocoF1 is already 2+ years old device and sadly I do not expect
any major vendor update coming its way.

>
> Why can't you just always ignore this error? If you can't deal with this
> entirely in the driver, then it should be part of the WiFi firmware so
> it's always in sync.

I don't know the technical details of the ath10k/qmi driver, but I'm
OK if we just ignore the return value of
ath10k_qmi_host_cap_send_sync() and move along.

Regards,
Amit Pundir

>
> Rob

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
