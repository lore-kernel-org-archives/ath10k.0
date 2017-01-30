Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cY24I-0004rE-24
 for ath10k@lists.infradead.org; Mon, 30 Jan 2017 02:51:47 +0000
Received: by mail-wm0-f53.google.com with SMTP id c85so195207886wmi.1
 for <ath10k@lists.infradead.org>; Sun, 29 Jan 2017 18:51:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHNKnsT8mzHefrnC4ybrR8T16dAqc4G_SDGesxdU7+81xhuYpw@mail.gmail.com>
References: <CAHNKnsRZ6N7EuzCnKR56ER5cpRemSwgnU99CpujE-+uFaJML+w@mail.gmail.com>
 <CAJ-Vmo=yD7Ct5LFXBO3qNhKsNco91VXMmZOYeBaAuw+DFGq=RQ@mail.gmail.com>
 <CAHNKnsT8mzHefrnC4ybrR8T16dAqc4G_SDGesxdU7+81xhuYpw@mail.gmail.com>
From: Adrian Chadd <adrian.chadd@gmail.com>
Date: Sun, 29 Jan 2017 18:50:23 -0800
Message-ID: <CAJ-VmokwMPSg7AW-MkO4JOKKMWc_5O4w-pA2jumhChowFKo0Ug@mail.gmail.com>
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
To: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 29 January 2017 at 17:20, Sergey Ryazanov <ryazanov.s.a@gmail.com> wrote:
> Yep. Looks like so.

Which is good, because my FreeBSD ath10k port only works with 10.1 /
10.2 firmware on earlier chips, and I haven't figured out the
intermediate software queue support that came with 10.4. :-)

But yeah. I'll wake for Kalle to verify, but I think it's a 10.4
thing, and I don't /think/ there's an official 10.4 build for
Peregrine.



-adrian

>
> On Mon, Jan 30, 2017 at 3:08 AM, Adrian Chadd <adrian.chadd@gmail.com> wrote:
>> I think it's a 10.4 feature?
>>
>>
>> A
>>
>> On Jan 29, 2017 3:13 PM, "Sergey Ryazanov" <ryazanov.s.a@gmail.com> wrote:
>>>
>>> Hello,
>>>
>>> I have started to play with intermediate software queues and suddenly
>>> discovered that this code is completely disabled in ath10k for
>>> firmware which does not support tx pull-push mode (QCA9880 in
>>> particular).
>>>
>>> So I would like to ask are there any plans for implementation of this
>>> pull-push feature in QCA9880 firmware or I should consider my NIC
>>> upgrade?
>
> --
> Sergey

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
