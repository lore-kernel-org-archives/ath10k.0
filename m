Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC4ab-0004HU-PG
 for ath10k@lists.infradead.org; Wed, 11 Mar 2020 16:52:16 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH RFT] ath10k: add QCA9377 sdio hw_param item
References: <1569507867-19547-1-git-send-email-kvalo@codeaurora.org>
 <7BB79E29-0ACF-45FB-B802-E4B2F5CA0DFE@gmail.com>
 <03d244cd-3205-6c95-c43e-99bc0135b50a@gmail.com>
Date: Wed, 11 Mar 2020 18:52:05 +0200
In-Reply-To: <03d244cd-3205-6c95-c43e-99bc0135b50a@gmail.com> (Erik
 Stromdahl's message of "Wed, 4 Mar 2020 18:51:57 +0100")
Message-ID: <87imjaomve.fsf@kamboji.qca.qualcomm.com>
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: linux-wireless@vger.kernel.org, Christian Hewitt <christianshewitt@gmail.com>, ath10k@lists.infradead.org

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

> On 3/2/20 12:45 PM, Christian Hewitt wrote:
>>
>>> On 26 Sep 2019, at 6:24 pm, Kalle Valo <kvalo@codeaurora.org> wrote:
>>>
>>> From: Erik Stromdahl <erik.stromdahl@gmail.com>
>>>
>>> Add hardware parameters for QCA9377 sdio devices, it's now properly supported.
>>>
>>> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
>>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

[...]

>> Tested and working fine using Linux 5.6-rc3 and SDIO firmware from [1].
>>
>> [ 5.391369] ath10k_sdio mmc2:0001:1: qca9377 hw1.1 sdio target
>> 0x05020001 chip_id 0x00000000 sub 0000:0000
>> [ 5.391379] ath10k_sdio mmc2:0001:1: kconfig debug 0 debugfs 0
>> tracing 0 dfs 0 testmode 0
>> [ 5.391632] ath10k_sdio mmc2:0001:1: firmware ver
>> WLAN.TF.1.1.1-00061-QCATFSWPZ-1 api 5 features ignore-otp crc32
>> 7746e551
>> [ 5.624198] ath10k_sdio mmc2:0001:1: failed to fetch board data for
>> bus=sdio,vendor=0271,device=0701,subsystem-vendor=0000,subsystem-device=0000
>> from ath10k/QCA9377/hw1.0/board-2.bin
>> [    5.624473] ath10k_sdio mmc2:0001:1: board_file api 1 bmi_id N/A crc32 544289f7
>> [ 6.775882] ath10k_sdio mmc2:0001:1: htt-ver 3.32 wmi-op 4 htt-op 3
>> cal otp max-sta 32 raw 0 hwcrypto 1
>> [    6.854066] ath: EEPROM regdomain sanitized
>> [    6.854073] ath: EEPROM regdomain: 0x64
>> [    6.854075] ath: EEPROM indicates we should expect a direct regpair map
>> [    6.854082] ath: Country alpha2 being used: 00
>> [    6.854083] ath: Regpair used: 0x64
>> [    8.444189] ath: EEPROM regdomain: 0x8114
>> [    8.444194] ath: EEPROM indicates we should expect a country code
>> [    8.444196] ath: doing EEPROM country->regdmn map search
>> [    8.444198] ath: country maps to regdmn code: 0x37
>> [    8.444201] ath: Country alpha2 being used: DE
>> [    8.444203] ath: Regpair used: 0x37
>> [    8.444206] ath: regdomain 0x8114 dynamically updated by country element
>>
>> The test device is an Amlogic S905D STB device from O2.cz that I
>> have just submitted a working device-tree for [2].
>>
>> If you need a QCA9377 test device, I have a duplicate/spare of the
>> box and would be happy to post it.
>>
>> Tested-by: Christian Hewitt <christianshewitt@gmail.com>
>>
>> [1] https://github.com/chewitt/qca-firmware
>> [2] https://patchwork.kernel.org/project/linux-amlogic/list/?series=249525
>>
>
> I have received a lot of questions lately about this patch (why it has
> not been integrated).
> It is actually the only missing piece in order to have working QCA9377
> support on mainline.
>
> Unless there is a good reason not to add it, I think it should be integrated.

Thanks for testing, I applied it now.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
