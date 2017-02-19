Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cfUFT-0005U6-2G
 for ath10k@lists.infradead.org; Sun, 19 Feb 2017 16:22:09 +0000
Received: by mail-lf0-x241.google.com with SMTP id 86so628100lfv.0
 for <ath10k@lists.infradead.org>; Sun, 19 Feb 2017 08:21:46 -0800 (PST)
Subject: Re: [RFC v3 0/8] ath10k sdio support
References: <1484342771-6160-1-git-send-email-erik.stromdahl@gmail.com>
 <87fujbhb29.fsf@kamboji.qca.qualcomm.com>
 <1c87e0d1-1f14-08bb-2a69-650788fba8dc@gmail.com>
 <877f4ngii5.fsf@kamboji.qca.qualcomm.com>
 <8737fagu28.fsf@kamboji.qca.qualcomm.com>
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Message-ID: <e8e1a379-129a-a8c3-9e1f-fb4c70fd0ab6@gmail.com>
Date: Sun, 19 Feb 2017 17:21:43 +0100
MIME-Version: 1.0
In-Reply-To: <8737fagu28.fsf@kamboji.qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Ok, I'll do another round of checkpatch before I submit anything.
I couldn't find the script you mentioned though (ath10k-check).
Is it some kind of checkpatch wrapper?

Anyway, I have a few warnings related to 'line over 80 chars' that
is really hard to get rid of (without breaking indentation etc.) so
I won't do anything about those for now.

Then there are some other warnings about the BIT macro being preferred
over (1 << x). I have used (1 << x) in some files despite the checkpatch
warning in order to keep the patches consistent with the existing code.
I think the best approach is to have a separate round of cleanup-patches
replacing all (1 << x) with BIT(x).

--
Erik

On 2017-02-19 14:59, Valo, Kalle wrote:
> Kalle Valo <kvalo@qca.qualcomm.com> writes:
>
>> Erik Stromdahl <erik.stromdahl@gmail.com> writes:
>>
>>> I was actually about to email you about this.
>>>
>>> I have made a few more updates to the sdio code so I think it would be
>>> best if I could submit a new series of patches based on this code (v4).
>>>
>>> Then you can tweak it (v5).
>>>
>>> It is only minor updates to the HIF layer (added QCA9377 support) and
>>> a setup of some pll registers.
>>
>> Ok, that sounds good. I'll wait for v4.
>
> Forgot to mention can you run ath10k-check before submitting them, it
> shows few problems:
>
> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/codingstyle#checking_code
>
> But if you wonder what this is about it's checkpatch warning about camel
> case (doesn't like the lower case x character):
>
> drivers/net/wireless/ath/ath10k/sdio.h:68: <ATH10K_SDIO_DRIVE_DTSx_TYPE_C>
>
> I guess I have a bug in the script when it parses checkpatch output.
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
