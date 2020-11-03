Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZr3j-0002yE-87
 for ath10k@lists.infradead.org; Tue, 03 Nov 2020 07:48:52 +0000
Received: by mail-wm1-x344.google.com with SMTP id v5so11693068wmh.1
 for <ath10k@lists.infradead.org>; Mon, 02 Nov 2020 23:48:49 -0800 (PST)
MIME-Version: 1.0
References: <1601058581-19461-1-git-send-email-amit.pundir@linaro.org>
 <20200929190817.GA968845@bogus> <20201029134017.GA807@yoga>
In-Reply-To: <20201029134017.GA807@yoga>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Tue, 3 Nov 2020 13:18:12 +0530
Message-ID: <CAMi1Hd20UpNhZm6z5t5Kcy8eTABiAj7X_Gm66QnJspZWSio0Ew@mail.gmail.com>
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
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh@kernel.org>, lkml <linux-kernel@vger.kernel.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Konrad Dybcio <konradybcio@gmail.com>, ath10k <ath10k@lists.infradead.org>, Sumit Semwal <sumit.semwal@linaro.org>, dt <devicetree@vger.kernel.org>, John Stultz <john.stultz@linaro.org>, Jakub Kicinski <kuba@kernel.org>, David S Miller <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

Hi Rob, Bjorn, Kalle,

On Thu, 29 Oct 2020 at 19:10, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 29 Sep 14:08 CDT 2020, Rob Herring wrote:
>
> > On Fri, Sep 25, 2020 at 11:59:41PM +0530, Amit Pundir wrote:
> > > There are firmware versions which do not support host capability
> > > QMI request. We suspect either the host cap is not implemented or
> > > there may be firmware specific issues, but apparently there seem
> > > to be a generation of firmware that has this particular behavior.
> > >
> > > For example, firmware build on Xiaomi Poco F1 (sdm845) phone:
> > > "QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c3-00257-QCAHLSWMTPLZ-1"
> > >
> > > If we do not skip the host cap QMI request on Poco F1, then we
> > > get a QMI_ERR_MALFORMED_MSG_V01 error message in the
> > > ath10k_qmi_host_cap_send_sync(). But this error message is not
> > > fatal to the firmware nor to the ath10k driver and we can still
> > > bring up the WiFi services successfully if we just ignore it.
> > >
> > > Hence introducing this DeviceTree quirk to skip host capability
> > > QMI request for the firmware versions which do not support this
> > > feature.
> >
> > So if you change the WiFi firmware, you may force a DT change too. Those
> > are pretty independent things otherwise.
> >
>
> Yes and that's not good. But I looked at somehow derive this from
> firmware version numbers etc and it's not working out, so I'm out of
> ideas for alternatives.
>
> > Why can't you just always ignore this error? If you can't deal with this
> > entirely in the driver, then it should be part of the WiFi firmware so
> > it's always in sync.
> >
>
> Unfortunately the firmware versions I've hit this problem on has gone
> belly up when receiving this request, that's why I asked Amit to add a
> flag to skip it.

So what is next for this DT quirk?

I'm OK to go back to my previous of_machine_is_compatible()
device specific hack, for now,
https://patchwork.kernel.org/project/linux-wireless/patch/1600328501-8832-1-git-send-email-amit.pundir@linaro.org/
till we have a reasonable fix in place or receive a vendor firmware
drop which fixes this problem (which I believe is highly unlikely
though, for this 2+ years old device).

Regards,
Amit Pundir

>
> That said, in the devices I've hit this I've managed to get newer
> firmware working, which doesn't have either problem.
>
> Regards,
> Bjorn

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
