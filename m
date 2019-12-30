Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilzMt-00009P-07
 for ath10k@lists.infradead.org; Mon, 30 Dec 2019 18:02:16 +0000
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8E3B02071E
 for <ath10k@lists.infradead.org>; Mon, 30 Dec 2019 18:02:14 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id x129so26777733qke.8
 for <ath10k@lists.infradead.org>; Mon, 30 Dec 2019 10:02:14 -0800 (PST)
MIME-Version: 1.0
References: <1576496415-23064-1-git-send-email-tamizhr@codeaurora.org>
 <20191226185132.GA31120@bogus>
 <62b9e7b140a96401469f7075811d0d67@codeaurora.org>
In-Reply-To: <62b9e7b140a96401469f7075811d0d67@codeaurora.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 30 Dec 2019 11:02:02 -0700
Message-ID: <CAL_JsqKspnQ50Muw-jeq+uE1+vj5nuzpxmYcOSFwY+n2Gj3tXA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: ath10k: Add new dt entries to identify
 coex support
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
To: Tamizh Chelvam <tamizhr@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

On Sun, Dec 29, 2019 at 10:07 PM <tamizhr@codeaurora.org> wrote:
>
> Hi Rob,
>
> Thanks for your review comments.
>
> >> This adds new dt entries qcom,coexist-support and
> >> qcom,coexist-gpio-pin
> >> which will be used by ath10k driver to identify coex support
> >> of a hardware and notify wifi firmware the gpio pin number.
> >> This pin number information is needed for the hardware QCA4019.
> >>
> >> Signed-off-by: Tamizh Chelvam <tamizhr@codeaurora.org>
> >> ---
> >>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 6
> >> ++++++
> >>  1 file changed, 6 insertions(+)
> >>
> >> diff --git
> >> a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> >> b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> >> index 0171283..a41e936 100644
> >> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> >> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> >> @@ -87,6 +87,10 @@ Optional properties:
> >>      Definition: Quirk specifying that the firmware expects the 8bit
> >> version
> >>                  of the host capability QMI request
> >>  - qcom,xo-cal-data: xo cal offset to be configured in xo trim
> >> register.
> >> +- qcom,coexist-support : should contain eithr "0" or "1" to indicate

typo

> >> coex
> >> +                     support by the hardware.
> >> +- qcom,coexist-gpio-pin : gpio pin number  information to support
> >> coex
> >> +                      which will be used by wifi firmware.
> >
> > What combinations of these 2 properties are valid?
> >
> > Is qcom,coexist-gpio-pin required for coexist support? If so then it
> > alone should be enough to enable/disable coexist.
> >
> qcom,coexist-gpio-pin is required for QCA4019 devices. And other ath10k
> devices doesn't required that value.
> So only added two fields to enable/disable coexist and another for
> notifying the gpio pin info.

Okay.

'qcom,coexist-support' can be boolean instead. Unless you need it to
override a default setting.

Rob

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
