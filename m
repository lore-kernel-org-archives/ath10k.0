Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJMS5-0008B7-1S
 for ath10k@lists.infradead.org; Mon, 18 Aug 2014 12:54:21 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v6 2/8] ath10k: provide firmware crash info via debugfs
References: <20140809180552.29215.58612.stgit@potku.adurom.net>
 <20140809180805.29215.45232.stgit@potku.adurom.net>
 <CA+BoTQ=dO0kr+0tnXpJRoPd7iwGDtPj_cWM=vvMsRgGn1we5ow@mail.gmail.com>
 <878ummdo2l.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQ=0sigYGooKwqy6LtTQXrkg2kP1htofgPRfryiUcwTyrA@mail.gmail.com>
Date: Mon, 18 Aug 2014 15:53:49 +0300
In-Reply-To: <CA+BoTQ=0sigYGooKwqy6LtTQXrkg2kP1htofgPRfryiUcwTyrA@mail.gmail.com>
 (Michal Kazior's message of "Mon, 18 Aug 2014 14:36:59 +0200")
Message-ID: <874mxadkma.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 18 August 2014 13:39, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Michal Kazior <michal.kazior@tieto.com> writes:
>>
>>> On 9 August 2014 20:08, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>>>
>>>> +struct ath10k_dump_file_data {
>>>> +       /* dump file information */
>>>> +
>>>> +       /* "ATH10K-FW-DUMP" */
>>>> +       char df_magic[16];
>>>> +
>>>> +       u32 len;
>>>> +
>>>> +       /* 0x1 if host is big-endian */
>>>> +       u32 big_endian;
>>>
>>> This isn't entirely correct. Depending on host endianess you'll end up
>>> with 0x1 or 0x1000000. This will still work if you do a boolean
>>> evaluation of it in userspace or compare it to 0, but god forbid to
>>> compare it with 0x1.
>>
>> That's true. Didn't you at one point suggest just always using little
>> endian? I think that's simplest approach here.
>
> Yes. I did point that out at some time ago.

Ok. I started converting to use little endian already.

>>>> +       /* some info we can get from ath10k struct that might help */
>>>> +
>>>> +       u8 uuid[16];
>>>> +
>>>> +       u32 chip_id;
>>>> +
>>>> +       /* 0 for now, in place for later hardware */
>>>> +       u32 bus_type;
>>>
>>> Maybe we should have an enum for that instead of using a hardcoded 0?
>>
>> We had that but you removed it in 3a0861fffd223 =)
>
> .. right :-) 

Sorry, I couldn't resist :)

> I suppose we could just remove the bus_type then? We do have an
> unused[128] for future expansion, don't we?

We could, but then we would have to modify the crash dump tools. I would
rather be prepared for this, it's only a u32 anyway. If we have to do
something, I would prefer to get back the enum.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
