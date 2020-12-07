Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmJnX-0005SV-HZ
 for ath10k@lists.infradead.org; Mon, 07 Dec 2020 16:55:42 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Introduce a devicetree quirk to skip host cap QMI
 requests
References: <1601058581-19461-1-git-send-email-amit.pundir@linaro.org>
 <20200929190817.GA968845@bogus> <20201029134017.GA807@yoga>
 <CAMi1Hd20UpNhZm6z5t5Kcy8eTABiAj7X_Gm66QnJspZWSio0Ew@mail.gmail.com>
 <20201124175146.GG185852@builder.lan>
Date: Mon, 07 Dec 2020 18:55:29 +0200
In-Reply-To: <20201124175146.GG185852@builder.lan> (Bjorn Andersson's message
 of "Tue, 24 Nov 2020 11:51:46 -0600")
Message-ID: <87sg8heeta.fsf@codeaurora.org>
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
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Amit Pundir <amit.pundir@linaro.org>, Rob Herring <robh@kernel.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Konrad Dybcio <konradybcio@gmail.com>, dt <devicetree@vger.kernel.org>, John Stultz <john.stultz@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, David S Miller <davem@davemloft.net>

Bjorn Andersson <bjorn.andersson@linaro.org> writes:

> On Tue 03 Nov 01:48 CST 2020, Amit Pundir wrote:
>
>> Hi Rob, Bjorn, Kalle,
>> 
>> On Thu, 29 Oct 2020 at 19:10, Bjorn Andersson
>> <bjorn.andersson@linaro.org> wrote:
>> >
>> > On Tue 29 Sep 14:08 CDT 2020, Rob Herring wrote:
>> >
>> > > On Fri, Sep 25, 2020 at 11:59:41PM +0530, Amit Pundir wrote:
>> > > > There are firmware versions which do not support host capability
>> > > > QMI request. We suspect either the host cap is not implemented or
>> > > > there may be firmware specific issues, but apparently there seem
>> > > > to be a generation of firmware that has this particular behavior.
>> > > >
>> > > > For example, firmware build on Xiaomi Poco F1 (sdm845) phone:
>> > > > "QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c3-00257-QCAHLSWMTPLZ-1"
>> > > >
>> > > > If we do not skip the host cap QMI request on Poco F1, then we
>> > > > get a QMI_ERR_MALFORMED_MSG_V01 error message in the
>> > > > ath10k_qmi_host_cap_send_sync(). But this error message is not
>> > > > fatal to the firmware nor to the ath10k driver and we can still
>> > > > bring up the WiFi services successfully if we just ignore it.
>> > > >
>> > > > Hence introducing this DeviceTree quirk to skip host capability
>> > > > QMI request for the firmware versions which do not support this
>> > > > feature.
>> > >
>> > > So if you change the WiFi firmware, you may force a DT change too. Those
>> > > are pretty independent things otherwise.
>> > >
>> >
>> > Yes and that's not good. But I looked at somehow derive this from
>> > firmware version numbers etc and it's not working out, so I'm out of
>> > ideas for alternatives.
>> >
>> > > Why can't you just always ignore this error? If you can't deal with this
>> > > entirely in the driver, then it should be part of the WiFi firmware so
>> > > it's always in sync.
>> > >
>> >
>> > Unfortunately the firmware versions I've hit this problem on has gone
>> > belly up when receiving this request, that's why I asked Amit to add a
>> > flag to skip it.
>> 
>> So what is next for this DT quirk?
>> 
>
> Rob, we still have this problem and we've not come up with any way to
> determine in runtime that we need to skip this part of the
> initialization.

This is firmware version specific, right? There's also enum
ath10k_fw_features which is embedded within firmware-N.bin, we could add
a new flag there. But that means that a correct firmware-N.bin is needed
for each firmware version, not sure if that would work out. Just
throwing out ideas here.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
