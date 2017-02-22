Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x22c.google.com ([2a00:1450:4010:c07::22c])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cge0P-0004mN-Bk
 for ath10k@lists.infradead.org; Wed, 22 Feb 2017 20:59:23 +0000
Received: by mail-lf0-x22c.google.com with SMTP id z127so7614142lfa.2
 for <ath10k@lists.infradead.org>; Wed, 22 Feb 2017 12:59:00 -0800 (PST)
Subject: Re: Driver support for QCA6174 chip using SDIO interface
References: <CAHNpzpeRE6ha4JA9i4oyJ2BjgJg53FvDpAb1yZccncrmTeiBdQ@mail.gmail.com>
 <8737g45xc7.fsf@kamboji.qca.qualcomm.com>
 <c3814c7d-eed3-dad2-c568-6ce456ee7166@gmail.com>
 <CAHNpzpdbTnapQFPwYhUhi5EvLjQSdpqy9AHMH04KcqF2jHWw_A@mail.gmail.com>
 <CAHNpzpeao2rT8JJ5rSALHknrkFHniixJftGLTnUxcd7RtoYdtQ@mail.gmail.com>
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Message-ID: <13839ca7-e43e-8475-04de-8c705c4e3ee2@gmail.com>
Date: Wed, 22 Feb 2017 21:58:57 +0100
MIME-Version: 1.0
In-Reply-To: <CAHNpzpeao2rT8JJ5rSALHknrkFHniixJftGLTnUxcd7RtoYdtQ@mail.gmail.com>
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
To: Akesh M Chacko <akesh.chacko@vvdntech.in>
Cc: "Valo, Kalle" <kvalo@qca.qualcomm.com>, Ann Lo <annlo.tech@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 2017-02-21 12:26, Akesh M Chacko wrote:
> hi,
> I'm following your patch for adding SDIO support for QCA6174. Is the
> firmware image for PCIe and SDIO interface are same?
> If they are different, from where can i find the firmware image for
> SDIO interface support in QCA6174A-3 v3.2.
>
The firmware is not the same for sdio. You will need to obtain the firmware
from the module vendor and convert it into ath10k format with ath10k-fwencoder.

You need the tool qca-swiss-army-knife for this:

https://github.com/qca/qca-swiss-army-knife.git

Below is a script I have used when generating fw for my QCA9377 board:

### START ###
#! /bin/bash

ENCODER="./tools/scripts/ath10k/ath10k-fwencoder"

API_VER=5
HTT_OP_VERSION="tlv"
WMI_OP_VERSION="tlv"
FW="silex-SX-SDCAC-2830-SP/qwlan30.bin"
OTP="silex-SX-SDCAC-2830-SP/otp30.bin"
FEATURES="ignore-otp-result"

$ENCODER --create --otp=$OTP --firmware=$FW \
--set-wmi-op-version=$WMI_OP_VERSION \
--set-htt-op-version=$HTT_OP_VERSION \
--set-fw-api=$API_VER --features=$FEATURES

mv firmware-5.bin silex-SX-SDCAC-2830-SP/firmware-sdio-5.bin
### END ###

> Thanks & Regards
> Akesh M Chacko
>
>
> On Tue, Jan 31, 2017 at 5:04 PM, Akesh M Chacko
> <akesh.chacko@vvdntech.in> wrote:
>> Thanks for sharing the patches,
>> Our custom board is under assembly stage, once we have the board, will
>> test it and let u know
>> Thanks & Regards
>> Akesh M Chacko
>> Cell : +91 9567084416| Skype: akesh.vvdn | mail : akesh.chacko@vvdntech.in
>>
>>
>> On Mon, Jan 30, 2017 at 2:46 AM, Erik Stromdahl
>> <erik.stromdahl@gmail.com> wrote:
>>> If you are interested in trying the latest version of the sdio code
>>> you can clone the below repo:
>>>
>>> https://github.com/erstrom/linux-ath.git
>>>
>>> I have just pushed some updates for QCA9377 SDIO (that might work with
>>> QCA6174 chipsets as well).
>>>
>>> I will do some more testing of this code during the weeks to come.
>>>
>>> If you could try it out and give me feedback it would be great!
>>>
>>>
>>> On 2017-01-27 16:36, Valo, Kalle wrote:
>>>>
>>>> Akesh M Chacko <akesh.chacko@vvdntech.in> writes:
>>>>
>>>>> We are using QCA6174 chip on our embedded platform using SDIO
>>>>> interface. could you please help us to get the SDIO support for
>>>>> QCA6174 driver.
>>>>
>>>>
>>>> Erik Stromdahl is working on adding SDIO support to ath10k:
>>>>
>>>> https://patchwork.kernel.org/patch/9516477/
>>>>
>>>> But it's still WIP.
>>>>
>>>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
