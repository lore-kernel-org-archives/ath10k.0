Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJEUW-0006sr-1q
 for ath10k@lists.infradead.org; Wed, 13 Jan 2016 06:01:08 +0000
Message-ID: <5695E76F.6060305@qti.qualcomm.com>
Date: Wed, 13 Jan 2016 11:28:07 +0530
From: Raja Mani <rmani@qti.qualcomm.com>
MIME-Version: 1.0
Subject: Re: [PATCH] dt: bindings: add bindings for ipq4019 wifi block
References: <1450848915-9772-1-git-send-email-rmani@qti.qualcomm.com>
 <20151230163524.GA26810@rob-hp-laptop> <5684BFEF.8080302@qti.qualcomm.com>
 <CAL_JsqLH=Lr5UcgzFUr8AwVDXF8ahiyYfD2gfWng1zfhH21N5g@mail.gmail.com>
In-Reply-To: <CAL_JsqLH=Lr5UcgzFUr8AwVDXF8ahiyYfD2gfWng1zfhH21N5g@mail.gmail.com>
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
To: Rob Herring <robh@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-wireless@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, mmcclint@qca.qualcomm.com, Andy Gross <agross@codeaurora.org>


On Wednesday 13 January 2016 07:53 AM, Rob Herring wrote:
> On Wed, Dec 30, 2015 at 11:41 PM, Raja Mani <rmani@qti.qualcomm.com> wrote:
>>
>> On Wednesday 30 December 2015 10:05 PM, Rob Herring wrote:
>>>
>>> On Wed, Dec 23, 2015 at 11:05:15AM +0530, Raja Mani wrote:
>>>>
>>>> Add device tree binding documentation details for wifi block present
>>>> in Qualcomm IPQ4019 SoC into qcom,ath10k.txt.
>>>>
>>>> Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>
>>>> ---
>>>>    .../bindings/net/wireless/qcom,ath10k.txt          | 87
>>>> ++++++++++++++++++++--
>>>>    1 file changed, 82 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>>>> b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>>>> index edefc26..ffd0742 100644
>>>> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>>>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>>>> @@ -1,17 +1,42 @@
>>>>    * Qualcomm Atheros ath10k wireless devices
>>>>
>>>> -For ath10k devices the calibration data can be provided through Device
>>>> -Tree. The node is a child node of the PCI controller.
>>>
>>>
>>> So it is now not a PCI device?
>>
>>
>> Right now, ath10k wireless driver has support for PCI devices. There is
>> a plan to extend ath10k driver to support wifi devices which are connected
>> over AHB as well (enumeration will happen via device tree node).
>>
>> Qualcomm IPQ4019 SoC has two inbuilt wifi block which are connected over AHB
>> bus (not connected over PCI bus) and also has one external PCI
>> slot where we can connect standalone wifi PCI devices.
>>
>> In future, ath10k would support both PCI and AHB. For PCI based
>> devices, only calibration data is supplied via device tree. For AHB
>> based devices (ie, ipq4019), all wifi properties are supplied
>> via device tree (including irq, reg addr, cal data,etc).
>
> Put this information in the binding. It is not clear and you seem to
> be removing PCI information.

Okay, I'll fix it in next version.

>
>>>> -
>>>>    Required properties:
>>>> --compatible : Should be "qcom,ath10k"
>>>> +- compatible: Should be one of the following:
>>>> +       * "qcom,ath10k"
>>>> +       * "qcom,ipq4019-wifi"
>>>
>>>
>>> One is a standalone PCI device and one is embedded block in an SOC?
>>
>>
>> Yes, it's possible to have this combination (one in SoC + one in
>> standalone PCI device in the same platform).
>>
>>> These should be more separated as all these new properties would only
>>> apply in the latter case.
>>
>>
>> Sorry, i didn't get this point. I mentioned it under optional
>> properties. Whichever properties applies to particular wifi, only
>> those parameters are needed. For example, for PCI based devices,
>> only calibration data is needed, for AHB based devices most the
>> properties are needed.
>>
>> Is it fine if add below text some thing like this ?
>>
>> "only "qcom,ath10k-calibration-data" is applicable for PCI based
>> devices, rest of the members are applicable only for AHB based
>> devices"
>
> Yes, but you need to explain in terms of compatible strings. Which
> compatible strings correspond to PCI devices.

Sure, i'll add this detail.

>
>>>>    Optional properties:
>>>> +- reg: Address and length of the register set for the device.
>>>> +- core-id: Core number associated to the device.
>>>
>>>
>>> This needs a better explanation.
>>
>>
>> Sure, Let me add below text in next version.
>>
>> "core-id is numeric number associated to the wifi block.
>>   For example, 0 means first block, 1 means second wifi block,etc."
>
> Are the blocks the same? If not, then use different compatible
> strings. Otherwise doesn't the reg property identify which block is
> which? Or some other property? Different freq bands? We generally
> don't allow indexes like this in the DT, so I need to understand how
> you use this.
>
> Rob
>

I understand the confusion and the limitation, i'll remove core-id in 
next version and manage this in driver itself.

Could you please consider v3 of this patch for further review? I hope,
i addressed all your review comments.

--
Raja

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
