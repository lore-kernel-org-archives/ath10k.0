Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yw0-f180.google.com ([209.85.161.180])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cY0g1-0003s1-R7
 for ath10k@lists.infradead.org; Mon, 30 Jan 2017 01:22:39 +0000
Received: by mail-yw0-f180.google.com with SMTP id v200so46912419ywc.3
 for <ath10k@lists.infradead.org>; Sun, 29 Jan 2017 17:22:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAJ-Vmo=yD7Ct5LFXBO3qNhKsNco91VXMmZOYeBaAuw+DFGq=RQ@mail.gmail.com>
References: <CAHNKnsRZ6N7EuzCnKR56ER5cpRemSwgnU99CpujE-+uFaJML+w@mail.gmail.com>
 <CAJ-Vmo=yD7Ct5LFXBO3qNhKsNco91VXMmZOYeBaAuw+DFGq=RQ@mail.gmail.com>
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Date: Mon, 30 Jan 2017 04:20:51 +0300
Message-ID: <CAHNKnsT8mzHefrnC4ybrR8T16dAqc4G_SDGesxdU7+81xhuYpw@mail.gmail.com>
Subject: Re: QCA988X firmware pull-push support
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
To: Adrian Chadd <adrian.chadd@gmail.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org

Yep. Looks like so.

On Mon, Jan 30, 2017 at 3:08 AM, Adrian Chadd <adrian.chadd@gmail.com> wrote:
> I think it's a 10.4 feature?
>
>
> A
>
> On Jan 29, 2017 3:13 PM, "Sergey Ryazanov" <ryazanov.s.a@gmail.com> wrote:
>>
>> Hello,
>>
>> I have started to play with intermediate software queues and suddenly
>> discovered that this code is completely disabled in ath10k for
>> firmware which does not support tx pull-push mode (QCA9880 in
>> particular).
>>
>> So I would like to ask are there any plans for implementation of this
>> pull-push feature in QCA9880 firmware or I should consider my NIC
>> upgrade?

--
Sergey

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
