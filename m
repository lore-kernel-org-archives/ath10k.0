Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qg0-x234.google.com ([2607:f8b0:400d:c04::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmQzm-0003pR-CF
 for ath10k@lists.infradead.org; Mon, 19 May 2014 17:05:03 +0000
Received: by mail-qg0-f52.google.com with SMTP id a108so9370970qge.11
 for <ath10k@lists.infradead.org>; Mon, 19 May 2014 10:04:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87zjih6ges.fsf@kamboji.qca.qualcomm.com>
References: <CAEFj986_nUoRY7qOf7=6divui_sa2tMnfjd8vS0w00Mk62GqnA@mail.gmail.com>
 <87zjih6ges.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 19 May 2014 10:04:39 -0700
Message-ID: <CAJ-VmokauFeQF9FBSzJsPsJKb8o5+kT1FiXYL09mBFm=CEx7Rg@mail.gmail.com>
Subject: Re: Protected flag is clear in Monitor Mode
From: Adrian Chadd <adrian@freebsd.org>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi,

Just create an ath10k project in github under the qca group so you
have a place to stick issues and things like firmware documentation.



-a


On 16 May 2014 05:45, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Yeoh Chun-Yeow <yeohchunyeow@gmail.com> writes:
>
>> I try to use ath10k (firmware version 10.1.467.2-1_ as standalone
>> monitor mode. I assume that monitor mode will allows the frame to pass
>> to upper layer without any modification.
>>
>> But it seems that the protected flag in frame control is clear while I
>> capture with wireshark. I has verified that the ath9k has not such
>> issue and the protected flag is set.
>>
>> So is this a known issue in monitor mode for ath10k?
>
> I don't recall anyone mentioning anything like this so I would say this
> is not a known issue. But on the other hand, I'm notorious in forgetting
> stuff :)
>
> What we really need is a public bug tracker for ath10k.
>
> --
> Kalle Valo
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
