Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJB6D-0004eq-8F
 for ath10k@lists.infradead.org; Wed, 13 Jan 2016 02:23:52 +0000
Received: from mail.kernel.org (localhost [127.0.0.1])
 by mail.kernel.org (Postfix) with ESMTP id 5CA9420429
 for <ath10k@lists.infradead.org>; Wed, 13 Jan 2016 02:23:28 +0000 (UTC)
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D1BEB2041C
 for <ath10k@lists.infradead.org>; Wed, 13 Jan 2016 02:23:26 +0000 (UTC)
Received: by mail-yk0-f180.google.com with SMTP id v14so380309792ykd.3
 for <ath10k@lists.infradead.org>; Tue, 12 Jan 2016 18:23:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5684BFEF.8080302@qti.qualcomm.com>
References: <1450848915-9772-1-git-send-email-rmani@qti.qualcomm.com>
 <20151230163524.GA26810@rob-hp-laptop> <5684BFEF.8080302@qti.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 12 Jan 2016 20:23:06 -0600
Message-ID: <CAL_JsqLH=Lr5UcgzFUr8AwVDXF8ahiyYfD2gfWng1zfhH21N5g@mail.gmail.com>
Subject: Re: [PATCH] dt: bindings: add bindings for ipq4019 wifi block
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
To: Raja Mani <rmani@qti.qualcomm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-wireless@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, mmcclint@qca.qualcomm.com, Andy Gross <agross@codeaurora.org>

On Wed, Dec 30, 2015 at 11:41 PM, Raja Mani <rmani@qti.qualcomm.com> wrote:
>
> On Wednesday 30 December 2015 10:05 PM, Rob Herring wrote:
>>
>> On Wed, Dec 23, 2015 at 11:05:15AM +0530, Raja Mani wrote:
>>>
>>> Add device tree binding documentation details for wifi block present
>>> in Qualcomm IPQ4019 SoC into qcom,ath10k.txt.
>>>
>>> Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>
>>> ---
>>>   .../bindings/net/wireless/qcom,ath10k.txt          | 87
>>> ++++++++++++++++++++--
>>>   1 file changed, 82 insertions(+), 5 deletions(-)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>>> b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>>> index edefc26..ffd0742 100644
>>> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>>> @@ -1,17 +1,42 @@
>>>   * Qualcomm Atheros ath10k wireless devices
>>>
>>> -For ath10k devices the calibration data can be provided through Device
>>> -Tree. The node is a child node of the PCI controller.
>>
>>
>> So it is now not a PCI device?
>
>
> Right now, ath10k wireless driver has support for PCI devices. There is
> a plan to extend ath10k driver to support wifi devices which are connected
> over AHB as well (enumeration will happen via device tree node).
>
> Qualcomm IPQ4019 SoC has two inbuilt wifi block which are connected over AHB
> bus (not connected over PCI bus) and also has one external PCI
> slot where we can connect standalone wifi PCI devices.
>
> In future, ath10k would support both PCI and AHB. For PCI based
> devices, only calibration data is supplied via device tree. For AHB
> based devices (ie, ipq4019), all wifi properties are supplied
> via device tree (including irq, reg addr, cal data,etc).

Put this information in the binding. It is not clear and you seem to
be removing PCI information.

>>> -
>>>   Required properties:
>>> --compatible : Should be "qcom,ath10k"
>>> +- compatible: Should be one of the following:
>>> +       * "qcom,ath10k"
>>> +       * "qcom,ipq4019-wifi"
>>
>>
>> One is a standalone PCI device and one is embedded block in an SOC?
>
>
> Yes, it's possible to have this combination (one in SoC + one in
> standalone PCI device in the same platform).
>
>> These should be more separated as all these new properties would only
>> apply in the latter case.
>
>
> Sorry, i didn't get this point. I mentioned it under optional
> properties. Whichever properties applies to particular wifi, only
> those parameters are needed. For example, for PCI based devices,
> only calibration data is needed, for AHB based devices most the
> properties are needed.
>
> Is it fine if add below text some thing like this ?
>
> "only "qcom,ath10k-calibration-data" is applicable for PCI based
> devices, rest of the members are applicable only for AHB based
> devices"

Yes, but you need to explain in terms of compatible strings. Which
compatible strings correspond to PCI devices.

>>>   Optional properties:
>>> +- reg: Address and length of the register set for the device.
>>> +- core-id: Core number associated to the device.
>>
>>
>> This needs a better explanation.
>
>
> Sure, Let me add below text in next version.
>
> "core-id is numeric number associated to the wifi block.
>  For example, 0 means first block, 1 means second wifi block,etc."

Are the blocks the same? If not, then use different compatible
strings. Otherwise doesn't the reg property identify which block is
which? Or some other property? Different freq bands? We generally
don't allow indexes like this in the DT, so I need to understand how
you use this.

Rob

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
