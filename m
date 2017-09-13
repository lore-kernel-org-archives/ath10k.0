Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-01.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1drztl-0007nK-0s
 for ath10k@lists.infradead.org; Wed, 13 Sep 2017 05:07:43 +0000
From: Ryan Hsu <ryanhsu@qti.qualcomm.com>
Subject: Re: failed to fetch board data QCA6174
Date: Wed, 13 Sep 2017 05:06:41 +0000
Message-ID: <e24d670c-b239-5596-d175-d6b79c660966@qti.qualcomm.com>
References: <c1f6096c-7445-7862-a5df-b96211be9df3@gmail.com>
 <8d3a8d6f-5191-d1fa-784b-28cab8b407d5@qti.qualcomm.com>
 <e87292ba-a00c-edf9-2c02-5be14750bb60@gmail.com>
 <d4b43397-3267-abff-fbc1-48cbd9d58073@qti.qualcomm.com>
 <20170913091536.aefe1f16e91dcec2c69ee7b5@rasterman.com>
In-Reply-To: <20170913091536.aefe1f16e91dcec2c69ee7b5@rasterman.com>
Content-Language: en-US
Content-ID: <3845BA3915330444979526F2D81E3479@qualcomm.com>
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
To: Carsten Haitzler <raster@rasterman.com>
Cc: Luka Karinja <luka.karinja@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 09/12/2017 05:15 PM, Carsten Haitzler wrote:

> On Tue, 12 Sep 2017 23:14:33 +0000 Ryan Hsu <ryanhsu@qti.qualcomm.com> said:
>
>> On 09/12/2017 12:24 AM, Luka Karinja wrote:
>>
>>> [    3.662941] ath10k_pci 0000:05:00.0: qca6174 hw3.2 target 0x05030000
>>> chip_id 0x00340aff sub 0000:0000 
>> Hmm, where did you get this module? it seems like this module is not
>> calibrated or assigned a sub IDs information, that why it cause the failure,
>> since incorrect board file will lead to the firmware crash.
>>
>> You might want to contact your module provider to give you the correct board
>> file (board.bin) and replace it under the same firmware folder for
>> testing/developing.
> I see similar/same issues on an actual product (not some module or dev board).
> a new-ish laptop/tablet that runs windows out of the box. I sent mails to to
> here and linux-wireless too with zero responses on information on what the
> board bin file is and the firmware bin files and how they are created etc. as I
> suspected the key to the issue is somewhere there.
>

Sorry that I overlooked your post earlier (was out during that time and didn't have time to catch up the backlog...)

Your case is different from Luka's, your device do have the id calibrated, just that it is not added to the board-2.bin.

[  124.524661] ath10k_pci 0000:01:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 144d:c14f


Here are some general guidance you might want to find out the right board file if it failed at first place.

For you case, your board is calibrated, so from the failure logs, you coudl see above string - sub 144d:c14f, and then either your install package or you could seek the driver online, e.g this might work to your board.
https://drp.su/en/hwids/PCI%5CVEN_168C%26DEV_003E%26SUBSYS_C14F144D%26REV_32

And then extract the file you could see the PCI\VEN_168C&DEV_003E&SUBSYS_C14F144D&REV_32 is using "eeprom_ar6320_3p0_SS_720.bin", so if you could give it a try by renaming it to board.bin under your firmware folder.

And would be appreciated if you could feedback the result.

-- 
Ryan Hsu

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
