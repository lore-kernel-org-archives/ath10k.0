Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ckyS2-0006T5-Dm
 for ath10k@lists.infradead.org; Mon, 06 Mar 2017 19:37:49 +0000
From: "Hsu, Ryan" <ryanhsu@qca.qualcomm.com>
Subject: Re: Suspend resume broken since 4.9
Date: Mon, 6 Mar 2017 19:36:54 +0000
Message-ID: <57d35087-5454-8355-1f7f-5fdfec948f97@qca.qualcomm.com>
References: <CAMQd7mbOEz0SChV=QcZ_=cWLg9zv3f4zhH9r7YVwC_O6tE-UUw@mail.gmail.com>
 <87r330pzr9.fsf@kamboji.qca.qualcomm.com>
 <CAMQd7mZ294nvukbVsdUR_HjkcyJ=sU7BBkXxeDHhKo-cTsyPBw@mail.gmail.com>
 <CAMQd7mZw6zNm07rz2fCy6LZ4ob3WbazjeQ0Z-FgTrUCXnbH4zA@mail.gmail.com>
 <CAMQd7magEO3eeweF7a65GwDvytOXgW5-kBLsG5Wd7zu9=G3tsg@mail.gmail.com>
 <c347bfca-02c3-ea6f-ef46-33b474273be8@qca.qualcomm.com>
In-Reply-To: <c347bfca-02c3-ea6f-ef46-33b474273be8@qca.qualcomm.com>
Content-Language: en-US
Content-ID: <9AD657FDCC110846900BD78F9BB818D9@qualcomm.com>
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
To: Enrico Tagliavini <enrico.tagliavini@gmail.com>, ath10k <ath10k@lists.infradead.org>

+ ath10k list, wasn't intended to send it privately, adding the list back.


On 03/06/2017 10:40 AM, Ryan Hsu wrote:
> On 03/06/2017 08:43 AM, Enrico Tagliavini wrote:
>
>> Assuming this doesn't make sense I assume the only mistake I might
>> have maid was marking 05ee799f2021658cc0fc64c1f05c940877b90724 as
>> good. And who knows maybe it was not even a mistake maybe it was a
>> fluke it worked. Doesn't really matter. I guess what I have to do is
>> to restart the bisect, mark v4.8 good and
>> 05ee799f2021658cc0fc64c1f05c940877b90724 bad and keep going.
>>
>> Am I right?
> Yes, this would be the same I would try.
> And I happened to try this last weekend and I could see it works after reverting the change.
>
> ebee76f7fa46 ("ath10k: allow setting coverage class").
>
> I haven't figured out the clue why it randomly failed.
>
> But the original changes seems to be leveraging the work from ath9k, but those register address doesn't completely apply for QCA6174.
>
> Since the set_coverage_class.ops in my QCA6174 card seems to read the incorrect value and always failed to set to hw.
> Even the address base is correct, so I guess other register offset might be incorrect as well...  so I planned to remove that ops from QCA6174 later.
>
> Could you either revert the commit or just changes the wlan_mac_base_address to see if that helps?
>
> --- a/drivers/net/wireless/ath/ath10k/hw.c
> +++ b/drivers/net/wireless/ath/ath10k/hw.c
> @@ -51,7 +51,7 @@
>         .rtc_soc_base_address                   = 0x00000800,
>         .rtc_wmac_base_address                  = 0x00001000,
>         .soc_core_base_address                  = 0x0003a000,
> -       .wlan_mac_base_address                  = 0x00020000,
> +       .wlan_mac_base_address                  = 0x00010000,
>         .ce_wrapper_base_address                = 0x00034000,
>         .ce0_base_address                       = 0x00034400,
>         .ce1_base_address                       = 0x00034800,
>
> Ryan

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
