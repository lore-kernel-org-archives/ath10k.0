Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x22c.google.com ([2607:f8b0:400c:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlHiG-0006Rh-Ux
 for ath10k@lists.infradead.org; Fri, 16 May 2014 12:58:14 +0000
Received: by mail-vc0-f172.google.com with SMTP id hr9so6119020vcb.17
 for <ath10k@lists.infradead.org>; Fri, 16 May 2014 05:57:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87zjih6ges.fsf@kamboji.qca.qualcomm.com>
References: <CAEFj986_nUoRY7qOf7=6divui_sa2tMnfjd8vS0w00Mk62GqnA@mail.gmail.com>
 <87zjih6ges.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 16 May 2014 20:57:48 +0800
Message-ID: <CAEFj987NqUKyhwe9QmVLjEOFUFN1k391V12PLuMLd9-vawF8vg@mail.gmail.com>
Subject: Re: Protected flag is clear in Monitor Mode
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Do we have the public bug tracker?

Anyone has used the ath10k as monitor interface and facing the same problem?

----
Chun-Yeow

On Fri, May 16, 2014 at 8:45 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
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

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
