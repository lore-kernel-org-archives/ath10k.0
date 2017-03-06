Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ua0-x234.google.com ([2607:f8b0:400c:c08::234])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ckzQr-0004LB-Mc
 for ath10k@lists.infradead.org; Mon, 06 Mar 2017 20:40:40 +0000
Received: by mail-ua0-x234.google.com with SMTP id f54so183129577uaa.1
 for <ath10k@lists.infradead.org>; Mon, 06 Mar 2017 12:40:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <57d35087-5454-8355-1f7f-5fdfec948f97@qca.qualcomm.com>
References: <CAMQd7mbOEz0SChV=QcZ_=cWLg9zv3f4zhH9r7YVwC_O6tE-UUw@mail.gmail.com>
 <87r330pzr9.fsf@kamboji.qca.qualcomm.com>
 <CAMQd7mZ294nvukbVsdUR_HjkcyJ=sU7BBkXxeDHhKo-cTsyPBw@mail.gmail.com>
 <CAMQd7mZw6zNm07rz2fCy6LZ4ob3WbazjeQ0Z-FgTrUCXnbH4zA@mail.gmail.com>
 <CAMQd7magEO3eeweF7a65GwDvytOXgW5-kBLsG5Wd7zu9=G3tsg@mail.gmail.com>
 <c347bfca-02c3-ea6f-ef46-33b474273be8@qca.qualcomm.com>
 <57d35087-5454-8355-1f7f-5fdfec948f97@qca.qualcomm.com>
From: Enrico Tagliavini <enrico.tagliavini@gmail.com>
Date: Mon, 6 Mar 2017 21:40:07 +0100
Message-ID: <CAMQd7ma-DXZsOyr_x=OPrU4v6knWDo7RgyGCApOukkHpG9a-YQ@mail.gmail.com>
Subject: Re: Suspend resume broken since 4.9
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
To: "Hsu, Ryan" <ryanhsu@qca.qualcomm.com>
Cc: ath10k <ath10k@lists.infradead.org>

Hello Ryan,

   I quickly tried the change you named. I used kernel 4.10.0 as found
in linux.git (tag v4.10). I know this was broken as I tested it at the
very beginning of my bisect.

Changing the wlan_mac_base_address to 0x00010000 had no visible
change. Suspend to RAM was still broken. So I tried to revert the
commit ebee76f7fa46. Still nothing, suspend to ram still failed. Other
than that wireless worked, I did nothing more than a ping, but it
worked.

I guess I have to keep going with the bisect. I don't know when I'll
be done with it. I'm in the middle of an home movement which is not
going as planned, so I'm quite busy solving urgent shenanigans, bear
with me and sorry about that.

Thank you.
Kind regards.

On 6 March 2017 at 20:36, Hsu, Ryan <ryanhsu@qca.qualcomm.com> wrote:
> + ath10k list, wasn't intended to send it privately, adding the list back.
>
>
> On 03/06/2017 10:40 AM, Ryan Hsu wrote:
>> On 03/06/2017 08:43 AM, Enrico Tagliavini wrote:
>>
>>> Assuming this doesn't make sense I assume the only mistake I might
>>> have maid was marking 05ee799f2021658cc0fc64c1f05c940877b90724 as
>>> good. And who knows maybe it was not even a mistake maybe it was a
>>> fluke it worked. Doesn't really matter. I guess what I have to do is
>>> to restart the bisect, mark v4.8 good and
>>> 05ee799f2021658cc0fc64c1f05c940877b90724 bad and keep going.
>>>
>>> Am I right?
>> Yes, this would be the same I would try.
>> And I happened to try this last weekend and I could see it works after reverting the change.
>>
>> ebee76f7fa46 ("ath10k: allow setting coverage class").
>>
>> I haven't figured out the clue why it randomly failed.
>>
>> But the original changes seems to be leveraging the work from ath9k, but those register address doesn't completely apply for QCA6174.
>>
>> Since the set_coverage_class.ops in my QCA6174 card seems to read the incorrect value and always failed to set to hw.
>> Even the address base is correct, so I guess other register offset might be incorrect as well...  so I planned to remove that ops from QCA6174 later.
>>
>> Could you either revert the commit or just changes the wlan_mac_base_address to see if that helps?
>>
>> --- a/drivers/net/wireless/ath/ath10k/hw.c
>> +++ b/drivers/net/wireless/ath/ath10k/hw.c
>> @@ -51,7 +51,7 @@
>>         .rtc_soc_base_address                   = 0x00000800,
>>         .rtc_wmac_base_address                  = 0x00001000,
>>         .soc_core_base_address                  = 0x0003a000,
>> -       .wlan_mac_base_address                  = 0x00020000,
>> +       .wlan_mac_base_address                  = 0x00010000,
>>         .ce_wrapper_base_address                = 0x00034000,
>>         .ce0_base_address                       = 0x00034400,
>>         .ce1_base_address                       = 0x00034800,
>>
>> Ryan

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
