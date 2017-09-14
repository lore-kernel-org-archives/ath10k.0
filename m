Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from kirsty.vergenet.net ([202.4.237.240])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dsIBq-0008GG-Ij
 for ath10k@lists.infradead.org; Thu, 14 Sep 2017 00:39:37 +0000
Date: Thu, 14 Sep 2017 09:38:53 +0900
From: Carsten Haitzler <raster@rasterman.com>
Subject: Re: failed to fetch board data QCA6174
Message-Id: <20170914093853.583016de847d39f624326ff6@rasterman.com>
In-Reply-To: <4974930b-1fd3-1341-99a1-28ebe55fcce4@qti.qualcomm.com>
References: <c1f6096c-7445-7862-a5df-b96211be9df3@gmail.com>
 <8d3a8d6f-5191-d1fa-784b-28cab8b407d5@qti.qualcomm.com>
 <e87292ba-a00c-edf9-2c02-5be14750bb60@gmail.com>
 <d4b43397-3267-abff-fbc1-48cbd9d58073@qti.qualcomm.com>
 <20170913091536.aefe1f16e91dcec2c69ee7b5@rasterman.com>
 <e24d670c-b239-5596-d175-d6b79c660966@qti.qualcomm.com>
 <20170913215659.afd05b8889b4f2eb943db76c@rasterman.com>
 <4974930b-1fd3-1341-99a1-28ebe55fcce4@qti.qualcomm.com>
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

On Wed, 13 Sep 2017 18:23:37 +0000 Ryan Hsu <ryanhsu@qti.qualcomm.com> said:

> On 09/13/2017 05:56 AM, Carsten Haitzler wrote:
> 
> > Absolutely. Well ... my first port of call instead of teh above site/url
> > was to use the matching file in the Qualcomm windows driver directory i
> > copied off windows before nuking it.  same filename.
> > eeprom_ar6320_3p0_SS_720.bin. also there's eeprom_ar6320_3p0_SS_720_K.bin
> > too. I tried both... and:
> >
> > [  154.007574] ath10k_pci 0000:01:00.0: qca6174 hw3.2 target 0x05030000
> > chip_id 0x00340aff sub 144d:c14f [  154.007577] ath10k_pci 0000:01:00.0:
> > kconfig debug 0 debugfs 1 tracing 0 dfs 0 testmode 0 [  154.008207]
> > ath10k_pci 0000:01:00.0: firmware ver WLAN.RM.4.4-00022-QCARMSWPZ-2 api 6
> > features wowlan,ignore-otp crc32 4d458559 [  154.072786] ath10k_pci
> > 0000:01:00.0: failed to fetch board data for
> > bus=pci,vendor=168c,device=003e,subsystem-vendor=144d,subsystem-device=c14f,variant=K
> > from ath10k/QCA6174/hw3.0/board-2.bin [  154.072807] ath10k_pci
> > 0000:01:00.0: board_file api 1 bmi_id N/A crc32 ed5f849a [  154.640347]
> > ath10k_pci 0000:01:00.0: Unknown eventid: 90118 [  157.709005] ath10k_pci
> > 0000:01:00.0: failed to ping firmware: -110 [  157.709019] ath10k_pci
> > 0000:01:00.0: failed to reset rx filter: -110 [  157.782164] ath10k_pci
> > 0000:01:00.0: could not init core (-110) [  157.782206] ath10k_pci
> > 0000:01:00.0: could not probe fw (-110)
> 
> So that means the eeprom_ar6320_3p0_SS_720.bin is not the one then, thanks I
> overlooked the k variant, but thanks for trying that as well.
> 
> > and for the _K variant:
> >
> > [  372.001685] ath10k_pci 0000:01:00.0: qca6174 hw3.2 target 0x05030000
> > chip_id 0x00340aff sub 144d:c14f [  372.001687] ath10k_pci 0000:01:00.0:
> > kconfig debug 0 debugfs 1 tracing 0 dfs 0 testmode 0 [  372.002098]
> > ath10k_pci 0000:01:00.0: firmware ver WLAN.RM.4.4-00022-QCARMSWPZ-2 api 6
> > features wowlan,ignore-otp crc32 4d458559 [  372.066672] ath10k_pci
> > 0000:01:00.0: failed to fetch board data for
> > bus=pci,vendor=168c,device=003e,subsystem-vendor=144d,subsystem-device=c14f,variant=K
> > from ath10k/QCA6174/hw3.0/board-2.bin [  372.066691] ath10k_pci
> > 0000:01:00.0: board_file api 1 bmi_id N/A crc32 ad2a5746 [  372.634622]
> > ath10k_pci 0000:01:00.0: Unknown eventid: 90118 [  372.635466] ath10k_pci
> > 0000:01:00.0: htt-ver 3.32 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0
> > hwcrypto 1 [  372.713216] ath: EEPROM regdomain: 0x5f [  372.713218] ath:
> > EEPROM indicates we should expect a direct regpair map [  372.713218] ath:
> > invalid regulatory domain/country code 0x5f [  372.713219] ath: Invalid
> > EEPROM contents [  372.713223] ath10k_pci 0000:01:00.0: failed to
> > initialise regulatory: -22 [  372.713225] ath10k_pci 0000:01:00.0: could
> > not register to mac80211 (-22)
> 
> So the _K variant board file seems to be the right one, the firmware is not
> crashing now. But failed due to the unknown country code 0x5f.
> 
> Could you give it a try with this to see if that helped to bring it up your
> case? it might not be the final solution but would appreciate if you could
> help to debug a little bit.
> 
> diff --git a/drivers/net/wireless/ath/regd_common.h
> b/drivers/net/wireless/ath/regd_common.h index bdd2b4d..ef578bf 100644
> --- a/drivers/net/wireless/ath/regd_common.h
> +++ b/drivers/net/wireless/ath/regd_common.h
> @@ -71,6 +71,7 @@ enum EnumRd {
>         APL7_FCCA = 0x5C,
>         APL8_WORLD = 0x5D,
>         APL9_WORLD = 0x5E,
> +       APL10_WORLD = 0x5F,
>  
>         WOR0_WORLD = 0x60,
>         WOR1_WORLD = 0x61,
> @@ -194,6 +195,7 @@ static struct reg_dmn_pair_mapping regDomainPairs[] = {
>         {APL6_WORLD, CTL_ETSI, CTL_ETSI},
>         {APL8_WORLD, CTL_ETSI, CTL_ETSI},
>         {APL9_WORLD, CTL_ETSI, CTL_ETSI},
> +       {APL10_WORLD, CTL_ETSI, CTL_ETSI},
>  
>         {APL3_FCCA, CTL_FCC, CTL_FCC},
>         {APL7_FCCA, CTL_FCC, CTL_FCC},
> @@ -410,7 +412,7 @@ static struct country_code_to_enum_rd allCountries[] = {
>         {CTRY_JORDAN, ETSI2_WORLD, "JO"},
>         {CTRY_KAZAKHSTAN, NULL1_WORLD, "KZ"},
>         {CTRY_KOREA_NORTH, APL9_WORLD, "KP"},
> -       {CTRY_KOREA_ROC, APL9_WORLD, "KR"},
> +       {CTRY_KOREA_ROC, APL10_WORLD, "KR"},
>         {CTRY_KOREA_ROC2, APL2_WORLD, "K2"},
>         {CTRY_KOREA_ROC3, APL9_WORLD, "K3"},
>         {CTRY_KUWAIT, ETSI3_WORLD, "KW"},

applied against 4.13.0 ... and using the above K board bin variant... and we're
working! wifi is up... it's even stable... seemingly. (i can rsync happily etc.
right now. ssh interactive shell working). so for now.. i declare this bug
"fixed".

now comes step 2. the above patch obviously solves the source side of things.
you'll need to somehow merge the standard linux kernel firmware board.bin with
this one to make it work. i still get:

[    3.371736] ath10k_pci 0000:01:00.0: failed to fetch board data for
bus=pci,vendor=168c,device=003e,subsystem-vendor=144d,subsystem-device=c14f,variant=K
from ath10k/QCA6174/hw3.0/board-2.bin

and:

[    3.939978] ath10k_pci 0000:01:00.0: Unknown eventid: 90118

but for now they seem harmless to things working.

> > same thing. board.bin is small like the windows eeprom files, so it makes
> > sense and works. trying the url above to download from instead... exact
> > same story. checksum for board file is different, but everything else is
> > the same:
> >
> > [   40.135513] ath10k_pci 0000:01:00.0: qca6174 hw3.2 target 0x05030000
> > chip_id 0x00340aff sub 144d:c14f [   40.135516] ath10k_pci 0000:01:00.0:
> > kconfig debug 0 debugfs 1 tracing 0 dfs 0 testmode 0 [   40.136046]
> > ath10k_pci 0000:01:00.0: firmware ver WLAN.RM.4.4-00022-QCARMSWPZ-2 api 6
> > features wowlan,ignore-otp crc32 4d458559 [   40.200646] ath10k_pci
> > 0000:01:00.0: failed to fetch board data for
> > bus=pci,vendor=168c,device=003e,subsystem-vendor=144d,subsystem-device=c14f,variant=K
> > from ath10k/QCA6174/hw3.0/board-2.bin [   40.200664] ath10k_pci
> > 0000:01:00.0: board_file api 1 bmi_id N/A crc32 d0d18eef [   40.769329]
> > ath10k_pci 0000:01:00.0: Unknown eventid: 90118 [   40.769912] ath10k_pci
> > 0000:01:00.0: htt-ver 3.32 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0
> > hwcrypto 1 [   40.846830] ath: EEPROM regdomain: 0x5f [   40.846831] ath:
> > EEPROM indicates we should expect a direct regpair map [   40.846832] ath:
> > invalid regulatory domain/country code 0x5f [   40.846832] ath: Invalid
> > EEPROM contents [   40.846837] ath10k_pci 0000:01:00.0: failed to
> > initialise regulatory: -22 [   40.846839] ath10k_pci 0000:01:00.0: could
> > not register to mac80211 (-22)
> 
> Ok, this is the same case, which board file are you using?

the k variant from the "driver download url" you provided.

> > How can I help? The OEM developers are all windows people, so discussing
> > Linux driver needs/specifics with them will be a bit of a challenge. Is
> > there something I can ask for or get for you? As I said in my first mail, I
> > already checked on GPIO's possibly powering down the device etc. and
> > verified with the board HW/Driver devs that it's powered up as desired.
> > Without background on the chips themselves, which driver bin files do what
> > on what chips is a bit of a mystery which I assume you have far better
> > insight into... :)
> >
> > So what can I do to help? P.S. Thanks very much for the help/response. :)
> >
> 
> A rule of thumb is to reporting the unknown or failure board with logs and
> the model of your laptop, so that we could know what is failing. Windows

It's brand shiny and new... Galaxy book 12 (i5, 8gb version ... that somewhere
also has LTE on board that i am not even going to have a hope in hell of making
it work). :) I also work for Samsung but the team that does this device is a
completely different one... but I can talk to them (and they helped me identify
the GPIO's i need). Thus why I say I can help with things that may need some
reverse engineering normally. But this looked like a firmware issue and the QCA
chip is a "3rd party" unit that I can't help with the internals of.

> driver is a good reference of which firmware is good for your module, we
> don't need them to know the Linux driver itself, as this kind of case is
> mostly due to the mismatch firmware or board files, so if you've access to
> them, try to check what files you should be using, and then we could add that
> back to board-2.bin so that more user can benefit.

Actually... no need for all of that. We've figured it out above. Fantastic. I
no longer need that horrible usb-c hub/dongle and usb wifi thing. Now I can
focus on my other issues to solve (backlight, headphones/speakers, touch
screen going nuts with spurious interrupts after unhibernate...
accelerometers, ...)

Do you need the board bin file?

> -- 
> Ryan Hsu
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
> 


-- 
------------- Codito, ergo sum - "I code, therefore I am" --------------
Carsten Haitzler - raster@rasterman.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
