Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bqy3o-0007d7-S9
 for ath10k@lists.infradead.org; Mon, 03 Oct 2016 07:53:17 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/2] ath10k: add platform regulatory domain support
Date: Mon, 3 Oct 2016 07:52:51 +0000
Message-ID: <877f9pswbx.fsf@kamboji.qca.qualcomm.com>
References: <1470140454-3899-1-git-send-email-bartosz.markowski@tieto.com>
 <1470140454-3899-3-git-send-email-bartosz.markowski@tieto.com>
 <87bmztm8qm.fsf@kamboji.qca.qualcomm.com>
 <CACKGw+FAwPb2NLW5G8CnGH4X2eCCjUkuJwLoqW9w9rKpDuQJDw@mail.gmail.com>
 <871t0nhsdu.fsf@kamboji.qca.qualcomm.com>
 <CACKGw+GDbiCLsE7VVas7ATDE0aBZOkbBperXQP0c7XASJgXQ=Q@mail.gmail.com>
In-Reply-To: <CACKGw+GDbiCLsE7VVas7ATDE0aBZOkbBperXQP0c7XASJgXQ=Q@mail.gmail.com>	(Bartosz
 Markowski's message of "Mon, 3 Oct 2016 09:43:17 +0200")
Content-Language: en-US
Content-ID: <6ABDCBE322BCDB458807676A87A6F9EA@qualcomm.com>
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
To: "bartosz.markowski@tieto.com" <bartosz.markowski@tieto.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Bartosz Markowski <bartosz.markowski@tieto.com> writes:

> On 14 September 2016 at 09:06, Valo, Kalle <kvalo@qca.qualcomm.com> wrote:
>>
>> Bartosz Markowski <bartosz.markowski@tieto.com> writes:
>>
>> > On 12 September 2016 at 17:35, Valo, Kalle <kvalo@qca.qualcomm.com> wrote:
>> >
>> >> > +#ifdef CONFIG_ACPI
>> >> > +#define WRD_METHOD "WRDD"
>> >> > +#define WRDD_WIFI  (0x07)
>> >> > +
>> >> > +static u32 ath10k_mac_wrdd_get_mcc(struct ath10k *ar, union acpi_object *wrdd)
>> >> > +{
>> >>
>> >> I don't think the ifdef is really necessary, acpi.h should handle that
>> >> (hopefully). Also I changed the error handling to use standard error
>> >> values and changed the info messages to dbg, they are too spammy in my
>> >> opinion. Please check carefully my changes in the pending branch:
>> >>
>> >> https://git.kernel.org/cgit/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=fe91745381ec3999d8de6dedb07b396c82539717
>> >
>> > I'm OK with the changes, I have not tried that though, except of
>> > reviewing and compiling it (do not have access to the chromebook for
>> > next few days). If you want to wait with it until I test it, it's fine
>> > too.
>>
>> Ok, I'll wait for few days in case you have time to test it.
>
>
> Sorry, it took so long. I've final check this and can confirm the patch.

Thanks, I'll apply the patch soon. Do note that I changed more of the
warnings messages to debug level.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
