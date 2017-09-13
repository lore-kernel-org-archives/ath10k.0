Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from kirsty.vergenet.net ([202.4.237.240])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ds7Eb-0003m5-PK
 for ath10k@lists.infradead.org; Wed, 13 Sep 2017 12:57:44 +0000
Date: Wed, 13 Sep 2017 21:56:59 +0900
From: Carsten Haitzler <raster@rasterman.com>
Subject: Re: failed to fetch board data QCA6174
Message-Id: <20170913215659.afd05b8889b4f2eb943db76c@rasterman.com>
In-Reply-To: <e24d670c-b239-5596-d175-d6b79c660966@qti.qualcomm.com>
References: <c1f6096c-7445-7862-a5df-b96211be9df3@gmail.com>
 <8d3a8d6f-5191-d1fa-784b-28cab8b407d5@qti.qualcomm.com>
 <e87292ba-a00c-edf9-2c02-5be14750bb60@gmail.com>
 <d4b43397-3267-abff-fbc1-48cbd9d58073@qti.qualcomm.com>
 <20170913091536.aefe1f16e91dcec2c69ee7b5@rasterman.com>
 <e24d670c-b239-5596-d175-d6b79c660966@qti.qualcomm.com>
Mime-Version: 1.0
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
To: Ryan Hsu <ryanhsu@qti.qualcomm.com>
Cc: Luka Karinja <luka.karinja@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Wed, 13 Sep 2017 05:06:41 +0000 Ryan Hsu <ryanhsu@qti.qualcomm.com> said:

> On 09/12/2017 05:15 PM, Carsten Haitzler wrote:
> 
> > On Tue, 12 Sep 2017 23:14:33 +0000 Ryan Hsu <ryanhsu@qti.qualcomm.com> said:
> >
> >> On 09/12/2017 12:24 AM, Luka Karinja wrote:
> >>
> >>> [    3.662941] ath10k_pci 0000:05:00.0: qca6174 hw3.2 target 0x05030000
> >>> chip_id 0x00340aff sub 0000:0000 
> >> Hmm, where did you get this module? it seems like this module is not
> >> calibrated or assigned a sub IDs information, that why it cause the
> >> failure, since incorrect board file will lead to the firmware crash.
> >>
> >> You might want to contact your module provider to give you the correct
> >> board file (board.bin) and replace it under the same firmware folder for
> >> testing/developing.
> > I see similar/same issues on an actual product (not some module or dev
> > board). a new-ish laptop/tablet that runs windows out of the box. I sent
> > mails to to here and linux-wireless too with zero responses on information
> > on what the board bin file is and the firmware bin files and how they are
> > created etc. as I suspected the key to the issue is somewhere there.
> >
> 
> Sorry that I overlooked your post earlier (was out during that time and
> didn't have time to catch up the backlog...)

No problems Ryan! Thanks for the reply.

> Your case is different from Luka's, your device do have the id calibrated,
> just that it is not added to the board-2.bin.
> 
> [  124.524661] ath10k_pci 0000:01:00.0: qca6174 hw3.2 target 0x05030000
> chip_id 0x00340aff sub 144d:c14f
> 
> 
> Here are some general guidance you might want to find out the right board
> file if it failed at first place.
> 
> For you case, your board is calibrated, so from the failure logs, you coudl
> see above string - sub 144d:c14f, and then either your install package or you
> could seek the driver online, e.g this might work to your board.
> https://drp.su/en/hwids/PCI%5CVEN_168C%26DEV_003E%26SUBSYS_C14F144D%26REV_32
> 
> And then extract the file you could see the PCI
> \VEN_168C&DEV_003E&SUBSYS_C14F144D&REV_32 is using
> "eeprom_ar6320_3p0_SS_720.bin", so if you could give it a try by renaming it
> to board.bin under your firmware folder.
> 
> And would be appreciated if you could feedback the result.

Absolutely. Well ... my first port of call instead of teh above site/url was to
use the matching file in the Qualcomm windows driver directory i copied off
windows before nuking it.  same filename. eeprom_ar6320_3p0_SS_720.bin. also
there's eeprom_ar6320_3p0_SS_720_K.bin too. I tried both... and:

[  154.007574] ath10k_pci 0000:01:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 144d:c14f
[  154.007577] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 0 testmode 0
[  154.008207] ath10k_pci 0000:01:00.0: firmware ver WLAN.RM.4.4-00022-QCARMSWPZ-2 api 6 features wowlan,ignore-otp crc32 4d458559
[  154.072786] ath10k_pci 0000:01:00.0: failed to fetch board data for bus=pci,vendor=168c,device=003e,subsystem-vendor=144d,subsystem-device=c14f,variant=K from ath10k/QCA6174/hw3.0/board-2.bin
[  154.072807] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A crc32 ed5f849a
[  154.640347] ath10k_pci 0000:01:00.0: Unknown eventid: 90118
[  157.709005] ath10k_pci 0000:01:00.0: failed to ping firmware: -110
[  157.709019] ath10k_pci 0000:01:00.0: failed to reset rx filter: -110
[  157.782164] ath10k_pci 0000:01:00.0: could not init core (-110)
[  157.782206] ath10k_pci 0000:01:00.0: could not probe fw (-110)

and for the _K variant:

[  372.001685] ath10k_pci 0000:01:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 144d:c14f
[  372.001687] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 0 testmode 0
[  372.002098] ath10k_pci 0000:01:00.0: firmware ver WLAN.RM.4.4-00022-QCARMSWPZ-2 api 6 features wowlan,ignore-otp crc32 4d458559
[  372.066672] ath10k_pci 0000:01:00.0: failed to fetch board data for bus=pci,vendor=168c,device=003e,subsystem-vendor=144d,subsystem-device=c14f,variant=K from ath10k/QCA6174/hw3.0/board-2.bin
[  372.066691] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A crc32 ad2a5746
[  372.634622] ath10k_pci 0000:01:00.0: Unknown eventid: 90118
[  372.635466] ath10k_pci 0000:01:00.0: htt-ver 3.32 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[  372.713216] ath: EEPROM regdomain: 0x5f
[  372.713218] ath: EEPROM indicates we should expect a direct regpair map
[  372.713218] ath: invalid regulatory domain/country code 0x5f
[  372.713219] ath: Invalid EEPROM contents
[  372.713223] ath10k_pci 0000:01:00.0: failed to initialise regulatory: -22
[  372.713225] ath10k_pci 0000:01:00.0: could not register to mac80211 (-22)

same thing. board.bin is small like the windows eeprom files, so it makes sense and works. trying the url above to download from instead... exact same story. checksum for board file is different, but everything else is the same:

[   40.135513] ath10k_pci 0000:01:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 144d:c14f
[   40.135516] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 0 testmode 0
[   40.136046] ath10k_pci 0000:01:00.0: firmware ver WLAN.RM.4.4-00022-QCARMSWPZ-2 api 6 features wowlan,ignore-otp crc32 4d458559
[   40.200646] ath10k_pci 0000:01:00.0: failed to fetch board data for bus=pci,vendor=168c,device=003e,subsystem-vendor=144d,subsystem-device=c14f,variant=K from ath10k/QCA6174/hw3.0/board-2.bin
[   40.200664] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A crc32 d0d18eef
[   40.769329] ath10k_pci 0000:01:00.0: Unknown eventid: 90118
[   40.769912] ath10k_pci 0000:01:00.0: htt-ver 3.32 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[   40.846830] ath: EEPROM regdomain: 0x5f
[   40.846831] ath: EEPROM indicates we should expect a direct regpair map
[   40.846832] ath: invalid regulatory domain/country code 0x5f
[   40.846832] ath: Invalid EEPROM contents
[   40.846837] ath10k_pci 0000:01:00.0: failed to initialise regulatory: -22
[   40.846839] ath10k_pci 0000:01:00.0: could not register to mac80211 (-22)

How can I help? The OEM developers are all windows people, so discussing Linux driver needs/specifics with them will be a bit of a challenge. Is there something I can ask for or get for you? As I said in my first mail, I already checked on GPIO's possibly powering down the device etc. and verified with the board HW/Driver devs that it's powered up as desired. Without background on the chips themselves, which driver bin files do what on what chips is a bit of a mystery which I assume you have far better insight into... :)

So what can I do to help? P.S. Thanks very much for the help/response. :)

-- 
------------- Codito, ergo sum - "I code, therefore I am" --------------
Carsten Haitzler - raster@rasterman.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
