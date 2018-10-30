Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHW0P-0008Vh-OP
 for ath10k@lists.infradead.org; Tue, 30 Oct 2018 15:32:41 +0000
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1EA792075D
 for <ath10k@lists.infradead.org>; Tue, 30 Oct 2018 15:32:22 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id u68so3541614qkg.9
 for <ath10k@lists.infradead.org>; Tue, 30 Oct 2018 08:32:22 -0700 (PDT)
MIME-Version: 1.0
References: <1538653364-1239-1-git-send-email-bperumal@codeaurora.org>
 <1538653364-1239-2-git-send-email-bperumal@codeaurora.org>
 <20181015192425.GA19699@bogus>
 <d617b0c39a2faa7c9b23b884bef3f829@codeaurora.org>
In-Reply-To: <d617b0c39a2faa7c9b23b884bef3f829@codeaurora.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 30 Oct 2018 10:32:10 -0500
Message-ID: <CAL_JsqLTxzFSQ6jvZo7CCcxBML6Y5j2AvAOotnVDJGTh-1K7ZA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt: bindings: add new dt entry to indentify external
 FEM
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
To: Bhagavathi Perumal S <bperumal@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

On Tue, Oct 30, 2018 at 3:41 AM <bperumal@codeaurora.org> wrote:
>
> On 2018-10-16 00:54, Rob Herring wrote:
> > On Thu, Oct 04, 2018 at 05:12:43PM +0530, Bhagavathi Perumal S wrote:
> >> This adds new dt entry ext-fem-name, it is used by ath10k driver
> >> to select correct timing parameters and configure it in target wifi
> >> hardware.
> >> The Front End Module(FEM) normally includes tx power amplifier(PA) and
> >> rx low noise amplifier(LNA). The default timing parameters like tx end
> >> to
> >> PA off timing values were fine tuned for internal FEM used in
> >> reference
> >> design. And these timing values can not be same if ODM modifies
> >> hardware
> >> design with different external FEM. This DT entry helps to choose
> >> correct
> >> timing values in driver if different external FEM hardware used.
> >
> > 'dt-bindings: net: ath10k: ...' for the subject please.
> Sure, I will change and send v2 patch.
>
> >
> >>
> >> Signed-off-by: Bhagavathi Perumal S <bperumal@codeaurora.org>
> >> ---
> >>  .../bindings/net/wireless/qcom,ath10k.txt          | 22
> >> ++++++++++++++++++++++
> >>  1 file changed, 22 insertions(+)
> >>
> >> diff --git
> >> a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> >> b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> >> index 7fd4e8c..fbaf309 100644
> >> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> >> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> >> @@ -56,6 +56,7 @@ Optional properties:
> >>                                   the length can vary between hw versions.
> >>  - <supply-name>-supply: handle to the regulator device tree node
> >>                         optional "supply-name" is "vdd-0.8-cx-mx".
> >> +- ext-fem-name: name of external front end module used.
> >
> > What are valid names? What if the OS doesn't recognize the name?
> > Perhaps
> Some valid FEM devices are "microsemi-lx5586", "sky85703-11" and
> "sky85803" etc.
> Currently driver accepts only "microsemi-lx5586", Since this FEM
> requires different timing settings,

Assuming you keep this, then you need to enumerate what are valid
values in the binding. Otherwise, 'ext-fem-name = "rob"' is valid.

> And it can be extended for other FEM devices in future.
> If OS doesn't recognize the name, it uses predefined default timing
> settings.
>
> > this should be a compatible string for the particular module instead?
> > Then it could cover any differences, not just the FEM.
> >
> No, it is specific to FEM device.

You will be better off having either a specific compatible string or
using VID/PID as this is a PCI device. Then you can handle other
differences you may find between h/w versions without a DT change.

> >>
> >>  Example (to supply the calibration data alone):
> >>
> >> @@ -150,3 +151,24 @@ wifi@18000000 {
> >>                         <0 141 0 /* CE11 */ >;
> >>              vdd-0.8-cx-mx-supply = <&pm8998_l5>;
> >>  };
> >> +
> >> +Example (to supply the external front end module name):
> >> +
> >> +In this example, the front end module is defined as a property of the
> >> ath10k
> >> +device node.
> >
> > Really need a whole new example for 1 property?
> Will add this property in existing example.
>
> >
> >> +
> >> +pci {
> >> +    pcie@0 {
> >> +            reg = <0 0 0 0 0>;
> >> +            #interrupt-cells = <1>;
> >> +            #size-cells = <2>;
> >> +            #address-cells = <3>;
> >> +            device_type = "pci";
> >> +
> >> +            ath10k@0,0 {
> >
> > wifi@0,0
> Added in ath10k@0,0 to make consistent with existing property
> "qcom,ath10k-calibration-data" below,
> "

I don't see how that matters.

> pci {
>          pcie@0 {
>                  reg = <0 0 0 0 0>;
>                  #interrupt-cells = <1>;
>                  #size-cells = <2>;
>                  #address-cells = <3>;
>                  device_type = "pci";
>
>                  ath10k@0,0 {
>                          reg = <0 0 0 0 0>;
>                          device_type = "pci";
>                          qcom,ath10k-calibration-data = [ 01 02 03 ... ];
>                  };
>          };
> };
> "
>
> If wifi@0,0 is preferable, then I will add new entry "wifi@0,0" and add
> ext-fem-name into it.

Node names are supposed to reflect the class of device, not the model.
See the DT spec for a list.

>
> >
> >> +                    reg = <0 0 0 0 0>;
> >> +                    device_type = "pci";

Also, this is wrong. Only PCI bridges should have this property. dtc
will give you a warning on this.

> >> +                    ext-fem-name = "microsemi-lx5586";
> >> +            };
> >> +    };
> >> +};
> >> --
> >> 1.9.1
> >>
>
> Thanks, Sorry for the delayed response,
> Bhagavathi Perumal S.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
