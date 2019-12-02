Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibqkm-0007BI-C6
 for ath10k@lists.infradead.org; Mon, 02 Dec 2019 18:49:01 +0000
Received: by mail-io1-xd29.google.com with SMTP id z26so509142iot.8
 for <ath10k@lists.infradead.org>; Mon, 02 Dec 2019 10:48:59 -0800 (PST)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com.
 [209.85.166.174])
 by smtp.gmail.com with ESMTPSA id w2sm70754iod.50.2019.12.02.10.48.55
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2019 10:48:55 -0800 (PST)
Received: by mail-il1-f174.google.com with SMTP id r81so686953ilk.0
 for <ath10k@lists.infradead.org>; Mon, 02 Dec 2019 10:48:55 -0800 (PST)
MIME-Version: 1.0
References: <1542163848-837-1-git-send-email-wgong@codeaurora.org>
 <20181115002836.GA71934@google.com>
 <c94346b26a6d4b11a045a176ca854051@aptaiexm02f.ap.qualcomm.com>
 <20181115184333.GA87504@google.com> <87va4x8q2c.fsf@codeaurora.org>
 <CABvG-CVAnwkiKVJik0PdsmRxF62kKv2N+aRKNq=nbopoExLvDA@mail.gmail.com>
 <87y36q75wr.fsf@kamboji.qca.qualcomm.com>
 <CA+ASDXO8NujrORVLZMPbDy916cnzOvx_Bp8Vr-VvkbBwJvB97A@mail.gmail.com>
 <87h8cd8zy2.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87h8cd8zy2.fsf@kamboji.qca.qualcomm.com>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 2 Dec 2019 10:48:44 -0800
Message-ID: <CA+ASDXM8gtn3=p5pQ=GOFdfTy-698ZPW91JEgAfapdLEcU+eMg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: support PCIe enter L1 state
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: =?UTF-8?Q?Micha=C5=82_Kazior?= <kazikcz@gmail.com>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>

On Fri, Mar 8, 2019 at 1:42 AM Kalle Valo <kvalo@codeaurora.org> wrote:
> Brian Norris <briannorris@chromium.org> writes:
> > On Fri, Feb 8, 2019 at 5:42 AM Kalle Valo <kvalo@codeaurora.org> wrote:
> >> No replies from anyone (including Wen) for 3 months about testing this
> >> patch on anything else than QCA6174. So I'll drop this now, please
> >> resubmit once test coverage is better.
> >
> > I know this isn't exactly what you're asking for, but FWIW we've been
> > using this since late November on all our QCA6174 products. No issues
> > seen as far as I know, and we have seen some power savings.
>
> Thanks for the feedback, this is very good to know. I also would like to
> apply this but not before we have some testing feedback from AP chipsets
> like QCA988X or QCA9984. Wen, are you planning to test those and
> resubmit?

May I ping here? We (Chromium OS) are continuing to carry this patch,
and would love to come up with something that can land upstream. If
necessary, I can rework it to apply more specifically -- e.g., only to
QCA6174 PCI IDs.

Thanks,
Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
