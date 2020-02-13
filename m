Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2CT6-0004WM-52
 for ath10k@lists.infradead.org; Thu, 13 Feb 2020 11:15:42 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: support PCIe enter L1 state
References: <1542163848-837-1-git-send-email-wgong@codeaurora.org>
 <20181115002836.GA71934@google.com>
 <c94346b26a6d4b11a045a176ca854051@aptaiexm02f.ap.qualcomm.com>
 <20181115184333.GA87504@google.com> <87va4x8q2c.fsf@codeaurora.org>
 <CABvG-CVAnwkiKVJik0PdsmRxF62kKv2N+aRKNq=nbopoExLvDA@mail.gmail.com>
 <87y36q75wr.fsf@kamboji.qca.qualcomm.com>
 <CA+ASDXO8NujrORVLZMPbDy916cnzOvx_Bp8Vr-VvkbBwJvB97A@mail.gmail.com>
 <87h8cd8zy2.fsf@kamboji.qca.qualcomm.com>
 <CA+ASDXM8gtn3=p5pQ=GOFdfTy-698ZPW91JEgAfapdLEcU+eMg@mail.gmail.com>
Date: Thu, 13 Feb 2020 13:15:30 +0200
In-Reply-To: <CA+ASDXM8gtn3=p5pQ=GOFdfTy-698ZPW91JEgAfapdLEcU+eMg@mail.gmail.com>
 (Brian Norris's message of "Mon, 2 Dec 2019 10:48:44 -0800")
Message-ID: <87r1yywxf1.fsf@kamboji.qca.qualcomm.com>
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
To: Brian Norris <briannorris@chromium.org>
Cc: =?utf-8?Q?Micha=C5=82?= Kazior <kazikcz@gmail.com>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>

Brian Norris <briannorris@chromium.org> writes:

> On Fri, Mar 8, 2019 at 1:42 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>> Brian Norris <briannorris@chromium.org> writes:
>> > On Fri, Feb 8, 2019 at 5:42 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>> >> No replies from anyone (including Wen) for 3 months about testing this
>> >> patch on anything else than QCA6174. So I'll drop this now, please
>> >> resubmit once test coverage is better.
>> >
>> > I know this isn't exactly what you're asking for, but FWIW we've been
>> > using this since late November on all our QCA6174 products. No issues
>> > seen as far as I know, and we have seen some power savings.
>>
>> Thanks for the feedback, this is very good to know. I also would like to
>> apply this but not before we have some testing feedback from AP chipsets
>> like QCA988X or QCA9984. Wen, are you planning to test those and
>> resubmit?
>
> May I ping here? We (Chromium OS) are continuing to carry this patch,
> and would love to come up with something that can land upstream. If
> necessary, I can rework it to apply more specifically -- e.g., only to
> QCA6174 PCI IDs.

Yeah, enabling only for QCA6174 sounds best.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
